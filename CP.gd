extends Area2D

func _on_CP_body_entered(body):
	if body.is_in_group("Player"):
		body.respawn_point = global_position
		$AnimationPlayer.play("used")
		$CollisionShape2D.set_deferred("disabled",true)
	pass # Replace with function body.
