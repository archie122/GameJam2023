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
		look_at(direction)
		move_and_slide()
		rotate(deg_to_rad(90))
	
	if health <= 0:
		queue_free()
		print("drop meat + leather")



func hit(dmg):
	health -= dmg







func _on_area_2d_body_entered(body):
	move = true


func _on_area_2d_body_exited(body):
	move = false
