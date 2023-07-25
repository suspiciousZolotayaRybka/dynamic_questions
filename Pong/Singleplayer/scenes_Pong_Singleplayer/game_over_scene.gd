extends Control

var is_orange: bool = false

func _ready():
	if (QuestionProfile.is_left_player_won_pong):
		$SingleplayerGameOver.text = "You Won!"
	else:
		$SingleplayerGameOver.text = "You Lost!"
	$QuestionLabel_Title.position = Vector2 ([randi_range(150, 450), randi_range(830, 1000)][randi()%2], [randi_range(50, 260), randi_range(450, 600)][randi()%2])
	$QuestionLabel_Title/QuestionLabelMoveTimer_Title.start()
	$QuestionLabel_Title/QuestionLabelTimer_Title.start()

func _on_question_label_move_timer_title_timeout():
	$QuestionLabel_Title.position = Vector2 ([randi_range(150, 450), randi_range(830, 1000)][randi()%2], [randi_range(50, 260), randi_range(450, 600)][randi()%2])

func _on_question_label_timer_title_timeout():
	if (is_orange):
		$QuestionLabel_Title.label_settings.font_color = Color(217, 216, 215, 255)
		is_orange = false
	else:
		$QuestionLabel_Title.label_settings.font_color = Color.ORANGE_RED
		is_orange = true

func _on_button_title_pressed():
	print("You played multiplayer!")

func _on_singleplayer_button_pressed():
	get_tree().change_scene_to_file("res://Pong/Singleplayer/scenes_Pong_Singleplayer/Level.tscn")

func player_won():
	print("plyaer won in game over")
func player_lost():
	print("plyaer lost in game over")
