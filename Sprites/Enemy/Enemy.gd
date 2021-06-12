extends KinematicBody2D

var health = 200
var enemySpeed = 50
var enemyDamage = 10
var player = null
var isChained = false
var velocity = Vector2.ZERO
var targetedPlayer = null

func _ready():
	health = 200
	enemySpeed = 50
	enemyDamage = 10
	player = null
	isChained = false
	targetedPlayer = null

func _physics_process(delta):
	if player != null:
		if !isChained:
			look_at(player.position)
			velocity = position.direction_to(player.position)
			move_and_collide(velocity * enemySpeed * delta)
		
	if Globals.enemyUnion.has(self):
		isChained = true
		
	
	if isChained:
		$Particles2D.emitting = true
		
		if !Globals.playerUnion.has("Pride"):
			health -= Globals.envyDamage * 5 * delta
		else:
			health -= Globals.envyDamage * Globals.prideDamage * delta
		
		player.playerHealth += 5 * delta
	
	if targetedPlayer != null:
		targetedPlayer.playerHealth -= enemyDamage * delta
	
	if health <= 0:
		Globals.enemyUnion.erase(self)
		if player.gold != null:
			player.gold += Globals.greedDamage
		if Globals.score != null:
			Globals.score += 100
		queue_free()

func _on_Range_body_entered(body):
	if body.name == "Player":
		if player == null:
			player = body
			$Range/CollisionShape2D.queue_free()


func _on_Range_body_exited(body):
	if body.name == "Player":
		if player != null:
			#player = null
			pass


func _on_Collider_body_entered(body):
	if body.name == "Player":
		targetedPlayer = body


func _on_Collider_body_exited(body):
	if body.name == "Player":
		targetedPlayer = null
