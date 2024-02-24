extends Button

@export var new_scene : String

func _on_pressed():
	get_tree().change_scene_to_file(new_scene)
