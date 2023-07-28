extends CharacterBody2D


const SPEED = 325.0
var speed_multiplier: float = 1
var direction: int

func _physics_process(_delta):
	# Find which key the user is pressing
	if (Input.is_physical_key_pressed(KEY_UP)):
		direction = -1
	elif (Input.is_physical_key_pressed(KEY_DOWN)):
		direction = 1
	else:
		direction = 0
	
	# Change the velocity accordingly 
	if direction:
		velocity.y = (direction * SPEED * speed_multiplier)
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	
	# Reset Paddle if it moves from the correct x position
	if(position.x != 1258):
		position.x = 1258
	if(velocity.x != 0):
		velocity.x = 0
	
	move_and_slide()
