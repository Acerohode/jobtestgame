extends PlayerState

@export var general_state : PlayerState

func on_enter():
	playback.play("Melee")

func on_exit():
	next_state = general_state
