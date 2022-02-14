extends KinematicBody2D
export var speed=150
var distance = 100;
signal kill
var start_point = Vector2()
func _ready():
	start_point=self.position
	print(start_point)
func _process(delta):
	var Move = Vector2()
	var body = get_node("View_attack").get_overlapping_bodies()
	if (body.size()!=0):
		for subbody in body:
			if (subbody in get_tree().get_nodes_in_group("Enemy_detecting")):
				
				if(subbody.position.x< self.position.x):
					Move+=Vector2(-1,0)
				if(subbody.position.x> self.position.x):
					Move+=Vector2(1,0)
				if(subbody.position.y< self.position.y):
					Move+=Vector2(0,-1)
				if(subbody.position.y> self.position.y):
					Move+=Vector2(0,1)
				
	var killer = get_node("Killer").get_overlapping_bodies()
	if (killer.size()!=0):
		for subbody in killer:
			if (subbody in get_tree().get_nodes_in_group("Enemy_detecting")):
				$AudioStreamPlayer2D.play()
				emit_signal("kill")

	Move=Move.normalized()*speed*delta
	Move=move_and_slide(Move,Vector2(0,-1))
