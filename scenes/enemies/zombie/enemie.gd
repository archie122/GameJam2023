extends CharacterBody2D

var health: int = 100
var damage: int = 400

var speed: int = 300
var direction: Vector2 = Globals.player_position


func _process(delta):
	direction = (Globals.player_position - position).normalized()
	
	position += direction  * delta * speed
	velocity = Vector2.ZERO
	look_at(Globals.player_position)
	move_and_slide()
	rotate(deg_to_rad(-90))
	
	if health <= 0:
		queue_free()



func hit():
	health -= 50


func _on_hit_player_body_entered(body):
	if("hit" in body):
		body.hit(damage)
