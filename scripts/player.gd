extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite
export var speed_multipler = 500
var velocity: Vector2 = Vector2()
var direction: Vector2 = Vector2()
var attack_instance_area
var world_instance
var score = 0#kill counter
var timer = 45# Time left
var counter = 0#counter


func _ready() -> void:
	attack_instance_area = $Area2D
	

func _physics_process(_delta: float) -> void:
	$Camera2D.get_child(1).text = "Time Left : " +str(timer)
	counter+=1
	if counter % 60 == 0:
		timer-=1
	for i in (get_parent().get_node("enemies")).get_children():
		i.targetBody = self 
		i.isPlayer = true #depending on whether this is your controllable player
	read_input()
	#attack()
	
	


func read_input() -> void:
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
		attack()
		
	if not Input.is_action_pressed("melee_attack") and not Input.is_action_pressed("up") and not Input.is_action_pressed("down") and not Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		if _animated_sprite.frame ==7:
			_animated_sprite.play("idle")
			#_is_attacking = false
			#$CollisionShape2D2.disabled = true
		
		
	


func move_player(x_coords, y_coords) -> void:#dunction to move player
	velocity.y+=y_coords#change character position in y-axis
	velocity.x+=x_coords#change character position in x-axis
	
	direction = Vector2(x_coords,y_coords)#to set the current direction of the player
	
	#if(x_coords ==1):
	#	get_node("AnimatedSprite").get("flip_h")
	
	velocity = velocity.normalized()#normalizes the velocity to the current 
# warning-ignore:return_value_discarded
	move_and_slide(velocity*speed_multipler)


func attack():
	_animated_sprite.play("attack")
	for body in attack_instance_area.get_overlapping_bodies():
		if body !=  self :
			if body != (get_parent().get_child(2)):
				#for i in range((get_parent().get_child(5).get_child_count())):
				#	if  body != get_parent().get_child(5).get_child(i).get_child(0):
				#		continue
				#		if i <= get_parent().get_child(5).get_child_count():
				#			pass
				#	else:
				#		break
				body.get_child(8).play("defeat")
				body.get_child(1).disabled =true
				body.stop = true
				score+=1
				$Camera2D.get_child(0).text = "Kill Count : " +str(score)
				yield(get_tree().create_timer(1),"timeout")
				body.position.x = 999999999999999999
				body.position.y = 999999999999999999
