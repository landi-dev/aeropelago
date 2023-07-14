extends BaseState;

func input(event : InputEvent) -> int:
	
	# If the player presses space, enter JUMP state.
	if Input.is_action_just_pressed("jump"):
		
		print("JUMP");
		#return STATE.JUMP;
	
	# Reset the move direction.
	player.move_direction = Vector3.ZERO;
	# Let's you have fine tuned controls, really good for controller support.
	# X is the left-right axis, Z is the forward-back axis.
	player.move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left");
	player.move_direction.z = Input.get_action_strength("back") - Input.get_action_strength("forward");
	# Update the movement relative to the camera.
	player.move_direction = player.move_direction.rotated(Vector3.UP, player.spring_arm.rotation.y).normalized();
	
	return STATE.NULL

func physics_process(delta : float) -> int:
	
	# Add a small amount of gravity to clamp the player down to the floor.
	#if player.is_on_floor():
	#	
	#	player.y_velocity = -0.01;
	
	# If the player is on the ground or close to the ground, adjust y_velocity
	# by gravity, limited to terminal velocity.
	if player.floor_raycast.is_colliding():
		
		player.y_velocity = clamp(player.y_velocity - player.gravity, -player.terminal_velocity, player.terminal_velocity);
	
	# Otherwise, enter the FALL state.
	else:
		
		print("FALL");
		return STATE.NULL;
		#return STATE.FALL;
	
	# Adjust the player by the move direction, multiplied by speed.
	#player.velocity = player.velocity.linear_interpolate(player.move_direction * sprint_speed, acceleration * delta)
	
	# If the character is not currently moving in a given direction, slow them down by friction.
	if player.move_direction.x == 0:
		
		player.velocity.x = lerp(player.velocity.x, 0.0, player.friction * delta);
	
	if player.move_direction.z == 0:
		
		player.velocity.z = lerp(player.velocity.z, 0.0, player.friction * delta);
	
	# If the player is moving, enter the SPRINT state.
	if abs(player.velocity.x) >= 1 or abs(player.velocity.z) >= 1:
		print("SPRINT");
		return STATE.NULL;
		#return STATE.SPRINT;
	
	# Finally, adjust the y-velocity after x and z calculations have been made.
	player.velocity.y = player.y_velocity;
	player.move_and_slide()
	
	print("IDLE");
	return STATE.NULL;
