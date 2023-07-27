extends Control

@onready var countdown_label: Label = $PongMultiplayerLeftQuestionCountdownLabel
@onready var countdown: Timer = $PongMultiplayerLeftQuestionCountdown

signal left_player_chose_a
signal left_player_chose_b
signal left_player_chose_c
signal left_player_chose_d

# Listen for user input
func _process(_delta):
	# Emit a signal depending on what the user enters
	# Hide the player 
	if Input.is_physical_key_pressed(KEY_1):
		left_player_chose_a.emit()
		self.visible = false
		get_tree().paused = false
	if Input.is_physical_key_pressed(KEY_2):
		left_player_chose_b.emit()
		self.visible = false
		get_tree().paused = false
	if Input.is_physical_key_pressed(KEY_3):
		left_player_chose_c.emit()
		self.visible = false
		get_tree().paused = false
	if Input.is_physical_key_pressed(KEY_4):
		left_player_chose_d.emit()
		self.visible = false
		get_tree().paused = false
	countdown_label.text = str(int(countdown.time_left))

# Decide whether or not the answer is correct based on user input.
func _on_answer_a_button_pressed():
	get_tree().paused = false
	if (QuestionProfile.questions_and_answers[QuestionProfile.current_question][QuestionProfile.ANSWER] == 1):
		get_tree().get_root().find_child("PongSingleplayerMain", true, false).user_answered_correctly()
	else:
		get_tree().get_root().find_child("PongSingleplayerMain", true, false).user_answered_incorrectly()
func _on_answer_b_button_pressed():
	get_tree().paused = false
	if (QuestionProfile.questions_and_answers[QuestionProfile.current_question][QuestionProfile.ANSWER] == 2):
		get_tree().get_root().find_child("PongSingleplayerMain", true, false).user_answered_correctly()
	else:
		get_tree().get_root().find_child("PongSingleplayerMain", true, false).user_answered_incorrectly()
func _on_answer_c_button_pressed():
	get_tree().paused = false
	if (QuestionProfile.questions_and_answers[QuestionProfile.current_question][QuestionProfile.ANSWER] == 3):
		get_tree().get_root().find_child("PongSingleplayerMain", true, false).user_answered_correctly()
	else:
		get_tree().get_root().find_child("PongSingleplayerMain", true, false).user_answered_incorrectly()
func _on_answer_d_button_pressed():
	get_tree().paused = false
	if (QuestionProfile.questions_and_answers[QuestionProfile.current_question][QuestionProfile.ANSWER] == 4):
		get_tree().get_root().find_child("PongSingleplayerMain", true, false).user_answered_correctly()
	else:
		get_tree().get_root().find_child("PongSingleplayerMain", true, false).user_answered_incorrectly()
