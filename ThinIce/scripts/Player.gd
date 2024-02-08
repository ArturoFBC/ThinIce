extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@export var land_time : float
var land_counter : float

@export var animation_tree : AnimationTree

@export var graphic : Node3D

func _ready() -> void:
	land_counter = land_time

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if is_on_floor():
		if land_counter == land_time:
			animation_tree["parameters/conditions/landing"] = true
		
		if land_counter <= 0 :
			velocity.y = JUMP_VELOCITY
			GlobalSignals.jump.emit()
			animation_tree["parameters/conditions/landing"] = false
			land_counter = land_time
			move_and_slide()
		else:
			land_counter -= delta

	else:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			graphic.look_at(position - direction, Vector3.UP)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

		move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_normal().is_equal_approx(Vector3.UP): # only if the character is totally on top of the platform
			var collider = collision.get_collider()
			if collider.has_method('start_fall_timer'):
				collider.start_fall_timer()
