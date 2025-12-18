extends Node2D

@export var input_action : String # assign per lane
@export var input_hit : String
var overlapping_notes = false

signal note_hit
signal note_miss

func _on_perfect_2_tree_entered() -> void:
	print("work")
	overlapping_notes = true

func _on_perfect_2_tree_exited() -> void:
	overlapping_notes = false
func _on_area_entered(area):
	if area.is_in_group("notes"):
		area.can_be_hit = true
func _on_area_exited(area):
	if area.is_in_group("notes"):
		area.can_be_hit = false
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
