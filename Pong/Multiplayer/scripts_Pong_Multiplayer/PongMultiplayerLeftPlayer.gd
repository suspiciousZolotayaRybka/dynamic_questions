extends CharacterBody2D


const SPEED = 325.0
var speed_multiplier: float = 1
var direction: int

func _physics_process(_delta):
	# Find which key the user is pressing
	if (Input.is_physical_key_pressed(KEY_W)):
		direction = -1
	elif (Input.is_physical_key_pressed(KEY_S)):
		direction = 1
	else:
		direction = 0
	
	# Change the velocity accordingly 
	if direction:
		velocity.y = (direction * SPEED * speed_multiplier)
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	
	# Reset Paddle if it moves from the correct x position
	if(position.x != 22):
		position.x = 22
	if(velocity.x != 0):
		velocity.x = 0
	
	move_and_slide()
