extends Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_right_2 = $RayCastRight2
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_left_2 = $RayCastLeft2

const enemySpeed:int = 60
var direction:int =1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding() || !ray_cast_right_2.is_colliding():
		direction= -1
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding() || !ray_cast_left_2.is_colliding():
		direction= 1
		animated_sprite_2d.flip_h = false		
	
	position.x += direction * enemySpeed * delta
 
