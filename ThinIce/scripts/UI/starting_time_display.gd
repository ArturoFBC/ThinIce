extends Label

@export var game_manager : GameManager
@export var my_panel : Panel
# Called when the node enters the scene tree for the first time.
func _ready():
	game_manager.starting_countdown.connect(starting_countdown)
	game_manager.gamestate_updated.connect(gamestate_updated)
		
func starting_countdown(count : float):
	text = str(count)
	
func gamestate_updated(game_state : GameManager.GameState):
	if (game_state != GameManager.GameState.starting):
		my_panel.hide()
	
