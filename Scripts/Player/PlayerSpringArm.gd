extends SpringArm3D;

@onready var player : Player = get_parent();
@onready var camera : Camera3D = get_node("Camera3D");

@export var mouse_sensitivity : float = 0.1; # 0.05 : slow; 0.10 : normal; 0.25 : fast
@export var scroll_sensitivity : float = 0.1;

var pitch_max : float = 0;
var pitch_min : float = -40.0;
var acceleration : float = 15.0;

func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	add_excluded_object(player);

func _unhandled_input(event):
	
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		
		rotation_degrees.x -= event.relative.y * mouse_sensitivity;
		rotation_degrees.x = clamp(rotation_degrees.x, pitch_min, pitch_max);
		
		rotation_degrees.y -= event.relative.x * mouse_sensitivity;
		rotation_degrees.y = wrapf(rotation_degrees.y, 0.0, 360.0);
	
	if Input.is_action_just_pressed("ui_cancel"):
		
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
		
		else:
			
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);

func _physics_process(delta):
	
	pass;
	
	#horizontal.rotation_degrees.y = lerp(horizontal.rotation_degrees.y, rotation_h, delta * acceleration)
	#vertical.rotation_degrees.x = lerp(vertical.rotation_degrees.x, rotation_v, delta * acceleration)
