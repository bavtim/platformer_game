extends Node2D

var player = preload ("res://KinematicBody2D.tscn")
func _process(delta):
	if Input.is_action_just_pressed("spawn"):
		$KinematicBody2D.position=Vector2(100,553)
		

func _on_Enemy_test_kill():
	$KinematicBody2D.position=Vector2(100,500)

func _on_KinematicBody2D_kill():
	$KinematicBody2D.position=Vector2(100,500)
