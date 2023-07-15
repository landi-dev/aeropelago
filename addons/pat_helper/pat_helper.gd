@tool
extends EditorPlugin

var dock
var data
var vcs

func _enter_tree():
	
	# Initialization of the plugin goes here.
	dock = preload("res://addons/pat_helper/PATDock.tscn").instantiate()
	vcs = EditorVCSInterface.new()
	
	var file = FileAccess.open("res://addons/pat_helper/pat.json", FileAccess.READ)
	var json_text = file.get_as_text()
	data = JSON.parse_string(json_text)
	
	dock.get_node("HBoxContainer/LineEdit").text = data["pat"]
	
	#dock.get_node("GridContainer/UserText").text = data["username"]
	#dock.get_node("GridContainer/PATLineEdit").text = data["pat"]
	#dock.get_node("GridContainer/SSHPubText").text = data["ssh_public_key_path"]
	#dock.get_node("GridContainer/SSHPrivText").text = data["ssh_private_key_path"]
	#dock.get_node("GridContainer/SSHPassText").text = data["ssh_passphrase"]
	
	
	#update_vcs()
	
	#dock.get_node("GridContainer/SaveButton").pressed.connect(_on_save_button_pressed)
	
	# Add the loaded scene to the docks.
	add_control_to_dock(DOCK_SLOT_LEFT_BR, dock)

func _exit_tree():
	
	# Clean-up of the plugin goes here.
	# Remove the dock.
	remove_control_from_docks(dock)
	# Erase the control from the memory.
	dock.free()

func update_vcs():
	
	vcs._set_credentials(data["username"], data["pat"], data["ssh_public_key_path"], data["ssh_private_key_path"], data["ssh_passphrase"])

func _on_save_button_pressed():
	
	var file = FileAccess.open("res://addons/pat_helper/pat.json", FileAccess.WRITE)
	data["username"] = dock.get_node("GridContainer/UserText").text
	data["pat"] = dock.get_node("GridContainer/PATLineEdit").text
	data["ssh_public_key_path"] = dock.get_node("GridContainer/SSHPubText").text
	data["ssh_private_key_path"] = dock.get_node("GridContainer/SSHPrivText").text
	data["ssh_passphrase"] = dock.get_node("GridContainer/SSHPassText").text
	
	file.store_string(JSON.stringify(data))
	#update_vcs()
