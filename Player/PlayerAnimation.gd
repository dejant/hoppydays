extends AnimatedSprite


func _on_Player_animate(motion):
	if motion.y < 0:
		play("jump")
	elif motion.x > 0:
		set_flip_h(false)
		play("walkRight")
	elif motion.x < 0:
		set_flip_h(true)
		play("walkLeft")
	else: play("idle")