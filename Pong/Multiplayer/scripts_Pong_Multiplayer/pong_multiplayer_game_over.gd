extends Control

@export var is_orange: bool = false

@onready var game_over_title: Label = $PongMultiplayerGameOverTitle
@onready var question_label: Label = $PongMultiplayerGameOverQuestionLabel_Title
@onready var move_timer: Timer =  $PongMultiplayerGameOverQuestionLabel_Title/PongMultiplayerGameOverQuestionLabelMoveTimer_Title
@onready var color_timer: Timer = $PongMultiplayerGameOverQuestionLabel_Title/PongMultiplayerGameOverQuestionLabelTimer_Title

func _ready():
	game_over_title.text = QuestionProfile.multiplayer_pong_winner + " Wins!"
	question_label.position = Vector2 ([randi_range(150, 450), randi_range(830, 1000)][randi()%2], [randi_range(50, 260), randi_range(450, 600)][randi()%2])
	move_timer.start()
	color_timer.start()

func _on_question_label_move_timer_title_timeout():
	question_label.position = Vector2 ([randi_range(150, 450), randi_range(830, 1000)][randi()%2], [randi_range(50, 260), randi_range(450, 600)][randi()%2])

func _on_question_label_timer_title_timeout():
	if (is_orange):
		question_label.label_settings.font_color = Color(217, 216, 215, 255)
		is_orange = false
	else:
		question_label.label_settings.font_color = Color.ORANGE_RED
		is_orange = true

func _on_pong_multiplayer_game_over_button_title_pressed():
	get_tree().change_scene_to_file("res://Pong/Multiplayer/scenes_Pong_Multiplayer/pong_multiplayer_level.tscn")

func _on_pong_multiplayer_game_over_singleplayer_button_pressed():
	get_tree().change_scene_to_file("res://Pong/Singleplayer/scenes_Pong_Singleplayer/PongSingleplayerLevel.tscn")
