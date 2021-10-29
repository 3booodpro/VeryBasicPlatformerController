extends KinematicBody2D

var motion = Vector2(0,0)
var speed = 120
var gravity = 10
var jump = -250

var respawn_point = Vector2()

func _ready():
	respawn_point = global_position
	pass

func _process(delta):
	pass

func _physics_process(delta):
	move_and_slide(motion,Vector2.UP)
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		$Sprite.flip_h = false
		if is_on_floor():
			$AnimationPlayer.play("move")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		$Sprite.flip_h = true
		if is_on_floor():
			$AnimationPlayer.play("move")
	else:
		motion.x = 0
		if is_on_floor():
			$AnimationPlayer.play("idle")
	
	if is_on_floor() == false:
		motion.y += gravity
		
		if motion.y > gravity:
			$AnimationPlayer.play("fall")
		if motion.y < -gravity:
			$AnimationPlayer.play("fall")
	else:
		motion.y = gravity
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump
	
	Void()
	pass

func Void():
	if global_position.y >= 600:
		global_position = respawn_point
	pass

func _on_Hitbox_body_entered(body):
	if body.is_in_group("Enemy"):
		global_position = respawn_point
	pass # Replace with function body.
