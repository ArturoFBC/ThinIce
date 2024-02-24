extends Node3D

class_name GameManager

enum GameState
{
	starting,
	in_game,
	end_game
}
var game_state : GameState = GameState.starting
@export var starting_time = 3

signal starting_countdown(float)
signal gamestate_updated(GameState)

func _ready():
	get_tree().paused = true
	
	var timer = Timer.new()
	add_child(timer)
	timer.process_mode = Node.PROCESS_MODE_ALWAYS
	for current_time in range(starting_time, 0, -1): 
		starting_countdown.emit(current_time)
		timer.start(1)
		await timer.timeout
		timer.stop()
	
	get_tree().paused = false
	game_state = GameState.in_game
	gamestate_updated.emit(game_state)


func signal_lost():
	game_state = GameState.end_game
	gamestate_updated.emit(game_state)
