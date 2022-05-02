extends Node2D




func zmiana():
	for p in get_children():
		p.active = false
	get_child(Global.player_active).active = true


func _process(delta):
	if Input.is_action_just_pressed("1"):
		Global.player_active = 0
		zmiana()
	if Input.is_action_just_pressed("2"):
		Global.player_active = 1
		zmiana()
	if Input.is_action_just_pressed("3"):
		Global.player_active = 2
		zmiana()
	if Input.is_action_just_pressed("4"):
		Global.player_active = 3
		zmiana()
