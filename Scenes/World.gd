extends Node2D

export (PackedScene) var enemy = preload("res://Sprites/Enemy/Enemy.tscn")
var enemySpawnCount = 0
var maxEnemy = 20

func _ready():
	enemySpawnCount = 0
	
func _process(delta):
	if Globals.playerUnion.has("Lust"):
		maxEnemy = 40
	else:
		maxEnemy = 20
	
	if get_tree().has_group("enemy"):
		if get_tree().get_nodes_in_group("enemy").size() < maxEnemy:
			enemySpawnCount += 1
	
			match enemySpawnCount:
				1:
					var enemySpt = enemy.instance()
					add_child(enemySpt)
					enemySpt.add_to_group("enemy")
					enemySpt.transform = $enemySpawn.global_transform
				2:
					var enemySpt = enemy.instance()
					add_child(enemySpt)
					enemySpt.add_to_group("enemy")
					enemySpt.transform = $enemySpawn2.global_transform
				3:
					var enemySpt = enemy.instance()
					add_child(enemySpt)
					enemySpt.add_to_group("enemy")
					enemySpt.transform = $enemySpawn3.global_transform
				4:
					var enemySpt = enemy.instance()
					add_child(enemySpt)
					enemySpt.add_to_group("enemy")
					enemySpt.transform = $enemySpawn4.global_transform
				5:
					var enemySpt = enemy.instance()
					add_child(enemySpt)
					enemySpt.add_to_group("enemy")
					enemySpt.transform = $enemySpawn5.global_transform
				6:
					var enemySpt = enemy.instance()
					add_child(enemySpt)
					enemySpt.add_to_group("enemy")
					enemySpt.transform = $enemySpawn6.global_transform
				7:
					var enemySpt = enemy.instance()
					add_child(enemySpt)
					enemySpt.add_to_group("enemy")
					enemySpt.transform = $enemySpawn7.global_transform
				8:
					var enemySpt = enemy.instance()
					add_child(enemySpt)
					enemySpt.add_to_group("enemy")
					enemySpt.transform = $enemySpawn8.global_transform
				9:
					var enemySpt = enemy.instance()
					add_child(enemySpt)
					enemySpt.add_to_group("enemy")
					enemySpt.transform = $enemySpawn9.global_transform
				10:
					var enemySpt = enemy.instance()
					add_child(enemySpt)
					enemySpt.add_to_group("enemy")
					enemySpt.transform = $enemySpawn10.global_transform
				11:
					enemySpawnCount = 0
	
