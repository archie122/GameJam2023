extends Node2D

var bullet_scene: PackedScene = preload("res://scenes/projectiles/bullet/bullet.tscn")
var spawn_zombie: PackedScene = preload("res://scenes/enemies/zombie/enemie.tscn")
var spawn_bug: PackedScene = preload("res://scenes/enemies/bug/bug.tscn")

var spawn_wood: PackedScene = preload("res://scenes/items/wood/wood.tscn")
var spawn_stone: PackedScene = preload("res://scenes/items/stone/stone.tscn")
var spawn_steel: PackedScene = preload("res://scenes/items/steel/steel.tscn")
var spawn_leather: PackedScene = preload("res://scenes/items/wood/wood.tscn")
var spawn_raw_meat: PackedScene = preload("res://scenes/items/food/raw_meat/raw_meat.tscn")
func _ready():
	Globals.spawn_wood.connect(_on_spawn_wood)
	Globals.spawn_stone.connect(_on_spawn_stone)
	Globals.spawn_steel.connect(_on_spawn_steel)
	Globals.spawn_leather_and_raw_meat.connect(_on_spawn_leather_and_raw_meat)
	

func _on_player_shot(pos, direction):
	var bullet = bullet_scene.instantiate() as Area2D
	
	
	bullet.position = pos
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + 90
	bullet.direction = direction
	
	$projectiles.add_child(bullet)


func _on_player_zombie(pos, _direction):
	var zombie = spawn_zombie.instantiate() as CharacterBody2D
	zombie.position = pos
	
	$enemies.add_child(zombie)


func _on_player_bug(pos, _direction):
	$CPUParticles2D.position = pos
	$CPUParticles2D.emitting = true
	var bug = spawn_bug.instantiate() as CharacterBody2D
	bug.position = pos
	
	
	await get_tree().create_timer(2).timeout
	
	$enemies.add_child(bug)

func _on_spawn_wood(pos):
	spawn(pos,spawn_wood.instantiate() as Area2D)
func _on_spawn_stone(pos):
	spawn(pos,spawn_stone.instantiate() as Area2D)
func _on_spawn_steel(pos):
	spawn(pos,spawn_steel.instantiate() as Area2D)
func _on_spawn_leather_and_raw_meat(pos):
	spawn(pos,spawn_leather.instantiate() as Area2D)
	spawn(pos+Vector2(100,0),spawn_raw_meat.instantiate() as Area2D)

func spawn(pos,item):
	item.position = pos
	$items.add_child(item)
