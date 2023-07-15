class_name StateManager;
extends Node;

# Using enums for state names that way every script has the same interface
# while being more robust and less error prone than using strings
@onready var states = {
	BaseState.STATE.IDLE : get_node("Idle"),
	BaseState.STATE.SPRINT : get_node("Sprint"),
	BaseState.STATE.JUMP : get_node("Jump"),
	BaseState.STATE.FALL : get_node("Fall"),
	BaseState.STATE.LAND : get_node("Land")
};

var current_state : BaseState;

# Initialize the state machine by giving each state a reference to the objects
# owned by the parent that they should be able to take control of
# and set a default state
func init(player : Player) -> void:
	
	for child in get_children():
		
		child.player = player;
		break;
	
	# Initialize with a default state of idle
	change_state(BaseState.STATE.IDLE);

# Pass through functions for the Player to call,
# handling state changes as needed
func physics_process(delta : float) -> void:
	
	var new_state = current_state.physics_process(delta);
	if new_state != BaseState.STATE.NULL:
		
		change_state(new_state);

func input(event : InputEvent) -> void:
	
	var new_state = current_state.input(event);
	if new_state != BaseState.STATE.NULL:
		
		change_state(new_state);

func change_state(new_state : int) -> void:
	
	if current_state:
		
		current_state.exit();
	
	current_state = states[new_state];
	current_state.enter();
	
	print(current_state)
