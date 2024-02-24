extends Area3D

@export var game_manager : GameManager


func _on_body_entered(body):
	if (body is CharacterBody3D):
		game_manager.signal_lost()
		print("game_over")
	
