class_name Player;
extends CharacterBody3D;

@onready var model : Node3D = get_node("Model");
@onready var animation_player : AnimationPlayer = get_node("Model/AnimationPlayer");
@onready var spring_arm : SpringArm3D = get_node("SpringArm3D");
@onready var state_manager : StateManager = get_node("StateManager");
@onready var above_raycast : RayCast3D;
@onready var head_raycast : RayCast3D;
@onready var floor_raycast : RayCast3D = get_node("FloorRayCast");

@export var friction : float = 2.0
@export var jump_peak_time : float = 0.25 * 60;
@export var jump_height : int = (0.98 * 60) * 3.25;
@export var terminal_velocity : float = 54;

##var velocity : Vector3 = Vector3.ZERO # The current velocity of the player.
var y_velocity : float = 0.0; # Separate Y velocity makes calculations easier.
var move_direction : Vector3 = Vector3.ZERO; # Checks the direction of the inputs (0.0, 1.0).
var look_direction : Vector2 = Vector2.ZERO; # The direction the player should rotate their body towards.
var gravity : float; # Assigned in _ready().
var jump_strength : float; # Assigned in _ready().

func _ready():
	
	print("this is a test")
	gravity = (2 * jump_height) / pow(jump_peak_time, 2);
	jump_strength = sqrt(2 * gravity * jump_height);
	
	state_manager.init(self);

func _input(event):
	
	state_manager.input(event);

func _physics_process(delta):
	
	# Rotate the model if the player's velocity isn't zero.
	if abs(velocity.x) >= 1 or abs(velocity.z) >= 1:
		
		look_direction = Vector2(velocity.z, velocity.x);
		model.rotation.y = lerp_angle(model.rotation.y, look_direction.angle(), 0.15);
	
	state_manager.physics_process(delta);
