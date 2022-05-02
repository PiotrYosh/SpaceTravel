extends Node2D

onready var player : KinematicBody2D = get_parent()
var A1_preload = preload("res://Sceny/A1.tscn")


func _process(delta):
	if Input.is_action_just_pressed("PPM"):
		shot1()
		
func shot1():
		var poz = get_global_mouse_position()
		var a1 = A1_preload.instance()
		var direction = (player.global_position - poz).normalized()
		a1.position = player.position
		a1.apply_central_impulse(-direction * Global.shot_A1_speed)
		get_tree().get_root().add_child(a1)
