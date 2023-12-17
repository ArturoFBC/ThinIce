extends Node

@export var hexTile : PackedScene
@export var columns : int
@export var rows : int
@export var spacing : float

# Called when the node enters the scene tree for the first time.
func _ready():
	for column in columns :
		for row in rows :
			var newHexTile = hexTile.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
			var tilePosition = getTilePosition(row, column)
			tilePosition *= spacing
			newHexTile.look_at_from_position(tilePosition, tilePosition - Vector3(0,0,-1), Vector3.UP)
			add_child(newHexTile)
	pass

func getTilePosition(row, column):
	var tilePosition
	var x = row * 3 - (rows * 3 / 2)
	var z = column * sin( 2 * PI / 3 ) - (columns * sin( 2* PI / 3 ) / 2)
	tilePosition = Vector3( x, 0, z )
	
	if (column % 2 > 0):
		tilePosition += Vector3( 1.5, 0, 0 )

	return tilePosition
