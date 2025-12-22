extends Node2D

@onready var hitlane_to_spawn: PackedScene = preload("res://scenes/hitlane.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_lane(0)
	spawn_lane(1)
	spawn_lane(2)
	spawn_lane(3)
	spawn_note(0)
	spawn_note(1)
	spawn_note(2)
	spawn_note(3)
	SignalBus.next_note.connect(_on_next_note)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event):
	if event is InputEventKey and event.pressed:
		print(event.keycode)

func spawn_lane(lane: int):
#	Desc: spawn hit lane in specified lane
	var new_hitlane = hitlane_to_spawn.instantiate()
	new_hitlane.init_attributes(lane)
	add_child(new_hitlane)
	
			
func spawn_note(lane):
#	Desc: spawn note in specified lane
	var note_scene = preload("res://scenes/note.tscn")
	var note = note_scene.instantiate()
	note.init_attributes(lane)		
	add_child(note)
	
func _on_next_note():
#	Desc: debug function to test if multiple notes can spawn
	var random_lane = randi_range(0, 3)
	spawn_note(random_lane)
