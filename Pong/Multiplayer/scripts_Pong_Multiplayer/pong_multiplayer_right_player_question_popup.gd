extends Control

@onready var countdown_label: Label = $PongMultiplayerRightQuestionCountdownLabel
@onready var countdown_timer: Timer = $PongMultiplayerRightQuestionCountdown

signal right_player_chose(option: int)
signal countdown_timer_timeout_right(x_player: String)

# Listen for user input
func _process(_delta):
	# Emit a signal depending on what the user enters
	# After emitting the corresponding signal,
	# set self visible false, and unpause the tree
	if Input.is_physical_key_pressed(KEY_O):
		right_player_chose.emit(1)
		self.visible = false
		get_tree().paused = false
	if Input.is_physical_key_pressed(KEY_P):
		right_player_chose.emit(2)
		self.visible = false
		get_tree().paused = false
	if Input.is_physical_key_pressed(KEY_BRACKETLEFT):
		right_player_chose.emit(3)
		self.visible = false
		get_tree().paused = false
	if Input.is_physical_key_pressed(KEY_BRACKETRIGHT):
		right_player_chose.emit(4)
		self.visible = false
		get_tree().paused = false
	# Keep the countdown label updated
	countdown_label.text = str(int(countdown_timer.time_left))

func _on_pong_multiplayer_right_question_countdown_timeout():
	print("right set visible false")
	self.visible = false
	countdown_timer_timeout_right.emit("right")
	get_tree().paused = false
