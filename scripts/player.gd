extends KinematicBody2D

const SPEED_MULTIPLIER = 500

var velocity = Vector2()
var direction = Vector2()

func _physics_process(delta : float )-> void :
	read_input()

func read_input():
	if Input.is_action_pressed("up"):
		move_player(0, -1)
	elif Input.is_action_pressed("down"):
		move_player(0, 1)
	elif Input.is_action_pressed("left"):
		move_player(-1, 0)
	elif Input.is_action_pressed("right"):
		move_player(1, 0)

func move_player(x_coords, y_coords):
	velocity.x += x_coords
	velocity.y += y_coords

	direction = Vector2(x_coords, y_coords)
	velocity = velocity.normalized()
	move_and_slide(velocity * SPEED_MULTIPLIER)

