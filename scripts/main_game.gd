extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("escape"):
		pauseGame()



func _on_pause_btn_pressed():
	pauseGame()


func pauseGame():
	$Player/pause_menu2.visible= not $Player/pause_menu2.visible
	get_tree().paused = not get_tree().paused
