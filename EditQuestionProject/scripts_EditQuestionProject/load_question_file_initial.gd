extends Button

@onready var overwrite_warning_dialog: AcceptDialog = $overwrite_warning_initial
@onready var save_load_error_dialog: AcceptDialog = $save_load_error_initial
@onready var file_dialog_load_questions_dialog: AcceptDialog = $file_dialog_load_questions_initial

func _ready():
	file_dialog_load_questions_dialog.current_dir = "/"

func _on_pressed():
	# Pop open the load dialog and warn the user not to overwrite root folders
	$file_dialog_load_questions_initial.visible = true
	overwrite_warning_dialog.visible = true

func _on_file_dialog_load_questions_initial_file_selected(path):
	# Open the load file
	var json_string
	var load_file = FileAccess.open(path, FileAccess.READ)
	if load_file != null:  # Ensure the file was successfully opened
		json_string = load_file.get_as_text()
		load_file.close()
	else:
		# An error occurred
		save_load_error_dialog.dialog_text = "Error opening file, null file found"
		save_load_error_dialog.visible = true
	
	# Retrieve data
	var json = JSON.new()
	var error = json.parse(json_string)
	if error == OK:
		var data_received = json.data
		if typeof(data_received) == TYPE_ARRAY:
			# Data is valid, fill in QuestionProfile
			QuestionProfile._set_questions_and_answers(data_received)
			QuestionProfile._set_num_questions(len(QuestionProfile._get_questions_and_answers()))
			QuestionProfile._set_current_page(1)
			get_tree().change_scene_to_file("res://EditQuestionProject/scenes_EditQuestionProject/main_dynamic_questions.tscn")
		else:
			# An error occurred
			save_load_error_dialog.dialog_text = "Unexpected data in file"
			save_load_error_dialog.visible = true
	else:
		# An error occurred
		save_load_error_dialog.dialog_text = "JSON Parse Error: " + json.get_error_message() + " in " + json_string + " at line " + str(json.get_error_line())
		save_load_error_dialog.visible = true
