extends Node2D

var time_left = 0

func _ready():
	reset_tm()

func reset_tm():
	time_left = Singleton.fallhu_tm

func _physics_process(delta):
	time_left -= delta
	
	if time_left <= 0:
		reset_tm()
		spawn_human()
	

func spawn_human():
	
	var human = load("res://scr/actor/fall_human/fall_human.tscn").instantiate()
	var cat = Singleton.cat
	
	var spawn_pos = cat.global_position
	human.global_position = spawn_pos
	
	get_tree().current_scene.add_child(human)
	
