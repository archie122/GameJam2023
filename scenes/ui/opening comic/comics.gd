extends Control

func _ready():
	$AudioStreamPlayer2D.play(10)
	$AnimationPlayer.play("cut scene")


func _on_animation_player_animation_finished(anim_name):
	
	TransisionLayer.change_scean("res://scenes/levels/homebase/crafting items/house_crafting.tscn")
	await get_tree().create_timer(.99).timeout
	$AudioStreamPlayer2D.stop()
