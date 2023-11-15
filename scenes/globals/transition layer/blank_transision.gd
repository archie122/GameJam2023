extends CanvasLayer

func change_scean(tarrget:String) -> void:
	$".".layer = 2
	$AnimationPlayer.play("fade to black")
	
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("revert")
	get_tree().change_scene_to_file(tarrget)
	
