extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite
export var speed_multipler = 500

var velocity: Vector2 = Vector2()
var direction: Vector2 = Vector2()

func _physics_process(_delta: float) -> void:
	for i in (get_parent().get_node("enemies")).get_children():
		i.targetBody = self 
		i.isPlayer = true #depending on whether this is your controllable player
	read_input()
	#attack()
	
	


func read_input() -> void:
	if not Input.is_action_pressed("melee_attack") and not Input.is_action_pressed("up") and not Input.is_action_pressed("down") and not Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		if _animated_sprite.frame ==7:
			_animated_sprite.play("idle")
	if Input.is_action_pressed("up"):#check if input is the up 
		move_player(0,-1)
		_animated_sprite.play("walking")		
	if Input.is_action_pressed("down"):
		move_player(0,1)
		_animated_sprite.play("walking")	
	if Input.is_action_pressed("left"):
		move_player(-1,0)
		_animated_sprite.play("walking")
		_animated_sprite.flip_h = true
	if Input.is_action_pressed("right"):
		move_player(1,0)
		_animated_sprite.play("walking")
		_animated_sprite.flip_h = false
	if Input.is_action_pressed("melee_attack") or (Input.is_action_pressed("melee_attack") and Input.is_action_pressed("right") ):
		_animated_sprite.play("attack")
		
	
		
		
	


func move_player(x_coords, y_coords) -> void:#dunction to move player
	velocity.y+=y_coords#change character position in y-axis
	velocity.x+=x_coords#change character position in x-axis
	
	direction = Vector2(x_coords,y_coords)#to set the current direction of the player
	
	#if(x_coords ==1):
	#	get_node("AnimatedSprite").get("flip_h")
	
	velocity = velocity.normalized()#normalizes the velocity to the current 
# warning-ignore:return_value_discarded
	move_and_slide(velocity*speed_multipler)
	

	
