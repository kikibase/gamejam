extends Node2D


func _ready() -> void:
	var rand = RandomNumberGenerator.new()
	var getscene = load("res://scenes/corruption.tscn")
	#if $Area.get_child(0).overlaps_area(get_parent().get_child(4)):
	#	get_parent().get_child(4).score -=1
	while true:
		yield(get_tree().create_timer(0.5),"timeout")
		var enemy = getscene.instance()
		rand.randomize()
		enemy.position.x = rand.randf_range(-1000,2100)
		rand.randomize()
		enemy.position.y = rand.randf_range(-1000,2400)
		add_child(enemy)
		if get_parent().get_child(4).timer == 0:
			get_tree().change_scene("res://scenes/corruption2.tscn")        # Replace with function body.
