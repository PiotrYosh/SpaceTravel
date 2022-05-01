extends Node


func _input(event):
	if event.is_action_pressed("ESC"):
		get_tree().quit()
