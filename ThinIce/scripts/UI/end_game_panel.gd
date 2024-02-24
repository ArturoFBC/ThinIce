extends Panel

@export var game_manager : GameManager
@export var label : Label
var score : int

# Called when the node enters the scene tree for the first time.
func _ready():
	game_manager.gamestate_updated.connect(gamestate_updated)
	ScoreManager.score_updated.connect(on_score_updated)
	hide()
	
func on_score_updated(_added_score : int, total_score : int):
	score = total_score

# Called every frame. 'delta' is the elapsed time since the previous frame.
func gamestate_updated(game_state : GameManager.GameState):
	if (game_state == GameManager.GameState.end_game):
		show()
		label.text = "You walked on thin ice " + str(score) + " times"
