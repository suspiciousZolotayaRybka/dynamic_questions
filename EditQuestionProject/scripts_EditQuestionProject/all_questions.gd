extends Control

func _ready():
	# Declare and assign variables
	const QUESTION_POSITION_X = 25
	var question_position_y: int = 25
	var current_question = 0
	var has_entered_questions = false
	
	# Iterate through each question and print it to the screen, along with edit buttons
	for question_and_answer in QuestionProfile._get_questions_and_answers():
		# If the current question is blank, skip
		if (question_and_answer[0] == "" and question_and_answer[1] == "" and question_and_answer[2] == "" and question_and_answer[3] == "" and question_and_answer[4] == "" and question_and_answer[5] == -1):
				pass
		else:
			has_entered_questions = true
			# Otherwise fill in the question
			# Set the current question as text on the screen at the current position
			var question_label = Label.new()
			question_label.text = "%d. %s\n" % [current_question + 1, question_and_answer[QuestionProfile.QUESTION]]
			question_label.text += "        a. %s\n" % [question_and_answer[QuestionProfile.ANSWER_A]]
			question_label.text += "        b. %s\n" % [question_and_answer[QuestionProfile.ANSWER_B]]
			question_label.text += "        c. %s\n" % [question_and_answer[QuestionProfile.ANSWER_C]]
			question_label.text += "        d. %s\n" % [question_and_answer[QuestionProfile.ANSWER_D]]
			# Godot's switch statement
			var result
			match question_and_answer[QuestionProfile.ANSWER]:
				1:
					result = "a"
				2:
					result = "b"
				3:
					result = "c"
				4:
					result = "d"
			question_label.text += "Correct Answer: %s" % [result]
			question_label.size = Vector2(QUESTION_POSITION_X, 0)
			question_label.position = Vector2(QUESTION_POSITION_X, question_position_y)
			self.add_child(question_label)
			question_position_y += 200
			self.custom_minimum_size = Vector2(QUESTION_POSITION_X, question_position_y)
		current_question += 1
	
	# Assign the go_to_question option button options
	for i in current_question:
		$go_to_question.add_item("Return to Question " + str(i + 1))
	
	# if the user has entered no questions, inform them of this
	if (not(has_entered_questions)):
		$go_to_question.text = "No Questions"
		$go_to_question.disabled = true
		$not_has_entered_questions.visible = true

func _on_return_pressed():
	# If the user is on the last page, check to see what page scene needs to be returned to
	if (QuestionProfile._get_current_page() == QuestionProfile._get_num_pages()):
		if ((QuestionProfile._get_num_questions() % 3) == 2):
			# If user is on the last page with two questions, return to this scene
			get_tree().change_scene_to_file("res://page_of_two_questions.tscn")
		elif ((QuestionProfile._get_num_questions() % 3) == 1):
			# If user is on the last page with one question, return to this scene
			get_tree().change_scene_to_file("res://page_of_one_question.tscn")
		else:
			# Otherwise return to the single_page_of_questions
			get_tree().change_scene_to_file("res://single_page_of_questions.tscn")
	else:
		# Otherwise return to the single_page_of_questions
		get_tree().change_scene_to_file("res://single_page_of_questions.tscn")

func _on_go_to_question_item_selected(index):
	# Set the current_question and current_page 
	QuestionProfile._set_current_question(index)
	if (((QuestionProfile._get_current_question() + 1) % 3) == 0):
		# If question is divisible by three, the current page is exactly the question / 3
		QuestionProfile._set_current_page((QuestionProfile._get_current_question() + 1)/ 3)
	else:
		# Otherwise use integer division to knock off the fraction and add one for current page
		QuestionProfile._set_current_page(((QuestionProfile._get_current_question() + 1) / 3) + 1)
	# If the user is on the last page, check to see what page scene needs to be returned to
	if (QuestionProfile._get_current_page() == QuestionProfile._get_num_pages()):
		if ((QuestionProfile._get_num_questions() % 3) == 2):
			# If user is on the last page with two questions, return to this scene
			get_tree().change_scene_to_file("res://page_of_two_questions.tscn")
		elif ((QuestionProfile._get_num_questions() % 3) == 1):
			# If user is on the last page with one question, return to this scene
			get_tree().change_scene_to_file("res://page_of_one_question.tscn")
		else:
			# Otherwise return to the single_page_of_questions
			get_tree().change_scene_to_file("res://single_page_of_questions.tscn")
	else:
		# Otherwise return to the single_page_of_questions
		get_tree().change_scene_to_file("res://single_page_of_questions.tscn")

func _on_scroll_container_gui_input(event):
	$return.position = Vector2(900, get_tree().get_root().find_child("scroll_container", true, false).scroll_vertical + 20)
	$go_to_question.position = Vector2(900, get_tree().get_root().find_child("scroll_container", true, false).scroll_vertical + 70)
