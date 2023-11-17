extends CanvasLayer




func _on_start_pressed():
	TransisionLayer.change_scean("res://scenes/ui/opening comic/comics.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play()
