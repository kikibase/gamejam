extends Control
#speed_

func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/main.tscn")
	
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass


func _on_OptionButton_pressed():
	  get_tree().change_scene("res://scenes/Trolls.tscn")        # Replace with function body.
