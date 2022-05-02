extends Line2D


func _process(delta):
	var p = get_parent().get_parent().get_node("Point").get_child_count()
	if p > 0:
		self.visible = true
	else:
		clear_points()
		visible = false
