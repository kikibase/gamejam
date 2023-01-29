extends Node2D


func _ready() -> void:
	var rand = RandomNumberGenerator.new()
	var getscene = load("res://scenes/corruption.tscn")
	while true:
		yield(get_tree().create_timer(0.5),"timeout")
		var enemy = getscene.instance()
		rand.randomize()
		enemy.position.x = rand.randf_range(-1000,2100)
		rand.randomize()
		enemy.position.y = rand.randf_range(-1000,2400)
		add_child(enemy)
