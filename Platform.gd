extends KinematicBody2D
export var length=180
export var speed=10
var startpos=Vector2()
var velocity=Vector2(speed,0)

#$KinematicBody2D.position=Vector2(100,500)

func _process(delta):
	print(self.position)
	velocity=move_and_slide(velocity,Vector2(0,-1))

