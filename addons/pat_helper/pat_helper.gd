@tool
extends EditorPlugin

var dock
var pat

func _enter_tree():
	
	# Initialization of the plugin goes here.
	dock = preload("res://addons/pat_helper/PATDock.tscn").instantiate()
	
	var file = FileAccess.open("res://addons/pat_helper/pat.txt", FileAccess.READ)
	var pat = file.get_as_text()
	
	dock.get_node("VBoxContainer/TextEdit").text = pat
	
	# Add the loaded scene to the docks.
	add_control_to_dock(DOCK_SLOT_LEFT_BR, dock)

func _exit_tree():
	
	# Clean-up of the plugin goes here.
	# Remove the dock.
	remove_control_from_docks(dock)
	# Erase the control from the memory.
	dock.free()
