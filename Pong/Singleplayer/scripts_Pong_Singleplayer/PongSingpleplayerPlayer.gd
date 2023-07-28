extends CharacterBody2D


const SPEED = 400.0


func _physics_process(_delta):
	var direction = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	
	# Reset Paddle if it moves from the correct x position
	if(position.x != 22):
		position.x = 22
	if(velocity.x != 0):
		velocity.x = 0
	
	move_and_slide()
