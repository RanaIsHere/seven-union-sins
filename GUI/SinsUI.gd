extends Control

var shown = false

func _ready():
	pass

func checkSins():
	if !Globals.playerUnion.has("Wrath"):
		$Cards/Wrath.self_modulate = Color(1, 1, 1, 0.5)
	else:
		$Cards/Wrath.self_modulate = Color(1, 1, 1, 1)
		
	if !Globals.playerUnion.has("Pride"):
		$Cards/Pride.self_modulate = Color(1, 1, 1, 0.5)
	else:
		$Cards/Pride.self_modulate = Color(1, 1, 1, 1)
		
	if !Globals.playerUnion.has("Envy"):
		$Cards/Envy.self_modulate = Color(1, 1, 1, 0.5)
	else:
		$Cards/Envy.self_modulate = Color(1, 1, 1, 1)
		
	if !Globals.playerUnion.has("Sloth"):
		$Cards/Sloth.self_modulate = Color(1, 1, 1, 0.5)
	else:
		$Cards/Sloth.self_modulate = Color(1, 1, 1, 1)

	if !Globals.playerUnion.has("Greed"):
		$Cards/Greed.self_modulate = Color(1, 1, 1, 0.5)
	else:
		$Cards/Greed.self_modulate = Color(1, 1, 1, 1)
		
	if !Globals.playerUnion.has("Gluttony"):
		$Cards/Gluttony.self_modulate = Color(1, 1, 1, 0.5)
	else:
		$Cards/Gluttony.self_modulate = Color(1, 1, 1, 1)
		
	if !Globals.playerUnion.has("Lust"):
		$Cards/Lust.self_modulate = Color(1, 1, 1, 0.5)
	else:
		$Cards/Lust.self_modulate = Color(1, 1, 1, 1)
		
func _process(delta):
	if Input.is_action_just_pressed("showCards"):
		if $AnimationPlayer.current_animation != "ShowCards" and shown == false:
			$AnimationPlayer.play("ShowCards")
			shown = true
		else:
			$AnimationPlayer.play_backwards("ShowCards")
			shown = false
	
	checkSins()
