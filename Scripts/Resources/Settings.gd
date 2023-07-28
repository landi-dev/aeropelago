extends Resource;
class_name Settings;

# Controls
@export var key_bindings : Resource;
@export_range(1, 25, 1) var mouse_sensitivity : int;
# Graphics and Performance
@export var quality : int # 0 : LOWEST, 1 : NORMAL, 2 : HIGH, 3 : BEST, 4 : CUSTOM
@export var anti_ailiasing : int;
@export var textures : int;
@export var particles : int;
@export var bloom : bool;
@export var lense_flare : bool;
@export_range(25, 100, 1) var gamma : int;
@export var resolution : Vector2;	# 640x480 (4:3), 800x600 (4:3), 1024x768 (4:3), 
										# 1280x1024(5:4), 1280x720 (16:9), 1366x768(16:9), 
										# 1600x900(16:9), 1920x1080 (16:9), 2560x1440 (16:9), 
										# 1280x800 (16:10), 1440x900 (16:10), 1680x1050 (16:10), 
										# 1920x1200 (16:10)
@export var window_mode : DisplayServer.WindowMode; # WINDOW_MODE_WINDOWED, WINDOW_MODE_MINIMIZED, 
													# WINDOW_MODE_MAXIMIZED, WINDOW_MODE_FULLSCREEN
@export var vsync : bool;
@export var fps_lock : bool;
@export_range(20, 240, 10) var fps_cap : int;
# Accessibility
@export var subtitles : bool;
@export var difficulty : int;
@export var aim_assist : bool;
@export var hints : bool;
@export var minimap : bool;
# Motion Sickness
@export_range(60, 180, 10) var fov : int;
@export var motion_blur : bool;
@export var camera_bob : bool;
@export var camera_shake : bool;
# Audio
@export_range(0, 100, 1) var master_volume : int;
@export_range(0, 100, 1) var music_volume : int;
@export_range(0, 100, 1) var sfx_volume : int;
@export_range(0, 100, 1) var characters_volume : int;
@export_range(0, 100, 1) var enemies_volume : int;
@export_range(0, 100, 1) var environment_volume : int;

func _init(s_key_bindings : Resource = null, 
	s_mouse_sensitivity : int =  15, s_quality : int = 1, s_anti_aliasing : int = 1, 
	s_textures : int = 1,  s_particles : int = 1, s_bloom : bool = true, 
	s_lense_flare : bool = true, s_gamma : int = 50, s_resolution : Vector2 = Vector2(1280, 720), 
	s_window_mode : int = 2, s_vsync : bool = true, s_fps_lock : bool = true, 
	s_fps_cap : int = 60, s_subtitles : bool = false, s_difficulty : int = 1, 
	s_aim_assist : bool = true, s_hints : bool = true, s_minimap : bool = true, s_fov : int = 90, 
	s_motion_blur : bool = true, s_camera_bob : bool = true, s_camera_shake : bool = true, 
	s_master_volume : int = 75, s_music_volume : int = 75, s_sfx_volume : int = 75, 
	s_characters_volume : int = 75, s_enemies_volume : int = 75, s_environment_volume : int = 75
) -> void:
	
	key_bindings = s_key_bindings;
	mouse_sensitivity = s_mouse_sensitivity;
	
	quality = s_quality;
	anti_ailiasing = s_anti_aliasing;
	textures = s_textures;
	particles = s_particles; 
	bloom = s_bloom;
	lense_flare = s_lense_flare;
	gamma = s_gamma;
	resolution = s_resolution;
	window_mode = s_window_mode;
	vsync = s_vsync;
	fps_lock = s_fps_lock;
	fps_cap = s_fps_cap;
	
	subtitles = s_subtitles;
	difficulty = s_difficulty;
	aim_assist = s_aim_assist;
	hints = s_hints;
	minimap = s_minimap;
	
	fov = s_fov;
	motion_blur = s_motion_blur;
	camera_bob = s_camera_bob;
	camera_shake = s_camera_shake;
	
	master_volume = s_master_volume;
	music_volume = s_music_volume;
	sfx_volume = s_sfx_volume;
	characters_volume = s_characters_volume;
	enemies_volume = s_enemies_volume;
	environment_volume = s_environment_volume;
