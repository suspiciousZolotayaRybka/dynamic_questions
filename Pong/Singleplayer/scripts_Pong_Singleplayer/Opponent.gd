extends CharacterBody2D


const SPEED = 400
var ball

func _ready():
	ball = get_tree().get_root().find_child("Ball", true, false)

func _physics_process(_delta):
	velocity.y = get_opponent_direction() * SPEED
	
	# Reset Paddle if it moves from the correct x position
	if (position.x != 1260):
		position.x = 1260
	if(velocity.x != 0):
		velocity.x = 0
	
	move_and_slide()

func get_opponent_direction():
	if (abs(ball.position.y - self.position.y) > 25):
		if (ball.position.y > self.position.y): return 1
		else: return -1
	else: return 0
