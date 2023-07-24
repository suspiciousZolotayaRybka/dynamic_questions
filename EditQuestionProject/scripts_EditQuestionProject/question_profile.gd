extends Node

# Declare variables
var num_questions: set = _set_num_questions, get = _get_num_questions
var current_question: set = _set_current_question, get = _get_current_question
var num_pages: set = _set_num_pages, get = _get_num_pages
var current_page: set = _set_current_page, get = _get_current_page
var questions_and_answers: set = _set_questions_and_answers, get = _get_questions_and_answers
var current_section
var is_single_entry_2_disabled = false
var is_single_entry_3_disabled = false
const QUESTION = 0
const ANSWER_A = 1
const ANSWER_B = 2
const ANSWER_C = 3
const ANSWER_D = 4
const ANSWER = 5
signal current_page_changed
signal current_question_changed

# Setters
func _set_num_questions(new_num_questions):
	num_questions = new_num_questions
	# There are three questions per page
	# If the number of questions is divisible by three, The number of pages is exactly num_questions / 3
	# Otherwise, 1 must be added to num_questions / 3
	if (QuestionProfile._get_num_questions() % 3 == 0):
		self.num_pages = QuestionProfile._get_num_questions() / 3
	else:
		self.num_pages = (QuestionProfile._get_num_questions() / 3) + 1
func _set_current_question(new_current_question):
	current_question = new_current_question
	emit_signal("current_question_changed")
func _set_num_pages(new_num_pages):
	num_pages = new_num_pages
func _set_current_page(new_current_page):
	current_page = new_current_page
	# If the user is on the last page, and the number of questions they have is not a multiple of three,
	# a special screen must be shown in place of the single_page_of_questions scene, with either one or two questions on the page
	if ((current_page != num_pages) or (num_questions % 3 == 0)):
		# Save computation time by computing the most common case first, and simply passing
		if (is_single_entry_2_disabled or is_single_entry_3_disabled):
			# User is on a page with three entries, re-enable entry 2 and 3
			# Unusual bug described below; notice how entries 2 and 3 are not re-enabled here
			# is_single_entry_2_disabled = false
			# is_single_entry_3_disabled = false
			# The booleans is_single_entry_2_disabled and is_single_entry_3_disabled are set false in their corresponding single_entry ready functions
			# page_navigation.gd takes program control before the single_entry ready functions because of the signal from the back/next/option buttons (in the method PageNavigation.set_first_question_on_page())
			# Setting booleans to true here (commented out above) causes a null instance crash,
			# because page_navigation.gd attempts to reference the single_entries flags before their ready function is called
			get_tree().change_scene_to_file("res://EditQuestionProject/scenes_EditQuestionProject/single_page_of_questions.tscn")
		pass
	elif ((current_page == num_pages) and (num_questions % 3 == 1)):
		# User is on the last page with only one question remaining
		is_single_entry_2_disabled = true
		is_single_entry_3_disabled = true
		get_tree().change_scene_to_file("res://EditQuestionProject/scenes_EditQuestionProject/page_of_one_question.tscn")
	else:
		# User is on the last page with two questions remaining
		is_single_entry_3_disabled = true
		get_tree().change_scene_to_file("res://EditQuestionProject/scenes_EditQuestionProject/page_of_two_questions.tscn")
	emit_signal("current_page_changed")
func _set_questions_and_answers(new_questions_and_answers):
	questions_and_answers = new_questions_and_answers
func _set_current_section(new_current_section):
	current_section = new_current_section
func _set_is_single_entry_2_disabled(new_is_single_entry_2_disabled):
	is_single_entry_2_disabled = new_is_single_entry_2_disabled
func _set_is_single_entry_3_disabled(new_is_single_entry_3_disabled):
	is_single_entry_3_disabled = new_is_single_entry_3_disabled

# Getters
func _get_num_questions():
	return num_questions
func _get_current_question():
	return current_question
func _get_num_pages():
	return num_pages
func _get_current_page():
	return current_page
func _get_questions_and_answers() -> Array:
	return questions_and_answers
func _get_current_section():
	return current_section

	#TODO Delete
func _get_is_single_entry_2_disabled():
	return is_single_entry_2_disabled
func _get_is_single_entry_3_disabled():
	return is_single_entry_3_disabled
func _ready():
	pass
	# TODO change
#TODO delete
	QuestionProfile._set_num_questions(8)
	QuestionProfile._set_current_page(1)
	QuestionProfile._set_current_question(1)
	
#	get_tree().get_root().find_child("first_section_outline", true, false).editor_only = false
#	get_tree().get_root().find_child("second_section_outline", true, false).editor_only = true
#	get_tree().get_root().find_child("third_section_outline", true, false).editor_only = true

#	var temp_array = []
#	for i in 299:
#		temp_array.append(["","","","","",-1])
#	QuestionProfile._set_questions_and_answers(temp_array)
	QuestionProfile.questions_and_answers = [
	["Since the birth of our Nation policies and directives have been made by:","the Joint Staff","military leaders","civilians assigned to the military and the executive and legislative branches","the Chairman of the Joint Chiefs of Staff with the advice and consent of the senate",3],
	["What establishes the basic principle of civilian control of the U.S. Armed Forces?","the U.S. Constitution","the Law of Armed Conflict","the British Articles of War","the Uniform Code of Military Justice",1],
	["The U.S. Constitution establishes the basic principle of civilian control of the U.S. Armed Forces beginning with the President's role as:","Commander in Chief","Secretary of Defense","head of the legislative and judicial branches","liaison to the Secretary of Defense for Policy",1],
	["The U.S. Constitution establishes the basic principle of civilian control of the U.S. Armed Forces. Who serves as Commander in Chief and has final command authority?","the President","the Secretary of State","the Secretary of Defense","the Chairman Joint Chiefs of Staff",1],
	["The President serves as Commander in Chief of the Armed Forces and has final command authority. However as head of the executive branch he is subject to the checks and balances system of:","the legislative and judicial branches","the Armed Forces Policy Council","the Uniform Code of Military Justice","the Department of Defense and Secretary of Defense",3],
	["By statute the chain of command runs from the President through the Secretary of Defense to:","the Combatant Commanders","the Under Secretaries of Defense","the Chairman Joint Chiefs of Staff","the Secretaries of the military departments",1],
	["When forces are assigned to the Combatant Commanders administrative control over those forces still typically flows through:","the Combatant Commanders","their respective service branch","the Under Secretaries of Defense","the Chairman Joint Chiefs of Staff",2],
	["Although the chain of command runs from the President through the Secretary of Defense to the Combatant Commanders a provision of this law permits the President to authorize communications through the Chairman Joint Chiefs of Staff placing the Chairman in the communications chain of command.","Key West Agreement","Air Force Letter 35.3","National Security Act of 1947","Goldwater-Nichols DoD Reorganization Act of 1986",4]
	]
#	QuestionProfile.questions_and_answers = [
#	["What is your favorite pizza topping?", "Mushroom", "Pepperoni", "Cheese", "Sausage", 1],
#	["What is the capital of France?", "Paris", "London", "Berlin", "Madrid", 2],
#	["What is the color of the sun?", "Yellow", "Blue", "Red", "Green", 3],
#	["Who wrote the play 'Hamlet'?", "William Shakespeare", "Jane Austen", "Charles Dickens", "Mark Twain", 4],
#	["What is the chemical symbol for water?", "H2O", "CO2", "NaCl", "O2", 1],
#	["What is the largest planet in our solar system?", "Jupiter", "Mars", "Saturn", "Neptune", 2],
#	["What is the tallest mountain in the world?", "Mount Everest", "K2", "Makalu", "Kangchenjunga", 2],
#	["Who painted the Mona Lisa?", "Leonardo da Vinci", "Pablo Picasso", "Vincent van Gogh", "Claude Monet", 4],
#	["What is the largest ocean on Earth?", "Pacific Ocean", "Atlantic Ocean", "Indian Ocean", "Arctic Ocean", 1],
#	["What is the chemical symbol for gold?", "Au", "Ag", "Cu", "Fe", 3],
#	["Who discovered penicillin?", "Alexander Fleming", "Marie Curie", "Albert Einstein", "Isaac Newton", 4],
#	["What is the largest country by land area?", "Russia", "Canada", "China", "United States", 1],
#	["Who wrote the play 'Romeo and Juliet'?", "William Shakespeare", "Arthur Miller", "Tennessee Williams", "Henrik Ibsen", 2],
#	["What is the largest desert in the world?", "Sahara Desert", "Gobi Desert", "Atacama Desert", "Antarctica", 4],
#	["What is the symbol for the element oxygen?", "O", "H", "C", "N", 1],
#	["Who painted the famous artwork 'The Starry Night'?", "Vincent van Gogh", "Pablo Picasso", "Leonardo da Vinci", "Salvador Dalí", 3],
#	["What is the capital of Japan?", "Tokyo", "Beijing", "Seoul", "Bangkok", 2],
#	["What is the capital of Japan?", "Tokyo", "Beijing", "Seoul", "Bangkok", 2]
#	]
	#TODO Delete

#TODO CHANGE TO JSON FOR PARSING
#Currently uses [, ], and , for parsing
func questions_and_answers_to_string(questions_and_answers_array) -> String:
	questions_and_answers_array = QuestionProfile._get_questions_and_answers()
	#change the question_and_answers array into a string for saving and loading
	var question_and_answer_string = "[["
	# Use a for loop to save the multidimensional array to a file
	var i = 0
	var j
	for question_and_answer in questions_and_answers:
		j = 0
		for element in question_and_answer:
			question_and_answer_string += str(element)
			if (j < 5):
				# Don't put a comma after the last element
				question_and_answer_string += ","
			j += 1
		if (i < len(questions_and_answers_array) - 1):
			# Only put two brackets after the very last entry
			question_and_answer_string += "],["
		i += 1
	question_and_answer_string += "]]"
	return question_and_answer_string

func questions_and_answers_to_array(questions_and_answers_string: String):
	var questions_and_answers_array = []
	var num_open_brackets: int = questions_and_answers_string.count("[")
	var num_close_brackets: int = questions_and_answers_string.count("]")
	var num_brackets: int = num_open_brackets + num_close_brackets
	var num_nested_arrays: int = (num_brackets - 2) / 2
	
	# Remove the beginning and ending brackets
	var first_bracket_index: int = questions_and_answers_string.find("[", 0)
	questions_and_answers_string = questions_and_answers_string.substr(first_bracket_index + 1, (len(questions_and_answers_string) - first_bracket_index) )
	# Continue removing the last index until a combination of closing brackets no longer exist, to remove the last bracket
	while (check_for_closing_brackets(questions_and_answers_string)):
		questions_and_answers_string = questions_and_answers_string.substr(0, len(questions_and_answers_string) - 1)
	
	# Use a for loop to set up the questions_and_answers array
	for i in num_nested_arrays:
		questions_and_answers_array.append([])
		for j in 6:
			if (j != 5):
				questions_and_answers_array[i].append("")
			else:
				# Append -1 at the very end
				questions_and_answers_array[i].append(0)
	
	# Declare variables to fill in the array
	var open_bracket_index: int
	var old_comma_index: int
	var new_comma_index: int
	var i: int = 0
	# While nested arrays still exist in the string
		# Load the elements into the array, and cut off that element from the string
	while (i < num_nested_arrays):
		
		# Find QUESTION
		open_bracket_index = questions_and_answers_string.find("[")
		new_comma_index = questions_and_answers_string.find(",")
		questions_and_answers_array[i][QuestionProfile.QUESTION] = questions_and_answers_string.substr(open_bracket_index + 1, (new_comma_index - 1))
		questions_and_answers_string = questions_and_answers_string.substr(new_comma_index)
		
		# Find ANSWER_A, ANSWER_B, ANSWER_C, and ANSWER_D
		for j in 4:
			old_comma_index = questions_and_answers_string.find(",")
			new_comma_index = questions_and_answers_string.find(",", 1)
			questions_and_answers_array[i][j+1] = questions_and_answers_string.substr(old_comma_index + 1, new_comma_index - 1)
			questions_and_answers_string = questions_and_answers_string.substr(new_comma_index)
		
		# Find ANSWER
		questions_and_answers_array[i][QuestionProfile.ANSWER] = int(questions_and_answers_string[1])
		open_bracket_index = questions_and_answers_string.find("[")
		questions_and_answers_string = questions_and_answers_string.substr(open_bracket_index)
		i += 1
	return questions_and_answers_array

func check_for_closing_brackets(questions_and_answers_string: String) -> bool:
	var i: int = 0
	for character_i in questions_and_answers_string:
		if (character_i == "]"):
			# Final closing brackets will only appear in the last index
			if (i + 1 == len(questions_and_answers_string)):
				# Only spaces should appear between the last bracket and the preceading closing bracket
				for character_j in (reverse_string(questions_and_answers_string).substr(1, len(questions_and_answers_string) ) ):
					if ( (character_j != " " and character_j != "]") ):
						# Something other than a space or bracket appeared before closing bracket, so it is not the last bracket
						break
					if (character_j == "]"):
						# Another bracket in the reversed string, meaning the bracket is the last closing bracket
						return true
		i += 1
	return false

func reverse_string(questions_and_answers_string: String) -> String:
	var reverse = questions_and_answers_string
	var i: int = len(questions_and_answers_string)
	i -= 1
	for character in questions_and_answers_string:
		reverse[i] = character
		i -= 1
	return reverse

func get_is_questions_and_answers_valid(questions_and_answers_string: String) -> bool:
	# Check to see if the questions and answers multidimensional array is valid
	
	# The brackets should be >= 8 (3 question minimum) and <= 602 (300 question maximum)
	var num_open_brackets: int = questions_and_answers_string.count("[")
	var num_close_brackets: int = questions_and_answers_string.count("]")
	if ( (4 >= num_open_brackets) and (num_open_brackets >= 301) ):
		show_warning_dialog("Invalid Left Bracket Number. Operation failed.")
		return false
	
	if ((4 >= num_close_brackets) and (num_close_brackets >= 301)):
		show_warning_dialog("Invalid Right Bracket Number. Operation failed.")
		return false
	
	if (num_open_brackets != num_close_brackets):
		show_warning_dialog("Brackets Are Unequal. Operation failed.")
		return false
	
	# The num_commas will always the algebraic expression below (using num_brackets)
	var num_brackets: int = num_open_brackets + num_close_brackets
	# The number of single entries, or number of nested arrays. Subtract two for the outer array brackets, then divide by two for two brackets surrounding each array
	var num_nested_arrays: int = (num_brackets - 2) / 2
	#				one comma between each entry	4 commas inside of each entry
	var num_commas = ( (num_nested_arrays - 1) + ( num_nested_arrays * 5) )
	var actual_num_commas = questions_and_answers_string.count(",")
	if (not(num_commas == actual_num_commas)):
			show_warning_dialog("Invalid Comma Number. Operation failed.")
			return false
	
	# The very first character should be an opening bracket
	if (questions_and_answers_string[0] != "["):
		show_warning_dialog("First Character Not A Bracket. Operation failed.")
		return false
	
	# The very last character should be a closing bracket
	if (questions_and_answers_string[-1] != "]"):
		show_warning_dialog("Last Character Not A Bracket. Operation failed.")
		return false
	
	# The last two closing brackets should be within four indices of the length
	# Additionally, every closing bracket except for the last two should have a comma following it
	var count = 0
	for character in questions_and_answers_string:
		if (count < (len(questions_and_answers_string) - 5)):
			if ((character == "]") and (questions_and_answers_string[count + 1] != ",")):
				show_warning_dialog("Invalid Bracket And Comma Pairing(s). Operation failed.")
				return false
		count += 1

	# Every even numbered quotation mark should have a comma after itself
	# Need to add quotation marks in the _to_string method first
	# Add HTML tags too
#	var quotation_mark_count = 0
#	count = 0
#	for character in questions_and_answers_string:
#		if (character == '"'):
#			quotation_mark_count += 1
#			if (quotation_mark_count % 2 == 0):
#				if (questions_and_answers_string[count + 1] != ","):
#					show_warning_dialog("Invalid Even Quote And Comma Pairing(s). Operation failed.")
#					return false
#		count += 1

	# Finally, attempt to change the string to an array, and check the validity of the contents.
	var questions_and_answers_array = QuestionProfile.questions_and_answers_to_array(questions_and_answers_string)
	
	var question_number = 1
	for question_and_answer in questions_and_answers_array:
		if (question_and_answer[QuestionProfile.QUESTION] == ""):
			show_warning_dialog("Question %d Question Was Left Blank. Operation failed."%[question_number])
			return false
		if (question_and_answer[QuestionProfile.ANSWER_A] == ""):
			show_warning_dialog("Question %d Answer_A Was Left Blank. Operation failed."%[question_number])
			return false
		if (question_and_answer[QuestionProfile.ANSWER_B] == ""):
			show_warning_dialog("Question %d Answer_B Was Left Blank. Operation failed."%[question_number])
			return false
		if (question_and_answer[QuestionProfile.ANSWER_C] == ""):
			show_warning_dialog("Question %d Answer_C Was Left Blank. Operation failed."%[question_number])
			return false
		if (question_and_answer[QuestionProfile.ANSWER_D] == ""):
			show_warning_dialog("Question %d Answer_D Was Left Blank. Operation failed."%[question_number])
			return false
		if (question_and_answer[QuestionProfile.ANSWER] == 0):
			show_warning_dialog("Question %d Question Was Left Unanswered. Operation failed."%[question_number])
			return false
		question_number += 1
	# The questions_and_answers_string passed all tests, and so did its array
	# Return true
	return true

func show_warning_dialog(dialog_string: String):
				get_tree().get_root().find_child("warning_dialog", true, false).dialog_text = dialog_string
				get_tree().get_root().find_child("warning_dialog", true, false).visible = true
