extends Control

var value = 0
var time = 0

func _ready():
	value = 0
	time = 0

func _process(delta):
	$HealthBar.value = value
	if get_tree().paused == false:
		time += delta
		Globals.score += round(10) * delta
		$Time.text = "Time: " + String(round(time))
		$Score.text = "Score: " + String(round(Globals.score))
		$DeathMenu/AudioStreamPlayer2D.playing = false
	
	if Globals.death == true:
		$DeathMenu.visible = true
		if $DeathMenu/AudioStreamPlayer2D.playing == false:
			$DeathMenu/AudioStreamPlayer2D.play()

func _on_retry_pressed():
	Globals.death = false
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/World.tscn")


func _on_exit_pressed():
	get_tree().quit()
