extends Node

var score : int = 0
signal score_updated(added_score : int, total_score : int)

func _ready():
	GlobalSignals.jump.connect(on_jump)
		
func _exit_tree():
	GlobalSignals.jump.disconnect(on_jump)

func add_score(added_score : int) -> int:
	score += added_score
	score_updated.emit(added_score, score)
	print(score)
	return score

func on_jump():
	add_score(1)
