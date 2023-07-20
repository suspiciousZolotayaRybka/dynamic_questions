# Author: Isaac Finehout
# Date: 3 July 2023
# Purpose: Control the title screen for the Air Force game Questions input application
extends Button

# declare num_questions, used throughout the class
var num_questions

# Called when the node enters the scene tree for the first time.
# Hide the confirmation window and disable the button until user enters valid input.
func _ready():
	$confirm_questions.visible = false
	self.text = "Enter Number of Questions"
	self.disabled = true

# the parameter user_input is taken from the line edit, whatever the user inputs.
# is_valid_input is assigned return value of get_is_valid_input
# valid input is any integer between 1-300
# if the input is valid, the button is enabled
func _on_proceed_line_edit_text_changed(user_input):
	var is_valid_input = get_is_valid_input(user_input)
	if (is_valid_input):
		text = "Proceed with %s questions" % num_questions
		self.disabled = false
	else:
		self.disabled = true
		text = "Enter a number of questions between 3 - 300"

# used to determine if the user input is valid, passed user_input,
# and assigns num_customers any valid input
func get_is_valid_input(user_input):
	if (user_input.is_valid_float()):
		num_questions = int(user_input)
		if ((3 < num_questions and num_questions < 301)) :
			return true
	else:
		return false

func _on_pressed():
	$confirm_questions.title = "Confirmation"
	$confirm_questions.dialog_text = "Proceed with " + str(num_questions) + " questions?"
	$confirm_questions.visible = true

func _on_confirm_questions_confirmed():
	# When the user confirms their question numebr, prepare QuestionProfile for the main scene
	QuestionProfile._set_num_questions(num_questions)
	# Start on page 1
	QuestionProfile._set_current_page(1)
	
	# Fill in the questions_and_answers array with empty strings, and option button indices with -1.
	# The state of the empty string is used as a condition to determine if the line edit shows its placeholder or not.
	# -1 indicates that no option is selected.
	var temp_questions_and_answers = []
	for i in QuestionProfile._get_num_questions():
		temp_questions_and_answers.append(["","","","","",-1])
	QuestionProfile._set_questions_and_answers(temp_questions_and_answers)
	get_tree().change_scene_to_file("res://EditQuestionProject/scenes_EditQuestionProject/main_dynamic_questions.tscn")
