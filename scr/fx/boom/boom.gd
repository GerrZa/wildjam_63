extends Node2D

func _ready():
	$boomSpr/AnimationPlayer.play("boom")
	
	await $boomSpr/AnimationPlayer.animation_finished
	
	queue_free()
