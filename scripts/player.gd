extends CharacterBody3D

@export var speed = 8
@export var turn_speed = 8

func _physics_process(delta):
	var input_dir = Input.get_vector("move_left", "move_right", "move_foward", "move_back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	if direction != Vector3.ZERO:
		$Pivot.rotation.y = lerp_angle($Pivot.rotation.y, atan2(-velocity.x, -velocity.z), delta * turn_speed)
	
	move_and_slide()
