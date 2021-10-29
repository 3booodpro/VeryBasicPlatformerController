extends KinematicBody2D

var motion = Vector2(0,0)
var speed = 120
var gravity = 10
var dir = -1

func _process(delta):
	pass

func _physics_process(delta):
	
	motion.x = speed * dir
	
	move_and_slide(motion,Vector2.UP)
	
	if !is_on_floor():
		motion.y += gravity
	else:
		motion.y = gravity
	
	if is_on_wall():
		dir *= -1
		$Sprite.flip_h = !$Sprite.flip_h
	
	pass

func _on_Hitbox_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
	pass # Replace with function body.
