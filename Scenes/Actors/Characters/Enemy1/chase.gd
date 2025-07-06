extends CharState
@onready var edge_detect_cast = $"../../Body/EdgeDetectCast"
var chase_speed : float = 100
var direction_mod : float = 1
@export var patrol_state : CharState
@onready var enemy_attack_area = %EnemyAttackArea
@export var attack_state : CharState
@onready var attack_timer = $"../Attack/AttackTimer"
@onready var attack_alarm = $"../../Body/Sprites/AttackAlarm"

func _ready():
	enemy_attack_area.connect("area_entered",attack)

func on_enter():
	if character.patrol_direction !=  (sign(character.global_position.direction_to(player.global_position)) * direction_mod).x:
		character.patrol_direction = (sign(character.global_position.direction_to(player.global_position)) * direction_mod).x
		character.flip()
	playback.speed_scale = 1.2
	playback.play("Walk")
	var tween = create_tween().set_parallel()
	tween.tween_property(attack_alarm,"self_modulate:a",1,0.1)
	tween.tween_property(attack_alarm,"position.y",-130,0.1)
		



func attack(area : Area2D):
	if attack_timer.is_stopped():
		attack_timer.start()
		next_state = attack_state



func state_process(delta):
	var direction = sign(character.global_position.direction_to(player.global_position)) * direction_mod
	character.velocity.x = chase_speed * direction.x * direction_mod
	if not edge_detect_cast.is_colliding() && character.direction > 0:
		character.velocity.x = 0
	character.move_and_slide()
	#if direction.x <0:
		#character.flip()
		#direction_mod = direction_mod * -1
	#character.patrol_direction = sign(character.global_position.direction_to(player.global_position).x) * direction_mod
	if character.global_position.distance_squared_to(player.global_position) > 120000:
		next_state = patrol_state
		var tween = create_tween().set_parallel()
		tween.tween_property(attack_alarm,"self_modulate:a",0,0.1)
		tween.tween_property(attack_alarm,"position.y",30,0.1)
	
