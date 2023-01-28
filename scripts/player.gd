extends KinematicBody2D

export var speed_multipler = 500

var velocity: Vector2 = Vector2()
var direction: Vector2 = Vector2()

func _physics_process(_delta: float) -> void:
	read_input()


func read_input() -> void:
	if Input.is_action_just_pressed("up"):#check if input is the up 
		move_player(0,1)
	if Input.is_action_just_pressed("down"):
		move_player(0,-1)
	if Input.is_action_just_pressed("left"):
		move_player(-1,0)
	if Input.is_action_just_pressed("right"):
		move_player(1,0	)
		

func move_player(var x_coords, var y_coords) -> void:#dunction to move player
	velocity.y+=y_coords#change character position in y-axis
	velocity.x+=x_coords#change character position in x-axis
	
	direction = Vector2(x_coords,y_coords)#to set the current direction of the player
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity*speed_multipler)
