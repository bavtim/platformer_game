extends Node2D

var player = preload ("res://KinematicBody2D.tscn")
func _process(delta):
	if Input.is_action_just_pressed("spawn"):
		destroy()
		spawn()
func destroy():
	for i in range(self.get_child_count()):
		if(self.get_child(i).name=="KinematicBody2D"):
			self.get_child(i).queue_free()
			
func spawn():
	var play_spawn = player.instance()
	play_spawn.position=Vector2(100,500);
	self.add_child(play_spawn)
