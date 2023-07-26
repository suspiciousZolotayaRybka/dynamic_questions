extends Control

# Listen for user input
func _process(delta):
	if Input.is_physical_key_pressed(KEY_O):
		print("pressed o")
	if Input.is_physical_key_pressed(KEY_P):
		print("pressed p")
	if Input.is_physical_key_pressed(KEY_BRACKETLEFT):
		print("pressed [")
	if Input.is_physical_key_pressed(KEY_BRACKETRIGHT):
		print("pressed ]")
