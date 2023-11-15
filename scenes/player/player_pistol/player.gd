extends CharacterBody2D

var health: int = 200

var speed: int = 400
var can_shoot: bool = true
var took_damage: bool = false

signal shot(pos, direction)
signal bug(pos, direction)
signal zombie(pos, direction)

var rng = RandomNumberGenerator.new()

func _ready():
	$enemy.start()
func _process(_delta):
	if(health<= 0):
		queue_free()
	
	Globals.player_position = position
	#moves player
	var direction: Vector2 = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = speed * direction 
	move_and_slide()
	look_at(get_global_mouse_position())
	
	#to shoot a laser
	var playerDirection = (get_global_mouse_position() - position).normalized()
	if(Input.is_action_just_pressed("shoot") && can_shoot):
		can_shoot = false
		$"shot cooldown".start()
		var bullet_markers = $"shot spawns".get_children()
		var selected_bullet = bullet_markers[randi() % bullet_markers.size()]
		print("test", selected_bullet.global_position)
		shot.emit(selected_bullet.global_position,playerDirection)
	
	



func _on_shot_cooldown_timeout():
	can_shoot = true

func hit(damage):
	
	if(!took_damage):
		$Iframe.start()
		took_damage = true
		health -= damage



func _on_iframe_timeout():
	took_damage = false


func _on_enemy_timeout():
	if(((int)(rng.randf_range(0,100)) % 2) == 0):
		print("zombie")
	else:
		print("bug")
