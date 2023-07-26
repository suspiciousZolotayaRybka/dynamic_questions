extends Node

#TODO 
#Randomizer
#Answer question
#End the game screen

@export var LeftPlayerScore: int = 0
@export var RightPlayerScore: int = 0

@onready var pong_multiplayer_question: Area2D = $PongMultiplayerQuestion
@onready var left_popup: Control = $PongMultiplayerLeftPlayerQuestionPopup
@onready var right_popup: Control = $PongMultiplayerRightPlayerQuestionPopup
@onready var ball: CharacterBody2D = get_tree().get_root().find_child("PongMultiplayerBall", true, false)
@onready var temp_questions_and_answers: Array = QuestionProfile._get_questions_and_answers().duplicate(true)

signal left_player_won_multiplayer_pong
signal right_player_won_multiplayer_pong

func _ready():
	get_tree().call_group("MultiplayerBallGroup", "stop_ball")
	$PongMultiplayerCountdownTimer.start()
	$PongMultiplayerCountdownLabel.visible = true

func _process(_delta):
	$PongMultiplayerCountdownLabel.text = str(int($PongMultiplayerCountdownTimer.time_left + 1))

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
	$PongMultiplayerCountdownTimer.start()
	$PongMultiplayerCountdownLabel.visible = true
	$PongMultiplayerScoreSound.play()

func _on_pong_multiplayer_countdown_timer_timeout():
	get_tree().call_group("MultiplayerBallGroup", "restart_ball")
	$PongMultiplayerCountdownLabel.visible = false

func show_question():
	pong_multiplayer_question.position = Vector2 ([randi_range(150, 450), randi_range(830, 1000)][randi()%2], [randi_range(50, 260), randi_range(450, 600)][randi()%2])

func _on_pong_multiplayer_question_body_entered(_body):
	# Find the question to show to the user, randomize, condense to proper size, and pop out of the temp array
	var question_num: int = randi_range(0, (len(temp_questions_and_answers) - 1))
	var question_with_answers: Array = temp_questions_and_answers.pop_at(question_num)
	question_with_answers = QuestionProfile.condense_question_and_answers(question_with_answers, 50, 65)
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

