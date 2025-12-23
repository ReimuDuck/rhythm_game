extends Node2D
@onready var combo_lab: Label = $MarginContainer/VBoxContainer/Label
@onready var score_lab: Label = $MarginContainer/VBoxContainer/Label2
@onready var rating: Label = $MarginContainer/VBoxContainer/Label3
@onready var time: Label = $MarginContainer/VBoxContainer/Label4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	combo_lab.text = "Combo: " + str(Global.combo)
	score_lab.text = "Score: " + str(Global.score)
	rating.text = Global.rating
	time.text = str(Gamemanager.song_time)
