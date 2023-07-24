extends Node2D

func _ready():
	pass



func save_file_questions():
	var questions_and_answers = [
	["Since the birth of our Nation policies and directives have been made by:","the Joint Staff","military leaders","civilians assigned to the military and the executive and legislative branches","the Chairman of the Joint Chiefs of Staff with the advice and consent of the senate",3],
	["What establishes the basic principle of civilian control of the U.S. Armed Forces?","the U.S. Constitution","the Law of Armed Conflict","the British Articles of War","the Uniform Code of Military Justice",1],
	["The U.S. Constitution establishes the basic principle of civilian control of the U.S. Armed Forces beginning with the President's role as:","Commander in Chief","Secretary of Defense","head of the legislative and judicial branches","liaison to the Secretary of Defense for Policy",1],
	["The U.S. Constitution establishes the basic principle of civilian control of the U.S. Armed Forces. Who serves as Commander in Chief and has final command authority?","the President","the Secretary of State","the Secretary of Defense","the Chairman Joint Chiefs of Staff",1],
	["The President serves as Commander in Chief of the Armed Forces and has final command authority. However as head of the executive branch he is subject to the checks and balances system of:","the legislative and judicial branches","the Armed Forces Policy Council","the Uniform Code of Military Justice","the Department of Defense and Secretary of Defense",3],
	["By statute the chain of command runs from the President through the Secretary of Defense to:","the Combatant Commanders","the Under Secretaries of Defense","the Chairman Joint Chiefs of Staff","the Secretaries of the military departments",1],
	["When forces are assigned to the Combatant Commanders administrative control over those forces still typically flows through:","the Combatant Commanders","their respective service branch","the Under Secretaries of Defense","the Chairman Joint Chiefs of Staff",2],
	["Although the chain of command runs from the President through the Secretary of Defense to the Combatant Commanders a provision of this law permits the President to authorize communications through the Chairman Joint Chiefs of Staff placing the Chairman in the communications chain of command.","Key West Agreement","Air Force Letter 35.3","National Security Act of 1947","Goldwater-Nichols DoD Reorganization Act of 1986",4]
	]
	var json_string = JSON.stringify(questions_and_answers)
	var save_file = FileAccess.open("C:/Users/fineh/OneDrive/Desktop/QuestionFiles/QuestionFilesTest/test_JSON", FileAccess.WRITE)
	save_file.store_line(json_string)
	save_file.close()

func load_file_questions():
	var json_string
	var load_file = FileAccess.open("C:/Users/fineh/OneDrive/Desktop/QuestionFiles/QuestionFilesTest/test_JSON", FileAccess.READ)
	if load_file != null:  # Ensure the file was successfully opened
		json_string = load_file.get_as_text()
		load_file.close()

	# Retrieve data
	var json = JSON.new()
	var error = json.parse(json_string)
	if error == OK:
		var data_received = json.data
		if typeof(data_received) == TYPE_ARRAY:
			# Data is valid
			print(data_received[4][4])
			QuestionProfile._set_questions_and_answers(data_received)
			QuestionProfile._set_num_questions(len(QuestionProfile._get_questions_and_answers()))
			QuestionProfile._set_current_page(1)
		else:
			print("Unexpected data")
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
# C:/Users/fineh/OneDrive/Desktop/QuestionFiles/QuestionFilesTest/new_file
# C:/Users/fineh/OneDrive/Desktop/QuestionFiles/QuestionFilesTest/new_file


#	if (is_questions_and_answers_valid):
#		var temp_array = QuestionProfile.questions_and_answers_to_array(load_string)
#		QuestionProfile._set_questions_and_answers(temp_array)
#		QuestionProfile._set_num_questions(len(QuestionProfile._get_questions_and_answers()))
#		QuestionProfile._set_current_page(1)

# TODO does godot save arrays with single or double quotes, and is there a way to switch how it saves them?
# TODO also ensure there are only single quotes somehow, or double quoptes depending what I deduce from godot'sd automatic array implementation
