extends CharacterBody2D

var health: int = 200
var max_health:int = 200
var speed: int = 400
var can_shoot: bool = true
var took_damage: bool = false
@export var can_spawn: bool = true


signal shot(pos, direction)
signal bug(pos, direction)
signal zombie(pos, direction)
var playerDirection: Vector2
var rng = RandomNumberGenerator.new()

func _ready():
	Globals.player_max_health = max_health
	$enemy.start()
func _process(_delta):
	if(health<= 0):
		queue_free()
#	print(((float)(Globals.player_health))/((float)(Globals.player_max_health)), " ", health)
	Globals.player_health = health
	Globals.player_position = position
	#moves player
	var direction: Vector2 = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = speed * direction 
	move_and_slide()
	look_at(get_global_mouse_position())
	
	#to shoot a laser
	playerDirection = (get_global_mouse_position() - position).normalized()
	if(Input.is_action_just_pressed("shoot") && can_shoot):
		can_shoot = false
		$"shot cooldown".start()
		var bullet_markers = $"shot spawns".get_children()
		var selected_bullet = bullet_markers[randi() % bullet_markers.size()]
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
	if(!can_spawn):
		return


	if(((int)(rng.randf_range(0,100)) % 2) == 0):
		var number_spawn: int = 2
		while number_spawn !=0:
			var zombie_spawn =  $"zombie spwans".get_children()
			var selected_zombie_spawn = zombie_spawn[randi() % zombie_spawn.size()]
			zombie.emit(selected_zombie_spawn.global_position,playerDirection)
			number_spawn -= 1
	else:
		
		var bug_spawn =  $"bug spawns".get_children()
		var selected_bug_spawn = bug_spawn[randi() % bug_spawn.size()]
		
		bug.emit(selected_bug_spawn.global_position,playerDirection)


func add_item(item,amount):
	print("add item ", item, " ", amount)
	Globals.item_in[item] += amount
	Globals.display_item_in()
	


