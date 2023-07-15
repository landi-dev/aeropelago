extends BaseState;

@onready var jump_timer : Timer = get_node("Timer");

func enter() -> void:
	
	# This calls the base class enter function, which is necessary here
	# to make sure the animation switches
	super.enter();
	player.y_velocity = player.jump_strength;
	jump_timer.start();
