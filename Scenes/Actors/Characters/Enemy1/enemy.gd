extends CharacterBody2D


@onready var step_sfx = $Body/StepSFX
@onready var enemy_state_machine = $EnemyStateMachine
@onready var edge_detect_cast = $Body/EdgeDetectCast
@onready var body = $Body

const EXPLOSION = preload("res://Scenes/explosion.tscn")

var direction : float = 1.0
var chase_logic : bool = false
var speed : float = 100.0
var player : CharacterBody2D
var patrol_direction : int = 1

signal died()

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func flip():
	body.scale.x = patrol_direction


func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta


func commit_die():
	died.emit()
	var explode_instance = EXPLOSION.instantiate()
	explode_instance.top_level = true
	explode_instance.global_position = global_position
	explode_instance.scale = Vector2.ONE * 4
	get_parent().add_child(explode_instance)
	queue_free()

func steppy():
	step_sfx.pitch_scale = 0.7 + randf_range(0,0.5)
	step_sfx.play()
