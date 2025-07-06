extends Node

class_name CreatureStateMachine


@export var current_state : CharState
@export var character : CharacterBody2D
@export var animation_player : AnimationPlayer

var states: Array[CharState]

var char_cant_move : bool


func _ready():
	for child in get_children():
		if(child is CharState):
			states.append(child)
			child.player = get_tree().get_first_node_in_group("Player")
			child.connect("interrupt_state",on_state_interrupt_state)
			child.character = character
			child.playback = animation_player

func _physics_process(delta):
	if (current_state.next_state != null):
		switch_states(current_state.next_state)
	current_state.state_process(delta)

func switch_states(new_state:CharState):
	if(current_state != null):
		current_state.on_exit()
		current_state.next_state = null
		current_state = new_state
		current_state.on_enter()

func state_cant_move():
	return current_state.cant_move

func on_state_interrupt_state(new_state:CharState):
	switch_states(new_state)
