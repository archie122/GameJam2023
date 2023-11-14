extends Area2D
var speed: int = 500
var direction:Vector2 = Vector2.UP

func _ready():
	$despawn.start()
	


func _process(delta):
	
	position += direction*speed*delta



func _on_despawn_timeout():
	queue_free()
