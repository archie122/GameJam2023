extends CharacterBody2D

var health: int 
var damage: int

var speed: int
var direction: Vector2 = Globals.player_position

signal spawn_wood()
signal spawn_stone()
signal spawn_steel()


var rng = RandomNumberGenerator.new()

func _process(delta):
	direction = (Globals.player_position - position).normalized()
	
	position += direction  * delta * speed
	velocity = Vector2.ZERO
	look_at(Globals.player_position)
	move_and_slide()
	rotate(deg_to_rad(-90))
	
	if health <= 0:
		queue_free()
		var number = (int)(rng.randf_range(0,100))
		print(number)
		if(number <= 5):
			print("spawn steel")
		elif(number <= 15):
			print("spawn stone")
		elif(number <= 35):
			print(("spawn wood"))



func hit(dmg):
	health -= dmg


func _on_hit_player_body_entered(body):
	if("hit" in body):
		body.hit(damage)

