extends Node

func _ready():
		if Global.tile_center_nav:
			$CanvasLayer/AdminPanel/Info_tile.text = "Tile Nav Center = false"
		else:
			$CanvasLayer/AdminPanel/Info_tile.text = "Tile Nav Center = true"



func _input(event):
	if event.is_action_pressed("ESC"):
		get_tree().quit()
	if event.is_action_pressed("ui_accept"):
		Global.tile_center_nav = !Global.tile_center_nav
		if Global.tile_center_nav:
			$CanvasLayer/AdminPanel/Info_tile.text = "Tile Nav Center = false"
		else:
			$CanvasLayer/AdminPanel/Info_tile.text = "Tile Nav Center = true"
			

