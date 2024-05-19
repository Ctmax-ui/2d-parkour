extends Node2D


func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("escape"):
		pauseGame()



func _on_pause_btn_pressed():
	pauseGame()


func pauseGame():
	$Player/pause_menu.visible= not $Player/pause_menu.visible
	get_tree().paused = not get_tree().paused
	


func _on_resume_pressed():
	$Player/pause_menu.visible= not $Player/pause_menu.visible
	get_tree().paused = not get_tree().paused


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/navigation/menu.tscn")
