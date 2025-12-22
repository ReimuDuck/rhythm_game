extends Node2D

@export var input_action : String # assign per lane
@export var input_hit : String
var overlapping_notes = false

signal note_hit
signal note_miss

func init_attributes(lane: int = 0):
#	Desc: sets the key that controls it and sets color of hit lane
#	Lanes: bluhit-68, yellohit-70, redhit-71
	if lane == 0:
		input_hit = "bluhit"
		global_position = Vector2((lane * 1500), 0)
		input_action = "hitL"
	elif lane == 1:
		input_hit = "yellohit"
		global_position = Vector2((lane * 1500), 0)
		input_action = "hitC"
	elif lane == 2:
		input_hit = "redhit"
		global_position = Vector2((lane * 1500), 0)
		input_action = "hitR"
	else:
		input_hit = "yellohit"
		global_position = Vector2((lane * 1500), 0)
		input_action = "hitD"
	$AnimatedSprite2D.play("default")
			
func _process(_delta):
	if Input.is_action_just_pressed(input_action):
		try_hit()
		$AnimatedSprite2D.play(input_hit)
	elif Input.is_action_just_released(input_action):
		$AnimatedSprite2D.play("default")
		
func try_hit():
	if overlapping_notes == false:
		print("miss")
	elif overlapping_notes == true:
		print("hity")
