extends Area2D

func _on_Spikes_body_entered(body):
	if body.is_in_group("Player"):
		body.global_position = body.respawn_point
	pass # Replace with function body.
