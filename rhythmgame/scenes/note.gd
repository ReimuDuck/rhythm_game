extends Area2D

var can_be_hit = false
var hit = false
var lane_index = 0

@export var speed: float = 1200.0 # pixels per second

var overlapping_notes := []

func _process(delta: float) -> void:
	position.y += speed * delta
