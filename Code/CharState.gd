extends Node

class_name CharState

@export var cant_move : bool = true

var next_state : CharState
var player : CharacterBody2D
var character : CharacterBody2D
var playback : AnimationPlayer

signal interrupt_state(new_state:CharState)


func state_process(delta):
	pass

func on_enter():
	pass

func on_exit():
	pass
