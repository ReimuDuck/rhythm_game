extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_note(0)
	spawn_note(1300)
	spawn_note(2700)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event):
	if event is InputEventKey and event.pressed:
		print(event.keycode)
func spawn_note(pos):
	var note_scene = preload("res://scenes/note.tscn")
	var note = note_scene.instantiate()
	note.position = Vector2(pos, -4550)
	var sprite = note.get_node("AnimatedSprite2D2")
	if pos == 0:
		sprite.play("blu")
	elif pos > 1000 and pos < 1500:
		sprite.play("red")
	else:
		sprite.play("yelw")
	add_child(note)
