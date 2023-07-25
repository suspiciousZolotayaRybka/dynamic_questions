extends CharacterBody2D


const SPEED = 400
var ball

func _ready():
	ball = get_tree().get_root().find_child("Ball", true, false)

func _physics_process(delta):
	velocity.y = get_opponent_direction() * SPEED
	move_and_slide()
	
	if (position.x != 1254):
		position.x = 1254

func get_opponent_direction():
	if (abs(ball.position.y - self.position.y) > 25):
		if (ball.position.y > self.position.y): return 1
		else: return -1
	else: return 0
