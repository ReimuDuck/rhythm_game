extends Area2D

var can_be_hit = false
var hit = false
var lane_index = 0

signal position_changed(position)

@export var speed: float = 1200.0 # pixels per second

var overlapping_notes := []

func init_attributes(lane: int = 0):
#	Desc: sets the key that controls it and sets color of hit lane
#	Lanes: bluhit-68, yellohit-70, redhit-71
	var color = ""
	if lane == 0:
		color = "blu"
		global_position = Vector2((lane * 1500), -4550)
	elif lane == 1:
		color = "yelw"
		global_position = Vector2((lane * 1500), -4550)
	elif lane == 2:
		color = "red"
		global_position = Vector2((lane * 1500), -4550)
	else:
		color = "red"
		global_position = Vector2((lane * 1500), -4550)
	$AnimatedSprite2D2.play(color)

func _process(delta: float) -> void:
	position.y += speed * delta
#	emit_signal("note_position", global_position)
	
