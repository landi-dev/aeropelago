extends Node3D;

var start_screen_path : String = "res://Scenes/UI/Screens/StartScreen.tscn";

func _ready():
	
	start_game();

func start_game():
	
	print("Starting game...");
	var change_scene_err : Error = change_scene(start_screen_path);
	
	if change_scene_err == ERR_FILE_NOT_FOUND:
		
		printerr(get_stack()[0]["source"], ":", get_stack()[0]["line"], " - ", "StartScreen.tscn not found at path \"", start_screen_path, "\"");
		return;
	
	elif change_scene_err == ERR_CANT_OPEN:
		
		printerr(get_stack()[0]["source"], ":", get_stack()[0]["line"], " - ", "StartScreen.tscn couldn't be initialized.");
		return;
	

func change_scene(file_path : String, node_name : String = "") -> Error:
	
	if node_name:
		
		print("Changing scene to ", file_path, " with name ", node_name, "...");
	
	else:
		
		print("Changing scene to ", file_path, " with default name...");
	
	if not FileAccess.file_exists(file_path):
		
		return ERR_FILE_NOT_FOUND;
	
	clear_children();
	
	var scene = load(file_path);
	var scene_instance = scene.instantiate();
	if node_name:
		
		scene_instance.set_name(node_name); 
	
	self.add_child(scene_instance);
	return scene_instance.init();

func add_scene(file_path : String, node_name : String = "", parent : Node = self):
	
	if node_name:
		
		print("Adding scene ", file_path, " to parent " , parent, " with name ", node_name, "...");
	
	else:
		
		print("Adding scene ", file_path, " to parent ", parent, " with default name...");
	
	if not FileAccess.file_exists(file_path):
		
		return ERR_FILE_NOT_FOUND;
	
	var scene = load(file_path);
	var scene_instance = scene.instantiate();
	if node_name:
		
		scene_instance.set_name(node_name); 
	
	parent.add_child(scene_instance);
	return scene_instance.init();

func clear_children() -> void:
	
	for child in get_children():
		
		child.queue_free();
