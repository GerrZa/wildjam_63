extends Node2D

var initShadowSize = 0
var initHumanPosY = 0

var finShadowSize

var speed = 0

func _ready():
	initShadowSize = $Polygon2D.scale.x
	initHumanPosY = abs($human.position.y)
	
	speed = Singleton.humanfallSp
	
	$Polygon2D.scale = Vector2.ZERO

func _physics_process(delta):
	finShadowSize = initShadowSize - (abs($human.position.y) / initHumanPosY) * initShadowSize
	$human.position.y += Singleton.humanfallSp
	
	if $human.position.y >= 0:
		damage()
		createBoom()
		queue_free()
	
	$Polygon2D.scale = Vector2(finShadowSize,finShadowSize)
	

func damage():
	
	for node in $Area2D.get_overlapping_areas():
		node.owner.hurt()

func createBoom():
	var boomIns = load("res://scr/fx/boom/boom.tscn").instantiate()
	
	boomIns.global_position = global_position
	
	get_tree().current_scene.add_child(boomIns)
