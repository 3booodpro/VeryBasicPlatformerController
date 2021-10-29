extends Area2D

var jump = -400

func _on_JumpPad_body_entered(body):
	if body.is_in_group("Player"):
		$AnimationPlayer.play("used")
		body.motion.y = jump
	pass # Replace with function body.
