extends BaseState;

func input(event : InputEvent) -> int:
	
	# If the player presses space, enter the JUMP state.
	if Input.is_action_pressed("jump"):
		
		return STATE.JUMP;
	
	# Reset the move direction.
	player.move_direction = Vector3.ZERO;
	# Take movement input.
	player.move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left");
	player.move_direction.y = Input.get_action_strength("back") - Input.get_action_strength("forward");
	
	player.move_direction = player.move_direction.rotated(Vector3.UP, player.spring_arm.rotation.y).normalized();
	
	return STATE.NULL;
