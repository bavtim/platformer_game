extends KinematicBody2D

var run_speed=300
var jump_speed=500
var gravity=600

enum {IDLE, RUN, JUMP}
var velocity = Vector2()
var state
var anim
var new_anim
signal score
signal kill
var count_melon=0
func _ready():
	$Run.hide()
	$Idle.show()
	$jump.hide()
	change_state(IDLE)

func change_state(new_state):
	state = new_state
	match state:
		IDLE:
			new_anim = 'idle'
		RUN:
			new_anim = 'run'
		JUMP:
			new_anim = 'jump'

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed("ui_up")

	if jump and is_on_floor():
		velocity.y -= jump_speed
		change_state(JUMP)
		$Run.hide()
		$Idle.hide()
		$jump.show()
	else:
		if (right or left) and is_on_floor():
			$Run.show()
			$Idle.hide()
			$jump.hide()
			if right:
				change_state(RUN)
				velocity.x += run_speed
				$Run.flip_h = velocity.x < 0
				$Idle.flip_h = velocity.x < 0
				$jump.flip_h = velocity.x < 0
			if left:
				change_state(RUN)
				velocity.x -= run_speed
				$Run.flip_h = velocity.x < 0
				$Idle.flip_h = velocity.x < 0
				$jump.flip_h = velocity.x < 0
		if (right or left) and !is_on_floor():
			$Run.hide()
			$Idle.hide()
			$jump.show()
			if right:
				velocity.x += run_speed
				$Run.flip_h = velocity.x < 0
				$Idle.flip_h = velocity.x < 0
				$jump.flip_h = velocity.x < 0
			if left:
				velocity.x -= run_speed
				$Run.flip_h = velocity.x < 0
				$Idle.flip_h = velocity.x < 0
				$jump.flip_h = velocity.x < 0
	if state != JUMP :
		if !right and !left :
			$Run.hide()
			$Idle.show()
			$jump.hide()
			change_state(IDLE)

func _process(delta):
	get_input()
	anim = new_anim
	$AnimationPlayer.play(anim)

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
	if state == JUMP:
		if is_on_floor():
			change_state(IDLE)
	var killer = get_node("Checker").get_overlapping_bodies()
	if (killer.size()!=0):
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		for subbody in killer:
			if (subbody in get_tree().get_nodes_in_group("Deadzone")):
				$AudioStreamPlayer2D.play()
				emit_signal("kill")

func up():
	count_melon+=1
	emit_signal("score",count_melon)
func _on_Melon_tooken():
	up()


func _on_Melon2_tooken():
	up()


func _on_Melon3_tooken():
	up()


func _on_KinematicBody2D_score():
	pass # Replace with function body.
