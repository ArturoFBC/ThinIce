extends RigidBody3D

signal platform_fell

var timer : Timer
@export var fall_delay : float = 0.2

func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	reinitialize()

func reinitialize() -> void:
	freeze = true

func start_fall_timer() -> void:
	if timer.is_stopped():
		timer.start(fall_delay)
		await timer.timeout
		timer.stop()
		freeze = false
		platform_fell.emit()
