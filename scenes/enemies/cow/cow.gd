extends CharacterBody2D

var health: int = 100
var speed: int = 350
var direction: Vector2 = Globals.player_position

var move: bool = false

func _process(delta):
	if(move):
		direction = (position - Globals.player_position ).normalized()
		
		position += direction  * delta * speed
		velocity = Vector2.ZERO
		look_at(position+Vector2(50,0))
		move_and_slide()
#		rotate(deg_to_rad(90))
	
	if health <= 0:
		Globals.spawn_leather_and_raw_meat.emit(position)
		queue_free()




func hit(dmg):
	health -= dmg


func _on_area_2d_body_entered(body):
	move = true


func _on_area_2d_body_exited(body):
	move = false
