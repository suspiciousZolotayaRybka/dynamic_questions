# Author: Isaac Finehout
# Date: 6 July 2023
# Purpose: The main scene of the program.
# The QuestionProfile singleton is initialized in ask_for_number_of_questions
# Contact: isaac.finehout@us.af.mil
#TODO I need to congregate all TODO's right here
# Clean up program flow
# ask_for_number_of_questions should have a load file button
#==================================================================
# BUGS
# Receive the error "transient parent has another exclusive child" for dialog boxes, but it's not hurting anything so I'm ignoring it
# next not disabled for page with two question and page with one question

extends Node2D

func _ready():
	# Initial popup informing user to enter questions in order of difficulty
	var instruction_dialog_string = "Please enter your questions in increasing level of difficulty.\n"
	instruction_dialog_string += "           Question 1 = easiest\n"
	instruction_dialog_string += "           ...\n"
	instruction_dialog_string += "           Question %d = hardest" % QuestionProfile._get_num_questions()
	$instruction_dialog.dialog_text = instruction_dialog_string
