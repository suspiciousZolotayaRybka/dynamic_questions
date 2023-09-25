# Author: Isaac Finehout
# Date: 7 July 2023
# Purpose: Fix a bug with the next button

extends Node2D

func _ready():
	# When disabled = false by default, the next button in page_navigation
	# Ends up being enabled on the page_of_one_question and page_of_two_questions
	# Therefore, disabled = true by default must be true.
	# Whenever the single_page_of_questions enters, ensure the next button is enabled
	var next_button: Button = get_tree().get_root().find_child("next_button", true, false)
	if (QuestionProfile.current_page != QuestionProfile.num_pages):
		# If the user is on the last page, do no enable the next button
		next_button.disabled = false

func _on_return_to_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu/scenes_MainMenu/main_menu.tscn")
