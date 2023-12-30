extends Node

@export var hex_tile : PackedScene
@export var columns : int
@export var rows : int
@export var spacing : float

# Called when the node enters the scene tree for the first time.
func _ready():
	for column in columns :
		for row in rows :
			var new_hex_tile = hex_tile.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
			var tile_position = get_tile_position(row, column)
			tile_position *= spacing
			new_hex_tile.look_at_from_position(tile_position, tile_position - Vector3(0,0,-1), Vector3.UP)
			add_child(new_hex_tile)
			

func get_tile_position(row, column):
	var tile_position
	var x = row * 3 - (rows * 3 / 2)
	var z = column * sin( 2 * PI / 3 ) - (columns * sin( 2* PI / 3 ) / 2)
	tile_position = Vector3( x, 0, z )
	
	if (column % 2 > 0):
		tile_position += Vector3( 1.5, 0, 0 )

	return tile_position
