extends BaseState;

@onready var jump_timer : Timer = get_node("Timer");

func enter() -> void:
	
	# This calls the base class enter function, which is necessary here
	# to make sure the animation switches
	super.enter();
	player.y_velocity = player.jump_strength;
	jump_timer.start();

func input(event) -> int:
	
	# Reset the move direction.
	player.move_direction = Vector3.ZERO;
	# Take movement input.
	player.move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	player.move_direction.z = Input.get_action_strength("back") - Input.get_action_strength("forward")
	# Update the movement relative to the camera.
	player.move_direction = player.move_direction.rotated(Vector3.UP, player.spring_arm.rotation.y).normalized()
	
	return STATE.NULL