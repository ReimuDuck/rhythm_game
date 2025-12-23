extends Node

var score = 0
var combo = 0
var rating = " "


func add_combo():
	combo += .5
func remove_combo():
	combo = 0
	
func add_score(scores:int):
	score += scores 

func change_rating(rate: String):
	rating = rate
