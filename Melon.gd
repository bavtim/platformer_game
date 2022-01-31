extends Area2D
signal tooken

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"AnimationPlayer".play("anima")
	
func _process(delta):
	$"AnimationPlayer".play("anima")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Melon_body_entered(body):
	print(body.get_name())
	if(body.get_name() == "KinematicBody2D"):
		hide()  
		emit_signal("tooken")
		$CollisionShape2D.set_deferred("disabled", true)
		$AnimationPlayer.stop()
