extends CharacterBody2D

var speed = 600
var hits_to_question = 5
var is_last_hit_left: bool = false
# TODO delete all last_hit references to right?
var is_last_hit_right: bool = false
@onready var player_left: CharacterBody2D = get_tree().get_root().find_child("PongMultiplayerLeftPlayer", true, false)
@onready var player_right: CharacterBody2D = get_tree().get_root().find_child("PongMultiplayerRightPlayer", true, false)

func _ready():
	# randomize() doesn't use the same seed every single time
	randomize()
	# randi() picks random infinite number randi() % 2 picks 0 or 1
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.8, 0.8][randi() % 2]

func _physics_process(delta):
	if ((velocity == Vector2(0, 0)) or (abs(velocity.x) < .05 or abs(velocity.y) < .05)):
		# Make ball go fast again if it slows down
		print("velocity stopped")
		self.velocity.x = [-1, 1][randi() % 2]
		self.velocity.y = [-0.8, 0.8][randi() % 2]
	move_and_slide()
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		hits_to_question -= 1
		$CollisionSound.play()
		velocity = velocity.bounce(collision_object.get_normal())
		if (hits_to_question == 0):
			get_tree().get_root().find_child("PongMultiplayerMain", true, false).show_question()
			hits_to_question = 5
		# Check to see who the last paddle was to hit the ball to prepare the proper question
		if (collision_object.get_collider() == player_left):
			is_last_hit_left = true
			is_last_hit_right = false
		if (collision_object.get_collider() == player_right):
			is_last_hit_right = true
			is_last_hit_left = false
	# Reset speedy balls from questions, prevents infinite speeds from happening
	if (velocity.x > 3):
		print("speedy velocity reset")
		velocity.x = 1
	elif (velocity.x < -3):
		print("speedy velocity reset")
		velocity.x = -1
	if (velocity.y > 3):
		print("speedy velocity reset")
		velocity.y = 1
	elif (velocity.y < -3):
		print("speedy velocity reset")
		velocity.y = -1
	# Reset balls that have a x velocity causing them to only move vertically
	if ((0 < velocity.x) and (velocity.x < .35)):
		print("vertical velocity reset")
		velocity.x = 1
	if ((-.35 < velocity.x) and (velocity.x <= 0)):
		print("vertical velocity reset")
		velocity.x = -1
	# Hitting the ball a certain way causes it to disappear
		# Presumably its speed increases exponentially for a frame before being reset
			# but at that point it made it through area2d without registering, this should fix that
	#TODO save or delete depending on if the bug happens again
	if ((position.y < -5) or (position.y > 725) or (position.x < -150) or (position.x > 1430)):
		print("lost ball reset")
		restart_ball()

func stop_ball():
	speed = 0

func restart_ball():
	# randomize() doesn't use the same seed every single time
	randomize()
	# Reset speed
	speed = 600
	# randi() picks random infinite number randi() % 2 picks 0 or 1
	self.velocity.x = [-1, 1][randi() % 2]
	self.velocity.y = [-0.8, 0.8][randi() % 2]
