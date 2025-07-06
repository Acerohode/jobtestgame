extends Area2D

@onready var stagger_state = $"../../EnemyStateMachine/Stagger"
@onready var enemy = $"../.."
@onready var die_state = $"../../EnemyStateMachine/Die"

func _ready():
	connect("area_entered",damage_player_check)

func damage_player_check(area:Area2D):
	if area.has_method("hurt_player"):
		area.hurt_player()

func damage_enemy():
	stagger_state.interrupt_state.emit(stagger_state)

func nuke_enemy():
	die_state.interrupt_state.emit(die_state)
