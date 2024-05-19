extends CharacterBody2D
@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D
@onready var timer = $Timer


@export var health := 3
@export var damage := 3
@export var pointes := 0
const SPEED = 100.0
const JUMP_VELOCITY = -300.0

var is_attacking = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func  _ready():
	pass

func _physics_process(delta):
	$pointes.text = "Coins:" + str(pointes)
	
	
	if Input.is_action_just_pressed("attack") and not is_attacking :
		attack()

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("Move_left", "Move_right")
	if direction > 0:
		sprite_2d.flip_h=false
	elif direction < 0:
		sprite_2d.flip_h= true
	
	#animation
	if is_on_floor() and not is_attacking and direction == 0:
		animation_player.play("idle")
	elif not is_on_floor() and not is_attacking:
		animation_player.play("jump")
	elif  is_on_floor() and not is_attacking and (direction < 0 || direction > 0):
		animation_player.play("run")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()


#attack 
func attack():
	$Area2D.monitoring = true
	
	if not sprite_2d.flip_h:
		$Area2D/CollisionShape2D.disabled=false
	else:
		$Area2D/CollisionShape2D2.disabled= false

	animation_player.play("attack", 0, 3)
	is_attacking = true
	timer.start()

func _on_timer_timeout():
	$Area2D.monitoring = false
	$Area2D/CollisionShape2D.disabled= true
	$Area2D/CollisionShape2D2.disabled= true
	is_attacking = false



#pointes 
func _on_area_2d_area_entered(area):
	area.queue_free()
	pointes += 1
	
func _on_player_area_area_entered(area):
	pointes += 1
	
	if area.name == "killzone":
		$Node2D/AnimationPlayer.play("dead")


