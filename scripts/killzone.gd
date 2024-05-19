extends Area2D
@onready var timer = $Timer


func _on_body_entered(body):
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	get_tree().paused = true

func _on_timer_timeout():
	get_tree().paused = false
	get_tree().reload_current_scene()





