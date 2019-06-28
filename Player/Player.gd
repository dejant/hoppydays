extends KinematicBody2D

var motion = Vector2(0,0) # x,y

const SPEED = 800
const GRAVITY = 75
const UP = Vector2(0,-1)
const DOWN = Vector2(0,1)
const JUMPSPEED = 1600

signal animate

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)


func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY


func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMPSPEED


func move():
	if Input.is_action_pressed("left") and Input.is_action_pressed("right"):
		motion.x = 0
	elif Input.is_action_pressed("left"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right"):
		motion.x = SPEED
	else:
		motion.x = 0


func animate():
	emit_signal("animate", motion)