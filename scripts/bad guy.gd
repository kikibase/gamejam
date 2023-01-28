extends KinematicBody2D

const UP = Vector2(0, -1);
const GRAVITY = 20;
var motion = Vector2();
var targetBody : CollisionObject2D
var TargetActive : bool = false
var a = 0
var activepoint
var Targetdir : Vector2
var pathpointdir : Vector2

export(Texture) var spriteTex
export(String, "top", "bottom", "center") var TexAnchor = "center"
export var SPEED = 300;
export var JUMP_HEIGHT = -500;
export(float,0.05,1,0.05) var slide = 0.2
export var pathpointA = Vector2(0,0)
export var pathpointB = Vector2(0,0)
export var idleTime = 1.0
export var outofrangeTime = 2.0
export(String, "never", "none", "always") var canAlwaysSee = "none"
export(bool) var enableColorRect = false
export(float) var jumpmaxoffset = 0

var isPlayer
var idle : bool = false
var idleTimeElapsed = 0.0
var outofrangeTimeElapsed = 0.0

func _ready():
	$ColorRect.color.a = int(enableColorRect)
	$Sprite.texture = spriteTex
	if TexAnchor == "bottom":
		$Sprite.offset.y = 64 - ($Sprite.get_rect().size.y/2)
	elif TexAnchor == "top":
		$Sprite.offset.y = -64 + ($Sprite.get_rect().size.y/2)
	elif TexAnchor == "center":
		$Sprite.offset.y = 0
	$idletimer.wait_time = idleTime
	$outofrange.wait_time = outofrangeTime
	$jumpcasts/jumpmax.translate(Vector2(0,jumpmaxoffset))
	set_physics_process(false)
	pass

func inSight():

	$sight.cast_to = Vector2(targetBody.position.x - position.x, targetBody.position.y - position.y)
	if $sight.get_collider() != targetBody:
		return false
	else:
		return true

func canSee():
	if $eye.overlaps_body(targetBody):
		if inSight():
			return true
	else:
		$sight.cast_to = Vector2(0,0)
		return false

func canJump():
	if is_on_floor() and $jumpcasts/jumpcast.is_colliding() and not $jumpcasts/jumpmax.is_colliding() and not $jumpcasts/jumpcast.get_collider().name == "Player":
		return true
	else:
		return false

func _physics_process(delta):
	motion.y += GRAVITY

	if targetBody.position.x - position.x + 32 <= 50 and targetBody.position.x - position.x >= -50:
		Targetdir.x = 0
	
	elif targetBody.position.x - position.x > 0:
		Targetdir.x = 1
	elif:
Targetdir.x = -1
Targetdir = Targetdir.normalized() * SPEED
motion += Targetdir
position += motion * delta
_check_for_collision()
