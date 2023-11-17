extends CharacterBody2D

var health: int = 200
var max_health:int = 200
var speed: int = 400
var can_shoot: bool = true

var took_damage: bool = false
@export var can_spawn: bool = true

var shoot_l: bool = false

signal shot(pos, direction)
signal bug(pos, direction)
signal zombie(pos, direction)
signal death()
var playerDirection: Vector2
var rng = RandomNumberGenerator.new()

var anim_string: String = ""

func _ready():
	health = max_health
	$enemy.start()
func _process(_delta):
	Globals.player_max_health = max_health
	
	if(health<= 0):
		death.emit()
		queue_free()
	
	Globals.player_health = health
	Globals.player_position = position
	
	#moves player
	var direction: Vector2 = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = speed * direction 
	move_and_slide()
	look_at(get_global_mouse_position())
	
	if(direction == Vector2(0,0)):
		$footsteps.stop()
	elif (!$footsteps.playing):
		$footsteps.play()
	
	#to shoot a bullet
	playerDirection = (get_global_mouse_position() - position).normalized()
	if(Input.is_action_just_pressed("shoot") && can_shoot and Globals.forest):
		
		can_shoot = false
		var bullet_markers
		$"shot cooldown".start()
		$shoot.play(9.33)
		if(shoot_l):
			bullet_markers = $"shot spawnsL".get_children()
			$AnimationPlayer.play("shoot_left"+anim_string)
			
		else:
			bullet_markers = $"shot spawnsR".get_children()
			$AnimationPlayer.play("shoot_right"+anim_string)
			
		shoot_l = !shoot_l
		var selected_bullet = bullet_markers[randi() % bullet_markers.size()]
		shot.emit(selected_bullet.global_position,playerDirection)
	
	#updates what armour you waring
	if(Globals.armour == 1):
		$Sprite2D.frame = 3
		anim_string = "_2"
		max_health = 300
	elif(Globals.armour == 2):
		$Sprite2D.frame = 6
		anim_string = "_3"
		max_health = 400
	
	
	if(Input.is_action_just_pressed("heal") and Globals.item_in[5] > 0):
		health += 25
		Globals.item_in[5] -= 1
		if(health > max_health):
			health = max_health




func _on_shot_cooldown_timeout():
	can_shoot = true

func hit(damage):
	
	if(!took_damage):
#		
		$Iframe.start()
		
		$AnimationPlayer2.play("Iframe")
		took_damage = true
		health -= damage



func _on_iframe_timeout():
	took_damage = false


func _on_enemy_timeout():
	if(!can_spawn):
		return


	if(((int)(rng.randf_range(0,100)) % 4) <= 2):
		var number_spawn: int = 2
		var selected_zombie_spawn 
		while number_spawn !=0:
			var zombie_spawn =  $"zombie spwans".get_children()
			
			selected_zombie_spawn = zombie_spawn[randi() % zombie_spawn.size()]
			
			zombie.emit(selected_zombie_spawn.global_position,playerDirection)
			await get_tree().create_timer(.2).timeout
			number_spawn -= 1
	else:
		
		var bug_spawn =  $"bug spawns".get_children()
		var selected_bug_spawn = bug_spawn[randi() % bug_spawn.size()]
		
		bug.emit(selected_bug_spawn.global_position,playerDirection)


func add_item(item,amount):
	print("add item ", item, " ", amount)
	Globals.item_in[item] += amount
	Globals.display_item_in()
	


