extends CharacterBody2D

var p_input = Vector2.ZERO
var final_vec = Vector2.ZERO

func _enter_tree():
	Singleton.cat = self

func _physics_process(delta):
	
	p_input.x = Input.get_axis("left","right")
	p_input.y = Input.get_axis("up","down")
	
	p_input = p_input.normalized()
	
	final_vec = final_vec.move_toward(p_input * 80,10)
	
	
	velocity = final_vec
	
	move_and_slide()
	
	if p_input != Vector2.ZERO:
		$Icon/AnimationPlayer.speed_scale = 4
	else:
		$Icon/AnimationPlayer.speed_scale = 1
	
	if p_input.x > 0:
		$Icon.flip_h = false
	elif p_input.x < 0:
		$Icon.flip_h = true
	

func hurt():
	Singleton.hp_cat -= 1
