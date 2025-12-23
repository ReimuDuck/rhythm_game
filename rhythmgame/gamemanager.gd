extends Node

@onready var music =AudioStreamPlayer.new()
var song_time := 0.0
var song_playing := false
func _ready() -> void:
	add_child(music)
	music.stream = load("res://music/Super Mario Bros. Theme Song.mp3")
func _process(delta: float) -> void:
	#desc: keeps a counter of where in the song it is
	if song_playing:
		song_time += delta
func start_song():
	#desc: starts song and sets song playing to true and song time to 0
	#hard coded timer so song doesn't immediately begin
	await get_tree().create_timer(1.0).timeout
	song_time = 0.0
	song_playing = true
	music.play()	
