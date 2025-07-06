extends Node
class_name PlayerStateMachine


@export var animation_player: AnimationPlayer
@export var character : CharacterBody2D
@export var current_state : PlayerState
var states: Array[PlayerState]



func _ready():
	for child in get_children():
		if(child is PlayerState):
			states.append(child)
			child.connect("interrupt_state",on_state_interrupt_state)
			child.player = character
			child.playback = animation_player

func _physics_process(delta):
	if (current_state.next_state != null):
		switch_states(current_state.next_state)
	current_state.state_process(delta)

func switch_states(new_state:PlayerState):
	if(current_state != null):
		current_state.on_exit()
		current_state.next_state = null
		current_state = new_state
		current_state.on_enter()

func _input(event):
	current_state.state_input(event)

func state_cant_move():
	return current_state.cant_move

func on_state_interrupt_state(new_state:PlayerState):
	switch_states(new_state)
