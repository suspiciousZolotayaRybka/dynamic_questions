# Author: Isaac Finehout
# Date: 7 July 2023
# Purpose: Control the page navigation bar and the information it displays

extends Node2D

# Initialize all variables for page navigation
func _ready():
	# Set page_label and question_label
	$page_label.text = "Page %d/%d" % [QuestionProfile._get_current_page(), QuestionProfile._get_num_pages()]
	$question_label.text = "Question %d/%d" % [QuestionProfile._get_current_question() + 1, QuestionProfile._get_num_questions()]
	# Disable the back button
	if (QuestionProfile._get_current_page() == 1):
		$back_button.disabled = true
	# Set the option button options
	for i in QuestionProfile._get_num_pages():
		$page_option_button.add_item("Page " + str(i + 1))
	$page_option_button.selected = QuestionProfile._get_current_page() - 1
	# Connect the signal to change the page
	var callable_on_current_page_changed = Callable(self, "_on_current_page_changed")
	QuestionProfile.connect("current_page_changed", callable_on_current_page_changed)
	# Connect the signal to change the current question
	var callable_on_current_question_changed = Callable(self, "_on_current_question_changed")
	QuestionProfile.connect("current_question_changed", callable_on_current_question_changed)
	# Set the correct file dialog options
	$file_dialog_save_questions.current_dir = "/"
	$file_dialog_load_questions.current_dir = "/"

func _on_current_question_changed():
	# Update question_label with current question
	$question_label.text = "Question %d/%d" % [QuestionProfile._get_current_question() + 1, QuestionProfile._get_num_questions()]

# Update all variables for page navigation when the user changed the page
func _on_current_page_changed():
	# Update the page_label
	$page_label.text = "Page %d/%d" % [QuestionProfile._get_current_page(), QuestionProfile._get_num_pages()]
	# Disabled the back button if it is the first page
	if (QuestionProfile._get_current_page() == 1):
		$back_button.disabled = true
	else:
		$back_button.disabled = false
	# Disabled the next button if it is the last page
	if (QuestionProfile._get_current_page() == QuestionProfile._get_num_pages()):
		$next_button.disabled = true
	else:
		$next_button.disabled = false

# Turn the highlight around the menu options on
func _on_reference_rect_boundary_entry_mouse_entered():
	$menu_options_reference_rect.editor_only = false
# Turn the highlight around the menu options off
func _on_reference_rect_boundary_4_mouse_entered():
	$menu_options_reference_rect.editor_only = true
func _on_reference_rect_boundary_3_mouse_entered():
	$menu_options_reference_rect.editor_only = true
func _on_reference_rect_boundary_2_mouse_entered():
	$menu_options_reference_rect.editor_only = true
func _on_reference_rect_boundary_1_mouse_entered():
	$menu_options_reference_rect.editor_only = true

# Use signals from the next button to increment the current page
func _on_next_button_pressed():
	QuestionProfile._set_current_page(QuestionProfile._get_current_page() + 1)
	$page_option_button.selected = QuestionProfile._get_current_page() - 1
	set_first_question_on_page()

# Use signals from the back button to decrement the current page
func _on_back_button_pressed():
	QuestionProfile._set_current_page(QuestionProfile._get_current_page() - 1)
	$page_option_button.selected = QuestionProfile._get_current_page() - 1
	set_first_question_on_page()

# Use signals from the page option button to change the current page
func _on_page_option_button_item_selected(index):
	QuestionProfile._set_current_page(index + 1)
	set_first_question_on_page()

# Sets the current question to whatever the first one on the page is, used when visiting a new page
func set_first_question_on_page():
	# Always set current question to the first one on the page
	QuestionProfile._set_current_question(QuestionProfile._get_current_page()*3 - 3)
	get_tree().get_root().find_child("first_section_outline", true, false).editor_only = false
	if (not(QuestionProfile._get_is_single_entry_2_disabled())):
		# Don't make references to either single entry 2 or 3 if they are disabled
		get_tree().get_root().find_child("second_section_outline", true, false).editor_only = true
		if (not(QuestionProfile._get_is_single_entry_3_disabled())):
			get_tree().get_root().find_child("third_section_outline", true, false).editor_only = true

func _on_add_question_pressed():
	# Don't let the user enter over 300 questions
	if (QuestionProfile._get_num_questions() < 300):
		var temp_array = QuestionProfile._get_questions_and_answers()
		temp_array.insert(QuestionProfile._get_current_question(), ["","","","","",-1])
		QuestionProfile._set_num_questions(QuestionProfile._get_num_questions() + 1)
		update_page_options()
		# Update the question label
		$question_label.text = "Question %d/%d" % [QuestionProfile._get_current_question() + 1, QuestionProfile._get_num_questions()]
		# Set the current_page to update the new information
		QuestionProfile._set_current_page(QuestionProfile._get_current_page())
	else:
		$add_over_three_hundred_dialog.visible = true

func _on_delete_question_pressed():
	# Don't let the user get below three questions
	if (QuestionProfile._get_num_questions() > 3):
		# If the user still has over three questions, delete their current question
		var temp_array = QuestionProfile._get_questions_and_answers()
		temp_array.pop_at(QuestionProfile._get_current_question())
		QuestionProfile._set_questions_and_answers(temp_array)
		QuestionProfile._set_num_questions(QuestionProfile._get_num_questions() - 1)
		# Check to see if user was on the last question and deleted it, move them back a page if so
		if (QuestionProfile._get_current_page() > QuestionProfile._get_num_pages()):
			QuestionProfile._set_current_page(QuestionProfile._get_num_pages())
		else:
			# Otherwise update the contents on the current page
			QuestionProfile._set_current_page(QuestionProfile._get_current_page())
		update_page_options()
		# Update the question label
		$question_label.text = "Question %d/%d" % [QuestionProfile._get_current_question() + 1, QuestionProfile._get_num_questions()]
	# The user attempted to get under three questions
	else:
		$delete_under_three_dialog.visible = true

func _on_change_question_order_pressed():
	var number_to_move_to: int
	var change_question_popupmenu: PopupMenu = $change_question_choice
	change_question_popupmenu.clear()
	change_question_popupmenu.add_item("Cancel")
	for i in (QuestionProfile._get_num_questions()):
		if (QuestionProfile.current_question == i):
			continue
		change_question_popupmenu.add_check_item("Change %d to %d"%[QuestionProfile._get_current_question() + 1, i + 1])
	change_question_popupmenu.visible = true
	print("Changed Question Order")

func _on_change_question_choice_index_pressed(index):
	if (index == 0):
		# User chose cancel
		pass
	else:
		var temp_array: Array = QuestionProfile._get_questions_and_answers()
		var element_data = temp_array.pop_at(QuestionProfile._get_current_question())
		# Find the index the cuurent_question is at, and determine which index to reinsert it based on this
		var reinsert_index: int
		if (index <= QuestionProfile._get_current_question()):
			reinsert_index = index - 1
		else:
			reinsert_index = index
		# Reinsert the element
		print("Question %d was reinserted at index number %d"%[QuestionProfile._get_current_question(), reinsert_index])
		temp_array.insert(reinsert_index, element_data)
		QuestionProfile._set_questions_and_answers(temp_array)
		# Refresh the page
		QuestionProfile._set_current_page(QuestionProfile._get_current_page())

func _on_view_all_questions_pressed():
	get_tree().change_scene_to_file("res://EditQuestionProject/scenes_EditQuestionProject/view_all_questions.tscn")

func _on_save_question_file_pressed():
	# Pop open the save dialog and warn the user not to overwrite root folders
	$file_dialog_save_questions.visible = true
	$overwrite_warning.visible = true

func _on_file_dialog_save_questions_file_selected(path):
	#TODO delete
	print(path)
	#TODO delete
	var save_string = QuestionProfile.questions_and_answers_to_string(QuestionProfile._get_questions_and_answers())
	var is_questions_and_answers_valid = QuestionProfile.get_is_questions_and_answers_valid(save_string)
	# Only save if the file is valid.
	if (is_questions_and_answers_valid):
		var save_file = FileAccess.open(path, FileAccess.WRITE)
		save_file.store_line(save_string.trim_suffix(" "))
		save_file.close()

func _on_load_question_file_pressed():
	# Pop open the load dialog and warn the user not to overwrite root folders
	$file_dialog_load_questions.visible = true
	$overwrite_warning.visible = true

func _on_file_dialog_load_question_file_selected(path):
	#TODO delete
	print(path)
	#TODO delete
	var load_string
	var load_file = FileAccess.open(path, FileAccess.READ)
	if load_file != null:  # Ensure the file was successfully opened
		load_string = load_file.get_as_text()
		load_file.close()
	var is_questions_and_answers_valid = QuestionProfile.get_is_questions_and_answers_valid(load_string)
	if (is_questions_and_answers_valid):
		var temp_array = QuestionProfile.questions_and_answers_to_array(load_string)
		QuestionProfile._set_questions_and_answers(temp_array)
		QuestionProfile._set_num_questions(len(QuestionProfile._get_questions_and_answers()))
		QuestionProfile._set_current_page(1)

func update_page_options():
	$page_option_button.clear()
	for i in QuestionProfile._get_num_pages():
		$page_option_button.add_item("Page " + str(i + 1))
	$page_option_button.selected = QuestionProfile._get_current_page() - 1
