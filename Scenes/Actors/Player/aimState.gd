extends PlayerState

@export var general_state : PlayerState
const PROJECTILE = preload("res://Scenes/Actors/Player/projectile.tscn")
@onready var marker_2d = $"../../Body/Sprites/Core/Gun/Marker2D"
@onready var body = $"../../Body"


func on_enter():
	playback.play("Aim")

func state_input(event):
	if event.is_action_released("Attack_2"):
		playback.play("Aim_Off")
	if event.is_action_released("Attack_1"):
		playback.play("Aim_Attack")

func on_exit():
	next_state = general_state

func shoot():
	var projectile_instance = PROJECTILE.instantiate()
	projectile_instance.top_level = true
	projectile_instance.global_position = marker_2d.global_position
	projectile_instance.direction = body.scale.x
	projectile_instance.scale.x = projectile_instance.scale.x * body.scale.x
	add_child(projectile_instance)
	playback.queue("Aim_Off")
