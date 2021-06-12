extends KinematicBody2D

var projectileSpeed = 300

func _ready():
	pass
	
func _physics_process(delta):
	position += transform.x * projectileSpeed * delta

func _on_CollisionRange_body_entered(body):
	if body.is_in_group("invincible"):
		if $explosion.emitting == false:
			$explosion.emitting = true
			$AnimatedSprite.self_modulate = Color(0, 0, 0, 0)
			projectileSpeed = 0
			$explosiontimer.start()
	if body.is_in_group("damageable"):
		if $explosion.emitting == false:
			$explosion.emitting = true
			$AnimatedSprite.self_modulate = Color(0, 0, 0, 0)
			projectileSpeed = 0
			body.health -= 10
			$explosiontimer.start()
	if body.is_in_group("enemy"):
		if $explosion.emitting == false:
			$explosion.emitting = true
			$AnimatedSprite.self_modulate = Color(0, 0, 0, 0)
			projectileSpeed = 0
			body.health -= 5
			if !Globals.enemyUnion.has(body):
				Globals.enemyUnion.append(body)
			$CollisionRange/CollisionShape2D.queue_free()
			$explosiontimer.start()
			print(Globals.enemyUnion)
			print(body.health)

func _on_runout_timeout():
	queue_free()


func _on_explosiontimer_timeout():
	queue_free()
