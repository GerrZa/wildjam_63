extends Sprite2D

var speed = 0
var dir = 0

func _ready():
	speed = Singleton.h_man_sp
	

func _physics_process(delta):
	
	global_position.x += dir * speed
	
	if global_position.x > 544 or global_position.x < -94:
		queue_free()
	
	if $Area2D.get_overlapping_areas().size() > 0:
		damage()
		createBoom()
		
		queue_free()
	
	if dir == 1:
		flip_h = true
	elif dir == -1:
		flip_h = false


func createBoom():
	var boomIns = load("res://scr/fx/boom/boom.tscn").instantiate()
	
	boomIns.global_position = global_position
	
	get_tree().current_scene.add_child(boomIns)

func damage():
	
	for node in $Area2D.get_overlapping_areas():
		node.owner.hurt()
