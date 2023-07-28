extends CanvasLayer

@onready var main : Node3D = get_node("/root/Main");
@onready var animation_player : AnimationPlayer = get_node("AnimationPlayer"); 

func change_scene(file_path : String, transition : String = "dissolve") -> Error:
	
	return await transition_dissolve(file_path);

func transition_dissolve(file_path : String) -> Error:
	
	animation_player.play("dissolve");
	await animation_player.animation_finished;
	
	var change_scene_err : Error = main.change_scene(file_path);
	
	animation_player.play_backwards("dissolve");
	await animation_player.animation_finished;
	
	return change_scene_err;
