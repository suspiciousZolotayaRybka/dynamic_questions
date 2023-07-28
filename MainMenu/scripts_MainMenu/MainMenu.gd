extends Node

const CANCEL_IND: int = 0
const PONG_IND: int = 1

@onready var edit_button: Button = $EditQuestionFile
@onready var play_button: Button = $PlayGames
@onready var upload_warning: Label = $UploadFileWarning
@onready var current_file: Label = $CurrentQuestionFileLabel
@onready var popup_menu: PopupMenu = $PlayGames/GamePopupMenu

func _process(_delta):
	if(QuestionProfile.name_current_question_file.is_empty()):
		edit_button.disabled = true
		play_button.disabled = true
		upload_warning.visible = true
	else:
		edit_button.disabled = false
		play_button.disabled = false
		upload_warning.visible = false
		current_file.text = "Current Question File: " + QuestionProfile.name_current_question_file

func _on_create_new_question_file_pressed():
	get_tree().change_scene_to_file("res://EditQuestionProject/scenes_EditQuestionProject/ask_for_number_of_questions.tscn")

func _on_edit_question_file_pressed():
	get_tree().change_scene_to_file("res://EditQuestionProject/scenes_EditQuestionProject/single_page_of_questions.tscn")

func _on_play_games_pressed():
	popup_menu.visible = true

func _on_game_popup_menu_index_pressed(index):
	if (index == PONG_IND):
		get_tree().change_scene_to_file("res://Pong/TitleScreen/PongTitleScene.tscn")
