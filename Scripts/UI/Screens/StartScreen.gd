extends Control;

@onready var main = get_node("/root/Main");

var main_menu_screen_path = "res://Scenes/UI/Screens/MainMenuScreen.tscn";

func init() -> Error:
	
	return OK;

func _unhandled_key_input(_event) -> void:
	
	main.change_scene(main_menu_screen_path);
