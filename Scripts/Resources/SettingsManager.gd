extends Node

var settings : Settings;

func init() -> void:
	
	settings = load_settings();
	settings.resolution = Vector2(1920, 1080);
	apply_settings();

func save_settings() -> void:
	
	print("Saving settings file...");
	if not settings:
		
		settings = load_settings();
	
	var result = ResourceSaver.save(settings, "user://settings.tres");
	assert(result == OK);

func load_settings() -> Settings:
	
	# THIS IS ONLY TEMPORARY!! DELETE LATER!!
	return Settings.new();
	
	print("Loading settings file...");
	if ResourceLoader.exists("user://settings.tres"):
		
		var data = ResourceLoader.load("user://settings.tres");
		
		if data is Settings:
			
			return data;
	
	print("Creating new settings file...");
	settings = Settings.new();
	save_settings();
	
	return load_settings();

func apply_settings() -> void:
	
	# Anti-Ailiasing
	# 0 : DISABLED, 1 : 2X, 2: 4X, 3: 8X, 4: MAX
	RenderingServer.viewport_set_msaa_3d(get_viewport(), settings.anti_ailiasing);
	
	# Resolution and Window Size
	DisplayServer.window_set_size(settings.resolution);
	DisplayServer.window_set_mode(settings.window_mode); # 0 : WIN, 1: WIN_MAX, 2: WIN_MIN, 3: FULL
	get_viewport().content_scale_size = settings.resolution;
	
	#V-Sync
	DisplayServer.window_set_vsync_mode(int(settings.vsync)); # O : FALSE, 1 : TRUE
	
	# FPS
	Engine.set_max_fps(int(settings.fps_lock)); # 0 : NO LIMIT,
	if settings.fps_lock:
		
		Engine.set_max_fps(settings.fps_cap);
	
