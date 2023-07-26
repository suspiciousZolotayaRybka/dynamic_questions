extends Control


# Listen for user input
func _process(_delta):
	if Input.is_physical_key_pressed(KEY_Z):
		print("pressed z")
	if Input.is_physical_key_pressed(KEY_X):
		print("pressed x")
	if Input.is_physical_key_pressed(KEY_C):
		print("pressed c")
	if Input.is_physical_key_pressed(KEY_V):
		print("pressed v")

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
