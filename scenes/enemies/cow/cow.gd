extends CharacterBody2D

var health: int = 100
var speed: int = 350
var direction: Vector2 = Globals.player_position

var move: bool = false
var dead: bool = false
func _process(delta):
	if(move):
		direction = (position - Globals.player_position ).normalized()
		
		position += direction  * delta * speed
		velocity = Vector2.ZERO
		look_at(position+Vector2(50,0))
		move_and_slide()
#		rotate(deg_to_rad(90))
	
	if !dead and health <= 0:
		Globals.spawn_leather_and_raw_meat.emit(position)
		hide()
		set_collision_layer_value(3,false)
		$respawn.start()
		dead = true




func hit(dmg):
	health -= dmg


func _on_area_2d_body_entered(body):
	move = true


func _on_area_2d_body_exited(body):
	move = false


func _on_respawn_timeout():
	health = 100
	show()
	set_collision_layer_value(3,true)
	dead = false
