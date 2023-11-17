extends Node2D

var time_left = 0

func _ready():
	reset_tm()

func reset_tm():
	time_left = Singleton.h_man_tm

func _physics_process(delta):
	time_left -= delta
	
	if time_left <= 0:
		reset_tm()
		spawn_human()
	

func spawn_human():
	
	var human = load("res://scr/actor/hman/hman.tscn").instantiate()
	var cat = Singleton.cat
	
	# Y pos
	var spawn_pos = cat.global_position
	human.global_position.y = spawn_pos.y
	
	
	# X pos
	randomize()
	var rand_num = floor(randf_range(0,2))
	
	if rand_num == 0:
		human.global_position.x = -85
		human.dir = 1
	else:
		human.global_position.x = 545
		human.dir = -1
	
	get_tree().current_scene.add_child(human)
	

