extends CanvasLayer

@onready var main : Node3D = get_node("/root/Main");
@onready var animation_player : AnimationPlayer = get_node("AnimationPlayer"); 

func transition_in() -> void:
	
	animation_player.play("Dissolve");
	await animation_player.animation_finished;

func transition_out() -> void:
	
	animation_player.play_backwards("Dissolve");
	await animation_player.animation_finished;
