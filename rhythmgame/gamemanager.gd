extends Node

var combo := 0
var max_combo := 0




func _on_hitc_note_hit() -> void:
	combo += 1
	max_combo = max(max_combo, combo)
	print("HIT! Combo:", combo)

func _on_hitc_note_miss() -> void:
	combo = 0
	print("MISS")


func _on_hitr_note_hit() -> void:
	combo += 1
	max_combo = max(max_combo, combo)
	print("HIT! Combo:", combo)


func _on_hitr_note_miss() -> void:
	combo = 0
	print("MISS")


func _on_hitl_note_hit() -> void:
	combo += 1
	max_combo = max(max_combo, combo)
	print("HIT! Combo:", combo)


func _on_hitl_note_miss() -> void:
	combo = 0
	print("MISS")
