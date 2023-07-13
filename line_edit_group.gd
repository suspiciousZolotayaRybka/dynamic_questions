# Author: Isaac Finehout
# Date: 8 July 2023
# Purpose: Control filling in the arrays when user enters information into blanks (aka line edits)

extends Control

var temp_array = []

# Connect each single_entry to the release_all_focus function as they come online
func _process(_delta):
	var callable_on_release_all_focus = Callable(self, "_on_release_all_focus")
	var single_entry_1 = get_tree().get_root().find_child("single_entry_1", true, false)
	if (single_entry_1 != null):
		single_entry_1.connect("release_all_focus", callable_on_release_all_focus)
		var single_entry_2 = get_tree().get_root().find_child("single_entry_2", true, false)
		if (single_entry_2 != null):
			single_entry_2.connect("release_all_focus", callable_on_release_all_focus)
			var single_entry_3 = get_tree().get_root().find_child("single_entry_3", true, false)
			if (single_entry_3 != null):
				single_entry_3.connect("release_all_focus", callable_on_release_all_focus)
				# Remove the process callback to avoid unnecessary checks
				set_process(false)

# These functions receive signals whenever the user enters information in the line edits
func _on_question_text_changed(new_text):
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.QUESTION] = new_text
	QuestionProfile._set_questions_and_answers(temp_array)
func _on_answer_a_text_changed(new_text):
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER_A] = new_text
	QuestionProfile._set_questions_and_answers(temp_array)
func _on_answer_b_text_changed(new_text):
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER_B] = new_text
	QuestionProfile._set_questions_and_answers(temp_array)
func _on_answer_c_text_changed(new_text):
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER_C] = new_text
	QuestionProfile._set_questions_and_answers(temp_array)
func _on_answer_d_text_changed(new_text):
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER_D] = new_text
	QuestionProfile._set_questions_and_answers(temp_array)

func _on_release_all_focus():
	$question.release_focus()
	$answer_a.release_focus()
	$answer_b.release_focus()
	$answer_c.release_focus()
	$answer_d.release_focus()


# Grab the focus of the keyboard depending on what text edit the user enters
func _on_question_mouse_entered():
	$question.grab_focus()
func _on_answer_a_mouse_entered():
	$answer_a.grab_focus()
func _on_answer_b_mouse_entered():
	$answer_b.grab_focus()
func _on_answer_c_mouse_entered():
	$answer_c.grab_focus()
func _on_answer_d_mouse_entered():
	$answer_d.grab_focus()
