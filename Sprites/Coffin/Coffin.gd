extends StaticBody2D

var isBeyondUnionRange = false
var unionRange = 300
var unionCount = Globals.playerUnion.size()

func _ready():
	pass
	
func _process(delta):
	unionCount = Globals.playerUnion.size()
	
	
	if $UnionRange/ShapeRange.shape.radius != unionRange:
		$UnionRange/ShapeRange.shape.radius = unionRange
		
	if isBeyondUnionRange:
		if owner.get_node_or_null("/root/World/Player") != null:
			owner.get_node_or_null("/root/World/Player").playerHealth -= 1
	

	match unionCount:
		1:
			unionRange = 900
			$UnionRange/Circle.scale = Vector2(54, 54)
		2:
			unionRange = 800
			$UnionRange/Circle.scale = Vector2(48, 48)
		3: 
			unionRange = 700
			$UnionRange/Circle.scale = Vector2(42, 42)
		4:
			unionRange = 600
			$UnionRange/Circle.scale = Vector2(36, 36)
		5:
			unionRange = 500
			$UnionRange/Circle.scale = Vector2(30, 30)
		6:
			unionRange = 400
			$UnionRange/Circle.scale = Vector2(24, 24)
		7:
			unionRange = 300
			$UnionRange/Circle.scale = Vector2(18, 18)
					
func _on_UnionRange_body_exited(body):
	if body.name == "Player":
		isBeyondUnionRange = true


func _on_UnionRange_body_entered(body):
	if body.name == "Player":
		isBeyondUnionRange = false
