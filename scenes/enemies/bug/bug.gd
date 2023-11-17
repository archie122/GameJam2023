extends "res://scenes/enemies/parent/parent_to_player.gd"

func _ready():
	health = 100
	speed = 500
	damage = 25
	$AnimationPlayer.play("move")




func _on_despawn_timeout():
	queue_free()
