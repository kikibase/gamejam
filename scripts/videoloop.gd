extends VideoPlayer        


func _ready():           
	set_process(true)


func _process(delta): 
	if not is_playing():
		play()


func _on_MenuButton_pressed():
  get_tree().change_scene("res://scenes/TitleScreen.tscn")          # Replace with function body.
