extends Node2D

func _ready():
	Singleton.totalTm = 0

func _physics_process(delta):
	Singleton.totalTm += delta
