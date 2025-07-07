extends PlayerState

@export var general_state : PlayerState
const PROJECTILE = preload("res://Scenes/Actors/Player/projectile.tscn")
@onready var marker_2d = $"../../Body/Sprites/Core/Gun/Marker2D"
@onready var body = $"../../Body"
var loaded : bool = true
@onready var head = $"../../Body/Sprites/Core/Head"
@onready var reload_timer = $ReloadTimer
@onready var reload_sfx = $"../../Body/ReloadSFX"
var reloaded : bool = true
func _ready():
	reload_timer.connect("timeout",reload                                       )

func on_enter():
	playback.play("Aim")

func state_input(event):
	if event.is_action_released("Attack_2"):
		playback.play("Aim_Off")
	if event.is_action_released("Attack_1")&& reloaded:
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
	head.hide()
	playback.queue("Aim_Off")
	reload_timer.start(4)
	reloaded = false
	


func reload():
	head.position = Vector2(10,82)
	head.show()
	reloaded = true
	var tween = create_tween()
	tween.tween_property(head,"position:y",0,0.4)
	reload_sfx.play()
