extends Node

var LeftPlayerScore = 0
var RightPlayerScore = 0

signal left_player_won_multiplayer_pong
signal right_player_won_multiplayer_pong

func _ready():
	get_tree().call_group("MultiplayerBallGroup", "stop_ball")
	$PongMultiplayerCountdownTimer.start()
	$PongMultiplayerCountdownLabel.visible = true

func _process(_delta):
	$PongMultiplayerCountdownLabel.text = str(int($PongMultiplayerCountdownTimer.time_left + 1))

func _on_pong_multiplayer_left_player_side_body_entered(body):
	score_achieved()
	RightPlayerScore += 1
	if RightPlayerScore >= 20:
		pass
		#TODO QuestionProfile.is_left_player_won_pong = false
		#TODO get_tree().change_scene_to_file("res://Pong/Singleplayer/scenes_Pong_Singleplayer/PongSingleplayerGameOver.tscn")
	$PongMultiplayerRightPlayerScore.text = str(RightPlayerScore)
	# Change the right player color to orange, and back to white when PongMultiplayerScoreTimer resets
	$PongMultiplayerRightPlayerScore.label_settings.font_color = Color.ORANGE_RED
	$PongMultiplayerScoreTimer.start()


func _on_pong_multiplayer_right_player_side_body_entered(body):
	score_achieved()
	LeftPlayerScore += 1
	if LeftPlayerScore >= 20:
		pass
		#TODO QuestionProfile.is_left_player_won_pong = false
		#TODO get_tree().change_scene_to_file("res://Pong/Singleplayer/scenes_Pong_Singleplayer/PongSingleplayerGameOver.tscn")
	$PongMultiplayerLeftPlayerScore.text = str(LeftPlayerScore)
	# Change the right player color to orange, and back to white when PongMultiplayerScoreTimer resets
	$PongMultiplayerLeftPlayerScore.label_settings.font_color = Color.ORANGE_RED
	$PongMultiplayerScoreTimer.start()

func _on_pong_multiplayer_score_timer_timeout():
	# Change each color back to white
	$PongMultiplayerLeftPlayerScore.label_settings.font_color = Color(217, 216, 215, 255)
	$PongMultiplayerRightPlayerScore.label_settings.font_color = Color(217, 216, 215, 255)

func score_achieved():
	$PongMultiplayerBall.position = Vector2 (640, 360)
	get_tree().call_group("MultiplayerBallGroup", "stop_ball")
	$PongMultiplayerCountdownTimer.start()
	$PongMultiplayerCountdownLabel.visible = true
	$PongMultiplayerScoreSound.play()

func _on_pong_multiplayer_countdown_timer_timeout():
	get_tree().call_group("MultiplayerBallGroup", "restart_ball")
	$PongMultiplayerCountdownLabel.visible = false
