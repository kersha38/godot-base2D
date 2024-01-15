extends KinematicBody2D

export var speed = 1
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO 
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		$AnimatedSprite.animation = "run"
		velocity = velocity.normalized() * speed
	else:
		$AnimatedSprite.animation = "idle"
		
	if velocity.x != 0:
		$AnimatedSprite.flip_h = velocity.x < 0
	#position += velocity * delta
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	move_and_collide(velocity)
