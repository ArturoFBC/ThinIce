extends Label

func _ready():
	ScoreManager.score_updated.connect(on_score_updated)
	
func on_score_updated(added_score : int, total_score : int):
	text = str(total_score)
