extends Node2D

export var initial_no_of_enemies = 25

func _ready() -> void:
	var rand = RandomNumberGenerator.new()
	var getscene = load("res://scenes/bad guy.tscn")
	var i = 0
	while i <initial_no_of_enemies:
		#add_child(get_parent().get("res://scenes/bad guy.tscn"))
		var enemy = getscene.instance()
		rand.randomize()
		enemy.position.x = rand.randf_range(-2561,2596)
		rand.randomize()
		enemy.position.y = rand.randf_range(-1670,2671)
		add_child(enemy)
		i+=1
