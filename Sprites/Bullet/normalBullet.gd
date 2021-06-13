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
			projectileSpeed = 0
	if body.is_in_group("damageable"):
		if $explosion.emitting == false:
			$explosion.emitting = true
			projectileSpeed = 0
			body.health -= 10
	if body.is_in_group("enemy"):
		if $explosion.emitting == false:
			$explosion.emitting = true
			projectileSpeed = 0
			visible = false
			if !Globals.playerUnion.has("Pride"):
				body.health -= 40
			else:
				body.health -= 40 * Globals.prideDamage
			$CollisionRange/rangeShape.queue_free()
			$ExplosionTimer.start()
			print(body.health)
		


func _on_ExplosionTimer_timeout():
	queue_free()


func _on_TimerRunout_timeout():
	queue_free()
