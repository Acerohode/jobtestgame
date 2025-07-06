extends CharState
@onready var body = $"../../Body"
@export var die_state : CharState
@export var patrol_state : CharState
var health : int = 3


func on_enter():
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
