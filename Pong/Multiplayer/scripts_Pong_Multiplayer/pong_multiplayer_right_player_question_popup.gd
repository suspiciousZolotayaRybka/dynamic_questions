extends Control

@onready var countdown_label: Label = $PongMultiplayerRightQuestionCountdownLabel
@onready var countdown: Timer = $PongMultiplayerRightQuestionCountdown

signal right_player_chose_a
signal right_player_chose_b
signal right_player_chose_c
signal right_player_chose_d

# Listen for user input
func _process(_delta):
	if Input.is_physical_key_pressed(KEY_O):
		right_player_chose_a.emit()
		self.visible = false
		get_tree().paused = false
	if Input.is_physical_key_pressed(KEY_P):
		right_player_chose_b.emit()
		self.visible = false
		get_tree().paused = false
	if Input.is_physical_key_pressed(KEY_BRACKETLEFT):
		right_player_chose_c.emit()
		self.visible = false
		get_tree().paused = false
	if Input.is_physical_key_pressed(KEY_BRACKETRIGHT):
		right_player_chose_d.emit()
		self.visible = false
		get_tree().paused = false
	countdown_label.text = str(int(countdown.time_left))
