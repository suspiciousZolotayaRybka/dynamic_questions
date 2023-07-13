# Author: Isaac Finehout
# Date: 8 July 2023
# Purpose: Control filling in the arrays when the buttons for correct answers are chosen

extends Control

var answer_button_group
var temp_array

func _ready():
	# Create a button group with all of the buttons added
	# This creates a radio button like implementation
	answer_button_group = ButtonGroup.new()
	$answer_button_a.set_button_group(answer_button_group)
	$answer_button_b.set_button_group(answer_button_group)
	$answer_button_c.set_button_group(answer_button_group)
	$answer_button_d.set_button_group(answer_button_group)

# Signals from each button to receive the correct answer
func _on_answer_button_a_button_down():
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER] = 1
	QuestionProfile._set_questions_and_answers(temp_array)
func _on_answer_button_b_button_down():
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER] = 2
	QuestionProfile._set_questions_and_answers(temp_array)
func _on_answer_button_c_button_down():
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER] = 3
	QuestionProfile._set_questions_and_answers(temp_array)
func _on_answer_button_d_button_down():
	temp_array = QuestionProfile._get_questions_and_answers()
	temp_array[QuestionProfile._get_current_question()][QuestionProfile.ANSWER] = 4
	QuestionProfile._set_questions_and_answers(temp_array)
