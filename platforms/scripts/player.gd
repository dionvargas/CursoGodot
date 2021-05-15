extends KinematicBody2D

var grav = 300
var speed = 200
var dir = Vector2()

func _ready():
	pass

func _physics_process(delta):

	if not is_on_floor():
		dir.y += grav * delta
	else:
		dir.y = 300
	
	if Input.is_action_pressed("ui_right"):
		dir.x = speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		dir.x = -speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	else:
		dir.x = 0
		$AnimatedSprite.play("idle")
	
	if is_on_floor() and Input.is_action_pressed("ui_select"):
		dir.y -=600
	
	move_and_slide(dir, Vector2(0, -1))

func jump():
	dir.y -= 300
