extends CharacterBody2D

var direction : float = 1.0
@onready var enemy_state_machine = $EnemyStateMachine
var chase_logic : bool = false
var speed : float = 100.0
var player : CharacterBody2D
@onready var edge_detect_cast = $Body/EdgeDetectCast
@onready var body = $Body

var patrol_direction : int = 1
signal died()

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func flip():
	body.scale.x = patrol_direction


func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
