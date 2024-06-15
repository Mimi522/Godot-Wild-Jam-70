extends CharacterBody3D

@export var speed = 15
@export var rotation_speed = 3

func _physics_process(delta):
	var turn_strength = Input.get_axis("move_left", "move_right")
	var move_strength = Input.get_axis("move_foward", "move_back") 
	
	rotate_y(-deg_to_rad(turn_strength * rotation_speed))
	
	var direction = (transform.basis * Vector3(0, 0, move_strength)).normalized()
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	move_and_slide()
