extends CharState


@onready var enemy_attack_area = %EnemyAttackArea
@export var patrol_state : CharState
@onready var attack_timer = $AttackTimer
@onready var attack_alarm = $"../../Body/Sprites/AttackAlarm"



func on_enter():
	playback.speed_scale = 1
	playback.play("Attack")
	

func on_exit():
	next_state = patrol_state
	var tween = create_tween().set_parallel()
	tween.tween_property(attack_alarm,"self_modulate:a",0,0.1)
	tween.tween_property(attack_alarm,"position.y",30,0.1)
