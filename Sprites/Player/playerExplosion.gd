extends Area2D

var player = null

func _ready():
	player = null
	$Particles2D.emitting = true
	
func _process(delta):
	if $Particles2D.emitting == false:
		queue_free()
	else:
		if player != null:
			player.playerHealth -= 5 * delta

func _on_playerExplosion_body_entered(body):
	if body.name == "Player":
		player = body
	
	if body.is_in_group("enemy"):
		if Globals.playerUnion.has("Pride"):
			body.health -= Globals.slothDamage * Globals.prideDamage
		else:
			body.health -= Globals.slothDamage


func _on_explosionGas_timeout():
	$Particles2D.emitting = false
