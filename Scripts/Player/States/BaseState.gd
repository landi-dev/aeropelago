class_name BaseState;
extends Node;

enum STATE {
	NULL,
	IDLE,
	SPRINT,
	JUMP,
	FALL,
	LAND
};

@export var animation_name : String;
@export var player : Player;

func enter() -> void:
	
	if animation_name:
		
		player.animation_player.play(animation_name);

func exit() -> void:
	
	pass;

func input(event : InputEvent) -> int:
	
	return STATE.NULL;

func process(delta : float) -> int:
	
	return STATE.NULL;

func physics_process(delta : float) -> int:
	
	return STATE.NULL;
