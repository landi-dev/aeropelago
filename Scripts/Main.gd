extends Node3D;

var start_screen_path : String = "res://Scenes/UI/Screens/StartScreen.tscn";

func _ready():
	
	start_game();

func start_game():
	
	print("Starting game...");
	var change_scene_err : Error = await change_scene(start_screen_path, false);
	
	if change_scene_err == ERR_FILE_NOT_FOUND:
		
		printerr(get_stack()[0]["source"], ":", get_stack()[0]["line"], " - ", "StartScreen.tscn not found at path \"", start_screen_path, "\"");
		return;
	
	elif change_scene_err == ERR_CANT_OPEN:
		
		printerr(get_stack()[0]["source"], ":", get_stack()[0]["line"], " - ", "StartScreen.tscn couldn't be initialized.");
		return;
	

func change_scene(file_path : String, transition : bool = true) -> Error:
	
	if transition:
		
		await SceneTransition.transition_in();
	
	else:
		
		print("Changing scene to ", file_path, "...");
	
	if not FileAccess.file_exists(file_path):
		
		return ERR_FILE_NOT_FOUND;
	
	clear_children();
	
	var scene = load(file_path);
	var scene_instance = scene.instantiate();
	
	self.add_child(scene_instance);
	scene_instance.init();
	
	if transition:
		
		await SceneTransition.transition_out();
	
	return OK;

func add_scene(file_path : String, parent : Node = self):
	
	print("Adding scene ", file_path, " to parent ", parent, "...");
	
	if not FileAccess.file_exists(file_path):
		
		return ERR_FILE_NOT_FOUND;
	
	var scene = load(file_path);
	var scene_instance = scene.instantiate();
	
	parent.add_child(scene_instance);
	return scene_instance.init();

func clear_children() -> void:
	
	for child in get_children():
		
		child.queue_free();
