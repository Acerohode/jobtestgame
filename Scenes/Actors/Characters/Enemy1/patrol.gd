extends CharState

@onready var edge_detect_cast = $"../../Body/EdgeDetectCast"
@export var chase_state : CharState

var patrol_speed  : float = 60
@export var attack_state : CharState


func on_enter():
	playback.speed_scale = 0.7
	playback.play("Walk")



func state_process(delta):
	character.velocity.x = patrol_speed * character.patrol_direction
	if not edge_detect_cast.is_colliding():
		character.patrol_direction = character.patrol_direction *-1
		character.flip()
	character.move_and_slide()
	if character.global_position.distance_squared_to(player.global_position) < 90000:
		next_state = chase_state
