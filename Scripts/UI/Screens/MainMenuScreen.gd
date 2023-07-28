extends Control;

@onready var main = get_node("/root/Main");
@onready var new_game_button = get_node("MarginContainer/Content/Buttons/NewGameButton");
@onready var continue_button = get_node("MarginContainer/Content/Buttons/ContinueButton");
@onready var settings_button = get_node("MarginContainer/Content/Buttons/SettingsButton");
@onready var quit_button = get_node("MarginContainer/Content/Buttons/QuitButton");

func init() -> Error:
	
	new_game_button.pressed.connect(_on_NewGameButton_pressed);
	continue_button.pressed.connect(_on_ContinueButton_pressed);
	settings_button.pressed.connect(_on_SettingsButton_pressed);
	quit_button.pressed.connect(_on_QuitButton_pressed);
	
	return OK;
	#return ERR_CANT_OPEN;

func _on_NewGameButton_pressed() -> Error:
	
	print("New Game!");
	
	return OK;

func _on_ContinueButton_pressed() -> Error:
	
	print("Continue!");
	
	return OK;

func _on_SettingsButton_pressed() -> Error:
	
	print("Settings!");
	
	return OK;

func _on_QuitButton_pressed() -> Error:
	
	print("Quit!");
	get_tree().quit();
	
	return OK;
