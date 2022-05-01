extends Node2D

######## Przesuwanie mapy ########################
var offset_x_bg = 0
var offset_y_bg = 0
var offset_x_bg2 = 0
var offset_y_bg2 = 0
##################################################
######### Ruch Playera ###########################
onready var nav_2d : Navigation2D = $Navigation2D
onready var line_2d : Line2D = $Line2D
onready var line_2dRED : Line2D = $Line2DRED
onready var character : KinematicBody2D = $Robot01
var last_mouse_pos = null
var point_click = preload("res://Sceny/Point.tscn")
var red_line_ready = true
export var center = false
##################################################


########  Proces  ############
func _physics_process(delta):
	red_line()
	przesowanie_mapy_bg()
	camera()
#############################

func przesowanie_mapy_bg():
	$Control/ParallaxBackground/ParallaxLayer.set_motion_offset(Vector2(offset_x_bg, 0))
	offset_x_bg -= 2
	$Control/ParallaxBackground/ParallaxLayer2.set_motion_offset(Vector2(offset_x_bg2, 0))
	offset_x_bg2 -= 4
func _input(event: InputEvent):
	if not event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_LEFT or not event.pressed:
		return
	var new_path : = nav_2d.get_simple_path(character.global_position, get_global_mouse_position(), center)
	line_2d.points = new_path
	character.path = new_path
	line_2dRED.clear_points()
	red_line_ready = true
	
	
	last_mouse_pos = get_global_mouse_position()
	var p = point_click.instance()
	p.position = last_mouse_pos
	get_node("Point").add_child(p)
#	last_mouse_pos = get_global_mouse_position()
func red_line():
	if character.path.size() == 0 and $Point.get_child_count() >= 1 and red_line_ready == true:
		line_2dRED.add_point(character.position)
		line_2dRED.add_point(last_mouse_pos)
		red_line_ready = false

func camera():
	$Camera2D.global_position = character.global_position
