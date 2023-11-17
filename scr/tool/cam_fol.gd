@tool
extends Marker2D

@export var target = NodePath()

func _process(delta):
	if target != null:
		global_position = get_node(target).global_position
