extends Area2D

var can_be_hit = false
var lane_index = 0
var note_lane

@export var speed: float = 1200.0 # pixels per second

var overlapping_notes := []

func init_attributes(lane: int = 0):
#	Desc: sets the key that controls it and sets color of hit lane
#	Lanes: bluhit-68, yellohit-70, redhit-71
	var color = ""
	note_lane = lane
	SignalBus.lane_signals[lane].connect(_on_lane_press)
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

func _on_lane_press():
	if $AnimatedSprite2D2.is_visible_in_tree():
		if (abs(position.y) <= 250):
			print("perfect")
			hit()
		elif (abs(position.y) <= 1000):
			print("good")
			hit()
		elif (abs(position.y) <= 2000):
			print("meh")
			hit()
		else:
			print("Not even close wtf")
			print(position.y)

func hit():
#	Desc: to run when the note is hit
	$AnimatedSprite2D2.hide()
	SignalBus.next_note.emit()

func _process(delta: float) -> void:
	position.y += speed * delta
