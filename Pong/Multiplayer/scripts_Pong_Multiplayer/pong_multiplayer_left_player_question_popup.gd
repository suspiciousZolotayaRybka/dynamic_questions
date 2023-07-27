extends Control

@onready var countdown_label: Label = $PongMultiplayerLeftQuestionCountdownLabel
@onready var countdown_timer: Timer = $PongMultiplayerLeftQuestionCountdown

signal left_player_chose(option: int)
signal countdown_timer_timeout_left(x_player: String)

# Listen for user input
func _process(_delta):
	# Emit a signal depending on what the user enters
	# After emitting the corresponding signal,
	# set self visible false, and unpause the tree
	if Input.is_physical_key_pressed(KEY_1):
		left_player_chose.emit(1)
		self.visible = false
		get_tree().paused = false
	if Input.is_physical_key_pressed(KEY_2):
		left_player_chose.emit(2)
		self.visible = false
		get_tree().paused = false
	if Input.is_physical_key_pressed(KEY_3):
		left_player_chose.emit(3)
		self.visible = false
		get_tree().paused = false
	if Input.is_physical_key_pressed(KEY_4):
		left_player_chose.emit(4)
		self.visible = false
		get_tree().paused = false
	# Keep the countdown label updated
	countdown_label.text = str(int(countdown_timer.time_left))

func _on_pong_multiplayer_left_question_countdown_timeout():
	countdown_timer_timeout_left.emit("left")
	self.visible = false
	get_tree().paused = false
