extends Node

var settings : Settings;

func init() -> void:
	
	settings = load_settings();
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
	
	DisplayServer.window_set_mode(settings.window_mode);
