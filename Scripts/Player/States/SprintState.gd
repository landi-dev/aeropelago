extends BaseState;

func input(event : InputEvent) -> int:
	
	# If the player presses space, enter the JUMP state.
	if Input.is_action_pressed("jump"):
		
		return STATE.JUMP;
	
	# Reset the move direction.
	player.move_direction = Vector3.ZERO;
	# Take movement input.
	player.move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left");
	player.move_direction.z = Input.get_action_strength("back") - Input.get_action_strength("forward");
	
	player.move_direction = player.move_direction.rotated(Vector3.UP, player.spring_arm.rotation.y).normalized();
	
	return STATE.NULL;

func physics_process(delta : float) -> int:
	
	player.velocity = Vector3.ZERO;
	
	if player.floor_raycast.is_colliding() and not player.is_on_floor():
		
		player.y_velocity = clamp(player.y_velocity - player.gravity, -player.terminal_velocity, player.terminal_velocity);
	
	elif not player.is_on_floor():
		
		return STATE.FALL;
	
	else:
		
		player.y_velocity = 0.0;
	
	# Adjust the player by the move direction multiplied by speed, incremented by acceleration.
	player.velocity = player.velocity.lerp(player.move_direction * player.sprint_speed, player.acceleration * delta);
	
	# If the character is not currently moving in a given direction, slow them down by friction.
	if player.move_direction.x == 0.0:
		
		player.velocity.x = lerp(player.velocity.x, 0.0, player.friction * delta);
	
	if player.move_direction.z == 0.0:
		
		player.velocity.z = lerp(player.velocity.z, 0.0, player.friction * delta);
	
	# Finally, adjust the y-velocity after x and z calculations have been made.
	player.velocity.y = player.y_velocity;
	player.move_and_slide();
	
	# Rotate the model if the player is moving.
	if abs(player.velocity.x) == 0 and abs(player.velocity.z) == 0 and player.move_direction == Vector3.ZERO:
		
		return STATE.IDLE;
	
	return STATE.NULL;
