extends Node

class_name PlayerState

@export var cant_move:bool = false
var next_state : PlayerState
var player: Node2D
var playback : AnimationPlayer
signal interrupt_state(new_state:PlayerState)


func state_process(delta):
	pass

func on_enter():
	pass

func on_exit():
	pass

func state_input(event):
	pass
