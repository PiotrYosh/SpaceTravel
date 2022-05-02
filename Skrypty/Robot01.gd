extends KinematicBody2D

export var active = false
var last_mouse_pos = null
var point_click = preload("res://Sceny/Point.tscn")
var path : = PoolVector2Array() setget set_path


######### Ruch Playera ###########################
onready var nav_2d : Navigation2D = get_parent().get_parent().get_node("Navigation2D")
onready var line_2d : Line2D = get_parent().get_parent().get_node("Line/Line2D")
onready var line_2dRED : Line2D = get_parent().get_parent().get_node("Line/Line2DRED")
var character = self
var red_line_ready = true
##################################################




func _ready() -> void:
#	last_mouse_pos = position
	set_process(false)
	
########  Proces  ############
func _physics_process(delta):
	red_line()
	
	var move_distance = Global.playerspeed * delta
	move_analog_path(move_distance)
	pass
		
	
#############################
		
		
func move_analog_path(distance : float) -> void:
	var start_point : = position
	for i in range(path.size()):
		var distance_to_next : = start_point.distance_to(path[0])
		if distance <= distance_to_next and distance >= 0.0:
			position = start_point.linear_interpolate(path[0], (distance) / (distance_to_next))
			break
		elif distance < 0.0:
			position = path[0]
			set_process(false)
			break
		else:
			pass
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)
func set_path(value: PoolVector2Array) -> void:
	path = value
	if value.size() == 0:
		return
	set_process(true)


func _input(event: InputEvent):
	if active == true:
		if not event is InputEventMouseButton:
			return
		if event.button_index != BUTTON_LEFT or not event.pressed:
			return
			
		
		var new_path : = nav_2d.get_simple_path(character.global_position, get_global_mouse_position(), Global.tile_center_nav)
		line_2d.points = new_path
#		print(name)
		character.path = new_path
		line_2dRED.clear_points()
		red_line_ready = true
		
		last_mouse_pos = get_global_mouse_position()
		var p = point_click.instance()
		p.position = last_mouse_pos
		get_parent().get_parent().get_node("Point").add_child(p)
	
func red_line():
	if last_mouse_pos != null:
		if character.path.size() == 0 and get_parent().get_parent().get_node("Point").get_child_count() >= 1 and red_line_ready == true:
				line_2dRED.add_point(character.position)
				line_2dRED.add_point(last_mouse_pos)
				red_line_ready = false
