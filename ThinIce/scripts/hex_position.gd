extends Node3D

@export var current_tile : Node
@export var destroy_time : float
@export var respawn_minimum : float
@export var respawn_variation : int
var timer : Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	add_child(timer)
	current_tile.platform_fell.connect(on_platform_fell)
	pass # Replace with function body.
	
func on_platform_fell():
	timer.start(destroy_time)
	await timer.timeout
	timer.stop()
	current_tile.hide()
	timer.start(respawn_minimum + float(randi() % respawn_variation))
	await timer.timeout
	timer.stop()
	current_tile.position = Vector3.ZERO
	current_tile.rotation = Vector3.ZERO
	current_tile.reinitialize()
	current_tile.show()
		
	
