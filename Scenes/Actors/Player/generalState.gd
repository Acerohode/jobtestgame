extends PlayerState

@export var attack_state : PlayerState
@export var aim_state : PlayerState

func state_input(event):
	if event.is_action_pressed("Attack_2"):
		next_state = aim_state
	if event.is_action_pressed("Attack_1") && player.is_on_floor():
		next_state = attack_state
		
