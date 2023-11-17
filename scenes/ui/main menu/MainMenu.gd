extends Control

@export var mainGameScene : PackedScene


func _on_play_pressed():
	get_tree().change_scene(mainGameScene.resource_path)


func _on_exit_pressed():
	get_tree().quit()
