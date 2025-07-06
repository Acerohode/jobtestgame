extends Node

class_name CharState

var next_state : CharState
signal interrupt_state(new_state:CharState)
var player : CharacterBody2D
var character : CharacterBody2D
var playback : AnimationPlayer
@export var cant_move : bool = true

func state_process(delta):
	pass

func on_enter():
	pass

func on_exit():
	pass
