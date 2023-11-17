extends "res://scenes/enemies/parent/parent_to_player.gd"

func _ready():
	health = 100
	damage = 50
	speed = 300




func _on_timer_timeout():
	var sound_options = $Node.get_children()
	var selected_sound: AudioStreamPlayer2D = sound_options[randi() % sound_options.size()]
	
	selected_sound.play()


func _on_despawn_timeout():
	queue_free()
