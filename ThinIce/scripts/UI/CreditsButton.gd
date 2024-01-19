extends Button

@export var deactivateNode : Node
@export var activateNode : Node

func _pressed():
	deactivateNode.hide()
	activateNode.show()
	pass
