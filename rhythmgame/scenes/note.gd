extends Area2D

var can_be_hit = false
var lane_index = 0
var note_lane
var overlapping:=false
@export var speed: float = 3700.0 # pixels per second


func _process(delta: float) -> void:
	position.y += speed * delta
	overlapping = has_overlapping_areas()
	if $AnimatedSprite2D2.is_visible_in_tree():
		if (position.y > 2000):
			Global.remove_combo()
			Global.change_rating("miss....")
			hit()	



func init_attributes(lane):
#	Desc: sets the key that controls it and sets color of hit lane
#	Lanes: bluhit-68, yellohit-70, redhit-71
	var color = ""
	note_lane = lane
	SignalBus.lane_signals[lane.lane].connect(_on_lane_press)
	if lane.lane == 0:
		color = "blu"
		global_position = Vector2((lane.lane * 1500), -4550)
	elif lane.lane == 1:
		color = "yelw"
		global_position = Vector2((lane.lane * 1500), -4550)
	elif lane.lane == 2:
		color = "red"
		global_position = Vector2((lane.lane * 1500), -4550)
	else:
		color = "red"
		global_position = Vector2((lane.lane * 1500), -4550)
	$AnimatedSprite2D2.play(color)

func _on_lane_press():
	if $AnimatedSprite2D2.is_visible_in_tree():
		if (abs(position.y) <= 100) and overlapping:
			
			Global.change_rating("PERFECT!")
			Global.add_combo()
			Global.add_score(500)
			hit()
		elif (abs(position.y) <= 760)and overlapping:
			Global.change_rating("Good")
			Global.add_combo()
			Global.add_score(250)
			hit()
		elif (abs(position.y) <= 900)and overlapping:
			Global.change_rating("meh....")
			Global.add_combo()
			Global.add_score(100)
			hit()
		elif (abs(position.y) <= 1500)and overlapping:
			Global.remove_combo()
			print("Not even close wtf")
		else:
			pass
			

func hit():
#	Desc: to run when the note is hit
	$AnimatedSprite2D2.hide()
	SignalBus.next_note.emit()
