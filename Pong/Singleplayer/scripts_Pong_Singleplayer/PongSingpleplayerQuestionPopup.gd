extends Control

# Highlight the box the mouse is over
func _on_answer_a_button_mouse_entered():
	remove_all_others_text()
	$Answer_A_Button.text = "✔"
func _on_answer_b_button_mouse_entered():
	remove_all_others_text()
	$Answer_B_Button.text = "✔"
func _on_answer_c_button_mouse_entered():
	remove_all_others_text()
	$Answer_C_Button.text = "✔"
func _on_answer_d_button_mouse_entered():
	remove_all_others_text()
	$Answer_D_Button.text = "✔"

func remove_all_others_text():
	$Answer_A_Button.text = ""
	$Answer_B_Button.text = ""
	$Answer_C_Button.text = ""
	$Answer_D_Button.text = ""


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
