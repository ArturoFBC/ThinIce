extends AudioStreamPlayer3D

func _ready():
	GlobalSignals.jump.connect(play)

		
