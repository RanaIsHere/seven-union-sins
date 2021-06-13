extends KinematicBody2D

var playerHealth = 200
var playerUnion = ["Wrath", "Pride", "Envy", "Sloth", "Greed", "Gluttony", "Lust"]
var baseDamage = 40
var gold = 1000

var abletoFire = true
var slothBomb = 3
var abletoWrath = true

var wrathDamage = 100
var prideDamage = 2
var envyDamage = 10
var slothDamage = 5
var greedDamage = 50
var gluttonyDamage = 500

var isGluttony = false
var isLust = 0

var playerSpeed = 200
var velocity = Vector2.ZERO
var unionCount = Globals.playerUnion.size()

export (PackedScene) var wrathBullet = preload("res://Sprites/Bullet/wrathBullet.tscn")
export (PackedScene) var envyBullet = preload("res://Sprites/Bullet/envyBullet.tscn")
export (PackedScene) var slothBullet = preload("res://Sprites/Player/playerExplosion.tscn")
export (PackedScene) var greedBullet = preload("res://Sprites/Bullet/goldBullet.tscn")
export (PackedScene) var normalBullet = preload("res://Sprites/Bullet/normalBullet.tscn")


func _ready():
	gold = 1000
	playerHealth = 200
	isGluttony = false
	isLust = 0
	abletoFire = true
	slothBomb = 3
	
func shoot(delta):
	print(abletoWrath)
	if Input.is_action_just_pressed("wrath"):
		if Globals.playerUnion.has("Wrath"):
			if abletoWrath != false:
				var wrathBt = wrathBullet.instance()
				owner.add_child(wrathBt)
				wrathBt.transform = $shootPos.global_transform
				$AudioStreamPlayer2D.playing = true
				abletoWrath = false
				
		
	if Input.is_action_just_pressed("envy"):
		if Globals.playerUnion.has("Envy"):
			var envyBt = envyBullet.instance()
			owner.add_child(envyBt)
			envyBt.transform = $shootPos.global_transform
		
	if Input.is_action_just_pressed("sloth"):
		if Globals.playerUnion.has("Sloth"):
			if slothBomb > 0:
				var slothBt = slothBullet.instance()
				add_child(slothBt)
				slothBomb -= 1
				print(slothBomb)
				#slothBt.transform = global_transform
		
	if Input.is_action_pressed("greed"):
		if Globals.playerUnion.has("Greed"):
			if abletoFire == true:
				if gold >= 0:
					var greedBt = greedBullet.instance()
					owner.add_child(greedBt)
					greedBt.transform = $shootPos.global_transform
					abletoFire = false
					gold -= greedDamage
					$fireRate.start()
					print(gold)
				
	if Input.is_action_just_pressed("gluttony"):
		if Globals.playerUnion.has("Gluttony"):
			if isGluttony == false:
				isGluttony = true
				$gluttonyArea/CollisionShape2D.disabled = false
				$gluttonyArea/Particles2D.emitting = true
				$gluttonyArea/gluttonyTimer.start()
				print("EAT")
	
	if Input.is_action_just_pressed("wrath"):
		if Globals.playerUnion.has("Wrath"):
			var wrathBt = wrathBullet.instance()
			owner.add_child(wrathBt)
			wrathBt.transform = $shootPos.global_transform
			
	if Input.is_action_just_pressed("shoot"):
		if !Globals.playerUnion.has("Pride"):
			var normalBt = normalBullet.instance()
			owner.add_child(normalBt)
			normalBt.transform = $shootPos.global_transform

func sinsControl(delta):
	Globals.playerUnion = playerUnion
	
	if Input.is_action_just_pressed("one"):
		if !playerUnion.has("Wrath"):
			playerUnion.append("Wrath")
			print("wrath activated")
			print(playerUnion)
		else:
			playerUnion.erase("Wrath")
			print("wrath deactivated")
			print(playerUnion)
	
	if Input.is_action_just_pressed("two"):
		if !playerUnion.has("Pride"):
			playerUnion.append("Pride")
			print("pride activated")
			print(playerUnion)
		else:
			playerUnion.erase("Pride")
			print("pride deactivated")
			print(playerUnion)
			
	if Input.is_action_just_pressed("three"):
		if !playerUnion.has("Envy"):
			playerUnion.append("Envy")
			print("Envy activated")
			print(playerUnion)
		else:
			playerUnion.erase("Envy")
			print("Envy deactivated")
			print(playerUnion)
			
	if Input.is_action_just_pressed("four"):
		if !playerUnion.has("Sloth"):
			playerUnion.append("Sloth")
			print("Sloth activated")
			print(playerUnion)
		else:
			playerUnion.erase("Sloth")
			print("Sloth deactivated")
			print(playerUnion)
			
	if Input.is_action_just_pressed("five"):
		if !playerUnion.has("Greed"):
			playerUnion.append("Greed")
			print("Greed activated")
			print(playerUnion)
		else:
			playerUnion.erase("Greed")
			print("Greed deactivated")
			print(playerUnion)
			
	if Input.is_action_just_pressed("six"):
		if !playerUnion.has("Gluttony"):
			playerUnion.append("Gluttony")
			print("Gluttony activated")
			print(playerUnion)
		else:
			playerUnion.erase("Gluttony")
			print("Gluttony deactivated")
			print(playerUnion)
	
	if Input.is_action_just_pressed("seven"):
		if isLust != -1:
			if !playerUnion.has("Lust"):
				playerUnion.append("Lust")
				print("Lust activated")
				print(playerUnion)
				isLust = 0
			else:
				playerUnion.erase("Lust")
				print("Lust deactivated")
				print(playerUnion)
				isLust = 1
	
func inputMovement(delta):
	velocity = Vector2.ZERO;
	
	if Input.is_action_pressed("right"):
		velocity.x += playerSpeed
	if Input.is_action_pressed("left"):
		velocity.x -= playerSpeed
	if Input.is_action_pressed("down"):
		velocity.y += playerSpeed
	if Input.is_action_pressed("up"):
		velocity.y -= playerSpeed
		
	if velocity != Vector2.ZERO:
		$AnimatedSprite.animation = "walk"
	else:
		$AnimatedSprite.animation = "idle"
	
	velocity = velocity.normalized() * playerSpeed
	
	velocity = move_and_slide(velocity)

func _physics_process(delta):
	inputMovement(delta)
	sinsControl(delta)
	shoot(delta)
	
	if playerHealth <= 0:
		$AnimatedSprite.visible = false
		Globals.death = true
		get_tree().paused = true

	if Globals.playerUnion.has("Lust"):
		if isLust == 0:
			playerHealth = 200
			isLust = 2
	else:
		if isLust == 1:
			playerHealth = 50
			isLust = -1
	
	unionCount = Globals.playerUnion.size()
	$GUI/PlayerBar.value = playerHealth
	look_at(get_global_mouse_position())
	$shootPos.look_at(get_global_mouse_position())


func _on_fireRate_timeout():
	abletoFire = true


func _on_gluttonyArea_body_entered(body):
	if body.is_in_group("enemy"):
		if isGluttony == true:
			body.health -= gluttonyDamage


func _on_gluttonyTimer_timeout():
	if isGluttony:
		isGluttony = false
		$gluttonyArea/CollisionShape2D.disabled = true
		$gluttonyArea/Particles2D.emitting = false


func _on_AudioStreamPlayer2D_finished():
	abletoWrath = true
	$AudioStreamPlayer2D.playing = false
