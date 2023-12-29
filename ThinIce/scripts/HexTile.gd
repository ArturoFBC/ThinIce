extends RigidBody3D

#var timer : Timer
#var fall_delay : float = 1

func _ready() -> void:
	#timer = Timer.new()
	#add_child(timer)
	freeze = true

func start_fall_timer() -> void:
	#if timer.is_stopped():
	#	timer.start(fall_delay)
	#	await timer.timeout
	freeze = false
