extends Panel

var noise : FastNoiseLite
@export var scroll_speed : Vector3
var current_offset : Vector3
@export var jitter_speed : float
var current_jitter : float

func _ready():
	var style_box_texture := get_theme_stylebox("panel") as StyleBoxTexture
	if (style_box_texture):
		var noise_texture := style_box_texture.texture as NoiseTexture2D
		if (noise_texture):
			noise = noise_texture.noise
	
	if (noise):
		current_jitter = noise.cellular_jitter
		current_offset = noise.offset

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_jitter += jitter_speed * delta
	noise.cellular_jitter = current_jitter
	current_offset += scroll_speed * delta
	noise.offset = current_offset
