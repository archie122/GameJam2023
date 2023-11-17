extends Area2D
var speed: int = 1000
var damage: int = 50
var direction:Vector2 = Vector2.UP

func _ready():
	$despawn.start()
	


func _process(delta):
	
	position += direction*speed*delta



func _on_despawn_timeout():
	queue_free()


#when hitting a obj will remove bullet and if body that it hit needs change calls func
func _on_body_entered(body):
	queue_free()
	if("hit" in body):
		body.hit(damage)
