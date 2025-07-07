extends CharState

@export var die_state : CharState
@export var patrol_state : CharState

@onready var body = $"../../Body"
@onready var stagger_sfx = $"../../Body/StaggerSFX"

var health : int = 3

func on_enter():
	playback.play("RESET")
	stagger_sfx.play()
	health -= 1
	if health <1:
		next_state = die_state
		pass
	var tween = create_tween()
	tween.tween_property(body,"modulate",Color.RED,0.2)
	tween.tween_property(body,"modulate",Color.WHITE,0.1)
	tween.tween_callback(return_to_patrol)

func return_to_patrol():
	next_state = patrol_state
