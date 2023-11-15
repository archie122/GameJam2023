extends Node2D

var bullet_scene: PackedScene = preload("res://scenes/projectiles/bullet/bullet.tscn")
var spawn_zombie: PackedScene = preload("res://scenes/enemies/zombie/enemie.tscn")
var spawn_bug: PackedScene = preload("res://scenes/enemies/bug/bug.tscn")


func _on_player_shot(pos, direction):
	var bullet = bullet_scene.instantiate() as Area2D
	
	
	bullet.position = pos
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + 90
	bullet.direction = direction
	
	$projectiles.add_child(bullet)


func _on_player_zombie(pos, direction):
	var zombie = spawn_zombie.instantiate() as CharacterBody2D
	zombie.position = pos
	
	$enemies.add_child(zombie)
