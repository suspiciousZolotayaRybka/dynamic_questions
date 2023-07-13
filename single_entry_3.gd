# Author: Isaac Finehout
# Date: 7 July 2023
# Purpose: Control data for the line_edits inside of the question pages
# current_question starts at 3 and is subtracted by nothing in the current_question formula

extends Node2D

# The local variable current_question is for each single entry specifically
signal release_all_focus
var current_question : int

# Set the question_label and text boxes for the scene
func _ready():
	# Set current_question
	current_question = ((QuestionProfile._get_current_page())*3 - 1)
	# Ensure single_entry_3 is not disabled
	QuestionProfile._set_is_single_entry_3_disabled(false)
	# Connect the signal to change the line edits according to the questions_and_answers array
	var callable_on_current_page_changed = Callable(self, "_on_current_page_changed")
	QuestionProfile.connect("current_page_changed", callable_on_current_page_changed)
	$question_label.text = "%d" % [current_question + 1]
	# Set the line edits and the buttons
	set_line_edits()
	set_option_buttons()
	# Always give focus to first section when exitting from page_of_two_questions or page_of_one_question
	get_tree().get_root().find_child("third_section_outline", true, false).editor_only = true

# If questions and answers do not exist in the QuestionProfile.questions_and_answers->
#     leave the placeholder text in
# Otherwise, fill in with what the user already entered
func set_line_edits():
	var count = 0
	var line_edit_group = [$line_edit_group/question, $line_edit_group/answer_a
						 , $line_edit_group/answer_b, $line_edit_group/answer_c
						 , $line_edit_group/answer_d]
	for line_edit in line_edit_group:
		# Subtract one for array indexing
		if (QuestionProfile._get_questions_and_answers()[current_question][count] == ""):
			# If user hasn't entered anything, leave the placeholder text
			line_edit.text = ""
		else:
			# If user has entered data, fill it in
			line_edit.text = QuestionProfile._get_questions_and_answers()[current_question][count]
		count += 1

# If the ANSWER index (index 5) is -1
#     leave all options unselected
# Otherwise, choose the user's option
func set_option_buttons():
	var option_button_group = [$button_group/answer_button_a, $button_group/answer_button_b
							 , $button_group/answer_button_c, $button_group/answer_button_d]
	# Subtract one for indexing in arrays
	if (QuestionProfile._get_questions_and_answers()[current_question][QuestionProfile.ANSWER] == -1):
		for option_button in option_button_group:
			option_button.button_pressed = false
	else:
		# Godot's switch statement
		match (QuestionProfile._get_questions_and_answers()[current_question][QuestionProfile.ANSWER]):
			QuestionProfile.ANSWER_A:
				option_button_group[0].button_pressed = true
			QuestionProfile.ANSWER_B:
				option_button_group[1].button_pressed = true
			QuestionProfile.ANSWER_C:
				option_button_group[2].button_pressed = true
			QuestionProfile.ANSWER_D:
				option_button_group[3].button_pressed = true

# When the setter function from QuestionProfile is called, it emits the current_page_changed signal
func _on_current_page_changed():
	if (not(QuestionProfile._get_is_single_entry_3_disabled())):
		current_question = ((QuestionProfile._get_current_page())*3 - 1)
		$question_label.text = "%d" % [current_question + 1]
		set_line_edits()
		set_option_buttons()

# When the player enters the third section, set the correct current_question
func _on_third_section_mouse_entered():
	if (not(QuestionProfile._get_is_single_entry_3_disabled())):
		# If user comes from another section, remove focus from the old section
		# Ensures a user can't move the mouse into a different question and type, causing a bug where questions are placed incorrectly in the array
		if (QuestionProfile._get_current_section() != 3):
			emit_signal("release_all_focus")
		get_tree().get_root().find_child("first_section_outline", true, false).editor_only = true
		get_tree().get_root().find_child("second_section_outline", true, false).editor_only = true
		get_tree().get_root().find_child("third_section_outline", true, false).editor_only = false
		QuestionProfile._set_current_section(3)
		QuestionProfile._set_current_question(current_question)
