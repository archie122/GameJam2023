extends CharacterBody2D

var speed: int = 400

func _process(delta):
	
	var direction: Vector2 = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = speed * direction 
	move_and_slide()
	look_at(get_global_mouse_position())
