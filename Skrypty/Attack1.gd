extends Node2D

onready var player : KinematicBody2D = get_parent()
var A1_preload = preload("res://Sceny/A1.tscn")
var speed = 800


func _process(delta):
	if Input.is_action_just_pressed("PPM"):
		shot1()
		
func shot1():
		var poz = get_global_mouse_position()
		var a1 = A1_preload.instance()
		var direction = (player.global_position - poz).normalized()
		a1.position = player.position
#		a1.set_linear_velocity(direction * speed)
		a1.apply_central_impulse(-direction * speed)
		get_tree().get_root().add_child(a1)
