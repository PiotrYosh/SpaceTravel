extends Line2D


func _process(_delta):
	var p = get_parent().get_node("Point").get_child_count()
	if p > 0:
		self.visible = true
	else:
		visible = false
