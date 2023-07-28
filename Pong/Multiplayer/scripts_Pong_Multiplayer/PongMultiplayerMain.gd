extends Node

#TODO 
#Randomizer
#Answer question
#End the game screen

@export var LeftPlayerScore: int = 0
@export var RightPlayerScore: int = 0
@export var question_with_answers: Array

@onready var pong_multiplayer_question: Area2D = $PongMultiplayerQuestion
@onready var left_popup_container: Node2D = $PongMultiplayerLeftPlayerQuestionPopupContainer
@onready var right_popup_container: Node2D = $PongMultiplayerRightPlayerQuestionPopupContainer
@onready var left_popup: Control
@onready var right_popup: Control
@onready var left_popup_scene = preload("res://Pong/Multiplayer/scenes_Pong_Multiplayer/pong_multiplayer_left_player_question_popup.tscn")
@onready var right_popup_scene = preload("res://Pong/Multiplayer/scenes_Pong_Multiplayer/pong_multiplayer_right_player_question_popup.tscn")
@onready var ball: CharacterBody2D = get_tree().get_root().find_child("PongMultiplayerBall", true, false)
@onready var left_player: CharacterBody2D = $PongMultiplayerLeftPlayer
@onready var right_player: CharacterBody2D = $PongMultiplayerRightPlayer
@onready var score_sound: AudioStreamPlayer2D = $PongMultiplayerScoreSound
@onready var error_sound: AudioStreamPlayer2D = $PongMultiplayerErrorSound
@onready var temp_questions_and_answers: Array = QuestionProfile._get_questions_and_answers().duplicate(true)
@onready var countdown_timer: Timer = $PongMultiplayerCountdownTimer
@onready var powerup_timer: Timer = $PowerupTimer
@onready var countdown_label: Label = $PongMultiplayerCountdownLabel


func _ready():
	get_tree().call_group("MultiplayerBallGroup", "stop_ball")
	countdown_timer.start()
	countdown_label.visible = true

func retrieve_popup_signals(popup_signals_to_retrieve: String):
	if (popup_signals_to_retrieve == "left"):
		# Connect left player's signals for answering
		left_popup.left_player_chose.connect(_on_left_player_chose)
		# Connect the countdown timer timeout signals
		left_popup.countdown_timer_timeout_left.connect(player_answered_incorrectly)
	elif (popup_signals_to_retrieve == "right"):
		# Connect right player's signals for answering
		right_popup.right_player_chose.connect(_on_right_player_chose)
		# Connect the countdown timer timeout signals
		right_popup.countdown_timer_timeout_right.connect(player_answered_incorrectly)

func _process(_delta):
	countdown_label.text = str(int(countdown_timer.time_left + 1))

func _on_pong_multiplayer_left_player_side_body_entered(_body):
	score_achieved()
	RightPlayerScore += 1
	update_player_score("right")

func _on_pong_multiplayer_right_player_side_body_entered(_body):
	score_achieved()
	LeftPlayerScore += 1
	update_player_score("left")

func _on_pong_multiplayer_score_timer_timeout():
	# Change each color back to white
	$PongMultiplayerLeftPlayerScore.label_settings.font_color = Color(217, 216, 215, 255)
	$PongMultiplayerRightPlayerScore.label_settings.font_color = Color(217, 216, 215, 255)

func score_achieved():
	$PongMultiplayerBall.position = Vector2 (640, 360)
	get_tree().call_group("MultiplayerBallGroup", "stop_ball")
	countdown_timer.start()
	countdown_label.visible = true
	score_sound.play()

func _on_pong_multiplayer_countdown_timer_timeout():
	get_tree().call_group("MultiplayerBallGroup", "restart_ball")
	countdown_label.visible = false

func show_question():
	#TODO delete testing: pong_multiplayer_question.position = Vector2(640, 360)
	pong_multiplayer_question.position = Vector2 ([randi_range(150, 450), randi_range(830, 1000)][randi()%2], [randi_range(50, 260), randi_range(450, 600)][randi()%2])

func _on_pong_multiplayer_question_body_entered(_body):
	# Find the question to show to the user, randomize, condense to proper size, and pop out of the temp array
	var question_num: int = randi_range(0, (len(temp_questions_and_answers) - 1))
	question_with_answers.clear()
	question_with_answers = temp_questions_and_answers.pop_at(question_num)
	question_with_answers = QuestionProfile.condense_question_with_answers(question_with_answers, 50, 65)
	question_with_answers = QuestionProfile.randomize_answers(question_with_answers)
	# Restore the questions if they are three or less
	if (len(temp_questions_and_answers) <= 2):
		temp_questions_and_answers = QuestionProfile._get_questions_and_answers().duplicate(true)
	# See who hit the ball last, and open their according question_scene
	# Free the queue for other player's question popups so they do not interfere
	var is_last_hit_left: bool = ball.is_last_hit_left
	if (is_last_hit_left):
		free_popup_queues()
		left_popup = left_popup_scene.instantiate()
		left_popup_container.add_child(left_popup)
		# Retrieve the popup signals for left_popup
		retrieve_popup_signals("left")
		# Set the label settings of the popup (children 2-6 are the question and answers labels)
		left_popup.get_child(2).text = question_with_answers[QuestionProfile.QUESTION]
		left_popup.get_child(3).text = "a. " + question_with_answers[QuestionProfile.ANSWER_A]
		left_popup.get_child(4).text = "b. " + question_with_answers[QuestionProfile.ANSWER_B]
		left_popup.get_child(5).text = "c. " + question_with_answers[QuestionProfile.ANSWER_C]
		left_popup.get_child(6).text = "d. " + question_with_answers[QuestionProfile.ANSWER_D]
		left_popup.countdown_timer.start()
		left_popup.visible = true
	else:
		free_popup_queues()
		right_popup = right_popup_scene.instantiate()
		right_popup_container.add_child(right_popup)
		# Retrieve the popup signals for right_popup
		retrieve_popup_signals("right")
		# Set the label settings of the popup (children 2-6 are the question and answers labels)
		right_popup.get_child(2).text = question_with_answers[QuestionProfile.QUESTION]
		right_popup.get_child(3).text = "a. " + question_with_answers[QuestionProfile.ANSWER_A]
		right_popup.get_child(4).text = "b. " + question_with_answers[QuestionProfile.ANSWER_B]
		right_popup.get_child(5).text = "c. " + question_with_answers[QuestionProfile.ANSWER_C]
		right_popup.get_child(6).text = "d. " + question_with_answers[QuestionProfile.ANSWER_D]
		right_popup.countdown_timer.start()
		right_popup.visible = true
		
	# Pause the rest of the game
	get_tree().paused = true
	
	# Hide the question powerup
	pong_multiplayer_question.position = Vector2(100, -300)

func free_popup_queues():
	if (right_popup != null):
		right_popup.queue_free()
		right_popup = null
	if (left_popup != null):
		left_popup.queue_free()
		left_popup = null

func _on_left_player_chose(option: int):
	if (option == question_with_answers[QuestionProfile.ANSWER]):
		player_answered_correctly("left")
	else:
		player_answered_incorrectly("left")

func _on_right_player_chose(option: int):
	if (option == question_with_answers[QuestionProfile.ANSWER]):
		player_answered_correctly("right")
	else:
		player_answered_incorrectly("right")

func player_answered_correctly(x_player: String):
	score_sound.play()
	powerup_timer.start()
	ball.speed = 800
	if (x_player == "left"):
		LeftPlayerScore += 1
		update_player_score("left")
		left_player.speed_multiplier = 3
		ball.velocity.x = 1
		print("correct sent ball to the right")
		ball.velocity.y = [0.8,-0.8][randi_range(0, 1)]
	elif (x_player == "right"):
		RightPlayerScore += 1
		update_player_score("right")
		right_player.speed_multiplier = 3
		ball.velocity.x = -1
		print("correct sent ball to the left")
		ball.velocity.y = [0.8,-0.8][randi_range(0, 1)]

func player_answered_incorrectly(x_player: String):
	error_sound.play()
	powerup_timer.start()
	ball.speed = 500
	if (x_player == "left"):
		left_player.speed_multiplier = .75
		ball.velocity.x = -1
		print("incorrect sent ball to the left")
	elif (x_player == "right"):
		right_player.speed_multiplier = .75
		ball.velocity.x = 1
		print("incorrect sent ball to the right")

func _on_powerup_timer_timeout():
	print(ball.velocity)
	print("powerups finished")
	ball.speed = 600
	print(ball.velocity)
	print("\n\n\n\n\n")
	right_player.speed_multiplier = 1
	left_player.speed_multiplier = 1

func update_player_score(x_player):
	if (x_player == "left"):
		$PongMultiplayerLeftPlayerScore.text = str(LeftPlayerScore)
		# Change the right player color to orange, and back to white when PongMultiplayerScoreTimer resets
		$PongMultiplayerLeftPlayerScore.label_settings.font_color = Color.ORANGE_RED
		$PongMultiplayerScoreTimer.start()
		if LeftPlayerScore >= 10:
			QuestionProfile.multiplayer_pong_winner = "Left Player"
			get_tree().change_scene_to_file("res://Pong/Multiplayer/scenes_Pong_Multiplayer/pong_multiplayer_game_over.tscn")
	elif (x_player == "right"):
		$PongMultiplayerRightPlayerScore.text = str(RightPlayerScore)
		# Change the right player color to orange, and back to white when PongMultiplayerScoreTimer resets
		$PongMultiplayerRightPlayerScore.label_settings.font_color = Color.ORANGE_RED
		$PongMultiplayerScoreTimer.start()
		if RightPlayerScore >= 10:
			QuestionProfile.multiplayer_pong_winner = "Right Player"
			get_tree().change_scene_to_file("res://Pong/Multiplayer/scenes_Pong_Multiplayer/pong_multiplayer_game_over.tscn")
