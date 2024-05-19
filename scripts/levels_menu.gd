extends Control




func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/navigation/menu.tscn")


func _on_level_1_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")


func _on_level_2_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
