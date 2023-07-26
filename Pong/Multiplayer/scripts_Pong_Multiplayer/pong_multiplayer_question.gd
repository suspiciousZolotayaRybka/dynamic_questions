extends Area2D

var is_orange: bool = false

func _on_pong_multiplayer_question_label_timer_timeout():
	if (is_orange):
		$PongMultiplayerQuestionLabel.label_settings.font_color = Color(217, 216, 215, 255)
		is_orange = false
	else:
		$PongMultiplayerQuestionLabel.label_settings.font_color = Color.ORANGE_RED
		is_orange = true
