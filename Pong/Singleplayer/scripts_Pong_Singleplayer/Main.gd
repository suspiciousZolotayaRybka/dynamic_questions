extends Node

var PlayerScore = 0
var OpponentScore = 0

signal player_lost_singleplayer_pong
signal player_won_singleplayer_pong

# TODO
# 1 add w and s to left
# 2 add up and down to right
# Add different directions for question label, probably parameters based on whose paddle the ball hit last
# Add functionality to question label, right sounds, scores and directions depending on parameter maybe store it in Querstin Profile
# Make a game over screen

func _ready():
	get_tree().call_group("BallGroup", "stop_ball")
	$CountdownTimer.start()
	$CountdownLabel.visible = true

func _on_player_side_body_entered(_body):
	score_achieved()
	OpponentScore += 1
	if OpponentScore >= 20:
		QuestionProfile.is_left_player_won_pong = false
		get_tree().change_scene_to_file("res://Pong/Singleplayer/scenes_Pong_Singleplayer/game_over_scene.tscn")
	$OpponentScore.text = str(OpponentScore)
	$OpponentScore.label_settings.font_color = Color.ORANGE_RED
	$ScoreTimer.start()

func _on_opponent_side_body_entered(_body):
	score_achieved()
	PlayerScore += 1
	if PlayerScore >= 20:
		QuestionProfile.is_left_player_won_pong = true
		get_tree().change_scene_to_file("res://Pong/Singleplayer/scenes_Pong_Singleplayer/game_over_scene.tscn")
	$PlayerScore.text = str(PlayerScore)
	$PlayerScore.label_settings.font_color = Color.ORANGE_RED
	$ScoreTimer.start()

func _on_score_timer_timeout():
	$PlayerScore.label_settings.font_color = Color(217, 216, 215, 255)
	$OpponentScore.label_settings.font_color = Color(217, 216, 215, 255)

func score_achieved():
	$Ball.position = Vector2 (640, 360)
	get_tree().call_group("BallGroup", "stop_ball")
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()
	$Player.position.x = 22
	$Player.velocity = Vector2(0, 0)
	$Opponent.position.x = 1254
	$Opponent.velocity = Vector2(0, 0)

func _on_countdown_timer_timeout():
	get_tree().call_group("BallGroup", "restart_ball")
	$CountdownLabel.visible = false

func _process(_delta):
	$CountdownLabel.text = str(int($CountdownTimer.time_left + 1))

func show_question():
	get_tree().get_root().find_child("QuestionLabelTimer", true, false).start()
	$Question.position = Vector2 ([randi_range(150, 450), randi_range(830, 1000)][randi()%2], [randi_range(50, 260), randi_range(450, 600)][randi()%2])

func _on_question_body_entered(_body):
	# Set the question to an array of q
	var question: int = randi_range(0, QuestionProfile.num_questions - 1)
	QuestionProfile.current_question = question
	var question_with_answers = QuestionProfile.questions_and_answers[question]
	# Set the popup labels
	get_tree().get_root().find_child("Question_Popup_Label", true, false).text = question_with_answers[QuestionProfile.QUESTION]
	get_tree().get_root().find_child("Answer_A", true, false).text = "a. " + question_with_answers[QuestionProfile.ANSWER_A]
	get_tree().get_root().find_child("Answer_B", true, false).text = "b. " + question_with_answers[QuestionProfile.ANSWER_B]
	get_tree().get_root().find_child("Answer_C", true, false).text = "c. " + question_with_answers[QuestionProfile.ANSWER_C]
	get_tree().get_root().find_child("Answer_D", true, false).text = "d. " + question_with_answers[QuestionProfile.ANSWER_D]
	$QuestionPopup.visible = true
	
	# Pause the rest of the game
	get_tree().paused = true
	
	# User has answered the question, resume the game
	get_tree().get_root().find_child("QuestionLabelTimer", true, false).stop()
	$Question.position = Vector2(100, -300)

func user_answered_correctly():
	PlayerScore += 1
	$PlayerScore.text = str(PlayerScore)
	$PlayerScore.label_settings.font_color = Color.ORANGE_RED
	$ScoreTimer.start()
	$ScoreSound.play()
	$QuestionPopup.visible = false
	$Ball.velocity.x = 3
	$Ball.velocity.y = [-0.8, 0.8][randi() % 2]

func user_answered_incorrectly():
	OpponentScore += 1
	$OpponentScore.text = str(OpponentScore)
	$OpponentScore.label_settings.font_color = Color.ORANGE_RED
	$ScoreTimer.start()
	$ErrorSound.play()
	$QuestionPopup.visible = false
	$Ball.velocity.x = -3
	$Ball.velocity.y = [-0.8, 0.8][randi() % 2]
