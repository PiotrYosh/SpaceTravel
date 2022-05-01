extends RigidBody2D




func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_body_entered(body):
	if body.is_in_group("T1"):#T1 Grupa pierwszej tilemapy
		queue_free()
