extends Node

#TODO 
#Randomizer
#Answer question
#End the game screen

@export var LeftPlayerScore: int = 0
@export var RightPlayerScore: int = 0
@export var question_with_answers: Array 

@onready var pong_multiplayer_question: Area2D = $PongMultiplayerQuestion
@onready var left_popup: Control = $PongMultiplayerLeftPlayerQuestionPopup
@onready var right_popup: Control = $PongMultiplayerRightPlayerQuestionPopup
@onready var ball: CharacterBody2D = get_tree().get_root().find_child("PongMultiplayerBall", true, false)
@onready var temp_questions_and_answers: Array = QuestionProfile._get_questions_and_answers().duplicate(true)
@onready var countdown_timer: Timer = $PongMultiplayerCountdownTimer
@onready var countdown_label: Label = $PongMultiplayerCountdownLabel


signal left_player_won_multiplayer_pong
signal right_player_won_multiplayer_pong

func _ready():
	get_tree().call_group("MultiplayerBallGroup", "stop_ball")
	countdown_timer.start()
	countdown_label.visible = true
	# Connect left player's signals for answering
	left_popup.left_player_chose_a.connect(_on_left_player_chose_a)
	left_popup.left_player_chose_b.connect(_on_left_player_chose_b)
	left_popup.left_player_chose_c.connect(_on_left_player_chose_c)
	left_popup.left_player_chose_d.connect(_on_left_player_chose_d)
	# Connect right player's signals for answering
	right_popup.right_player_chose_a.connect(_on_right_player_chose_a)
	right_popup.right_player_chose_b.connect(_on_right_player_chose_b)
	right_popup.right_player_chose_c.connect(_on_right_player_chose_c)
	right_popup.right_player_chose_d.connect(_on_right_player_chose_d)

func _process(_delta):
	countdown_label.text = str(int(countdown_timer.time_left + 1))

func _on_pong_multiplayer_left_player_side_body_entered(_body):
	score_achieved()
	RightPlayerScore += 1
	if RightPlayerScore >= 20:
		pass
		#TODO QuestionProfile.is_left_player_won_pong = false
		#TODO get_tree().change_scene_to_file("res://Pong/Singleplayer/scenes_Pong_Singleplayer/PongSingleplayerGameOver.tscn")
	$PongMultiplayerRightPlayerScore.text = str(RightPlayerScore)
	# Change the right player color to orange, and back to white when PongMultiplayerScoreTimer resets
	$PongMultiplayerRightPlayerScore.label_settings.font_color = Color.ORANGE_RED
	$PongMultiplayerScoreTimer.start()

func _on_pong_multiplayer_right_player_side_body_entered(_body):
	score_achieved()
	LeftPlayerScore += 1
	if LeftPlayerScore >= 20:
		pass
		#TODO QuestionProfile.is_left_player_won_pong = false
		#TODO get_tree().change_scene_to_file("res://Pong/Singleplayer/scenes_Pong_Singleplayer/PongSingleplayerGameOver.tscn")
	$PongMultiplayerLeftPlayerScore.text = str(LeftPlayerScore)
	# Change the right player color to orange, and back to white when PongMultiplayerScoreTimer resets
	$PongMultiplayerLeftPlayerScore.label_settings.font_color = Color.ORANGE_RED
	$PongMultiplayerScoreTimer.start()

func _on_pong_multiplayer_score_timer_timeout():
	# Change each color back to white
	$PongMultiplayerLeftPlayerScore.label_settings.font_color = Color(217, 216, 215, 255)
	$PongMultiplayerRightPlayerScore.label_settings.font_color = Color(217, 216, 215, 255)

func score_achieved():
	$PongMultiplayerBall.position = Vector2 (640, 360)
	get_tree().call_group("MultiplayerBallGroup", "stop_ball")
	countdown_timer.start()
	countdown_label.visible = true
	$PongMultiplayerScoreSound.play()

func _on_pong_multiplayer_countdown_timer_timeout():
	get_tree().call_group("MultiplayerBallGroup", "restart_ball")
	countdown_label.visible = false

func show_question():
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
	var is_last_hit_left: bool = ball.is_last_hit_left
	if (is_last_hit_left):
		get_tree().get_root().find_child("PongMultiplayerLeftQuestionPopupLabel", true, false).text = question_with_answers[QuestionProfile.QUESTION]
		get_tree().get_root().find_child("PongMultiplayerLeftAnswer_A", true, false).text = "a. " + question_with_answers[QuestionProfile.ANSWER_A]
		get_tree().get_root().find_child("PongMultiplayerLeftAnswer_B", true, false).text = "b. " + question_with_answers[QuestionProfile.ANSWER_B]
		get_tree().get_root().find_child("PongMultiplayerLeftAnswer_C", true, false).text = "c. " + question_with_answers[QuestionProfile.ANSWER_C]
		get_tree().get_root().find_child("PongMultiplayerLeftAnswer_D", true, false).text = "d. " + question_with_answers[QuestionProfile.ANSWER_D]
		left_popup.visible = true
	else:
		get_tree().get_root().find_child("PongMultiplayerRightQuestionPopupLabel", true, false).text = question_with_answers[QuestionProfile.QUESTION]
		get_tree().get_root().find_child("PongMultiplayerRightAnswer_A", true, false).text = "a. " + question_with_answers[QuestionProfile.ANSWER_A]
		get_tree().get_root().find_child("PongMultiplayerRightAnswer_B", true, false).text = "b. " + question_with_answers[QuestionProfile.ANSWER_B]
		get_tree().get_root().find_child("PongMultiplayerRightAnswer_C", true, false).text = "c. " + question_with_answers[QuestionProfile.ANSWER_C]
		get_tree().get_root().find_child("PongMultiplayerRightAnswer_D", true, false).text = "d. " + question_with_answers[QuestionProfile.ANSWER_D]
		right_popup.visible = true
		
	# Pause the rest of the game
	get_tree().paused = true
	
	# Hide the question powerup
	pong_multiplayer_question.position = Vector2(100, -300)

func _on_left_player_chose_a():
	if (question_with_answers[QuestionProfile.ANSWER] == 1):
		player_answered_correctly("left")
	else:
		player_answered_incorrectly("left")
	print("pressed 1")
func _on_left_player_chose_b():
	if (question_with_answers[QuestionProfile.ANSWER] == 2):
		player_answered_correctly("left")
	else:
		player_answered_incorrectly("left")
	print("pressed 2")
func _on_left_player_chose_c():
	if (question_with_answers[QuestionProfile.ANSWER] == 3):
		player_answered_correctly("left")
	else:
		player_answered_incorrectly("left")
	print("pressed 3")
func _on_left_player_chose_d():
	if (question_with_answers[QuestionProfile.ANSWER] == 4):
		player_answered_correctly("left")
	else:
		player_answered_incorrectly("left")
	print("pressed 4")

func _on_right_player_chose_a():
	if (question_with_answers[QuestionProfile.ANSWER] == 1):
		player_answered_correctly("right")
	else:
		player_answered_incorrectly("right")
	print("pressed o")
func _on_right_player_chose_b():
	if (question_with_answers[QuestionProfile.ANSWER] == 2):
		player_answered_correctly("right")
	else:
		player_answered_incorrectly("right")
	print("pressed p")
func _on_right_player_chose_c():
	if (question_with_answers[QuestionProfile.ANSWER] == 3):
		player_answered_correctly("right")
	else:
		player_answered_incorrectly("right")
	print("pressed [")
func _on_right_player_chose_d():
	if (question_with_answers[QuestionProfile.ANSWER] == 4):
		player_answered_correctly("right")
	else:
		player_answered_incorrectly("right")
	print("pressed ]")

func player_answered_correctly(x_player: String):
	print(x_player, " answered correctly")
func player_answered_incorrectly(x_player: String):
	print(x_player, " answered incorrectly")
