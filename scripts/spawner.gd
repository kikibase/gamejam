extends Node2D

export var initial_no_of_enemies = 10000000000000

func _ready() -> void:
	var rand = RandomNumberGenerator.new()
	var getscene = load("res://scenes/bad guy.tscn")
	var i = 0
	while i <initial_no_of_enemies:
		var enemy = getscene.instance()
		rand.randomize()
		enemy.position.x = rand.randf_range(-1000,2100)
		rand.randomize()
		enemy.position.y = rand.randf_range(-1000,2400)
		add_child(enemy)
		i+=1
