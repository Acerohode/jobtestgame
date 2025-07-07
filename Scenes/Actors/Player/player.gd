extends CharacterBody2D


var speed = 300.0
const JUMP_VELOCITY = -800.0

@onready var body = $Body
@onready var player_state_machine = $PlayerStateMachine
@onready var foot_r = $Body/Sprites/FootR
@onready var foot_l = $Body/Sprites/FootL
const EXPLOSION = preload("res://Scenes/explosion.tscn")
@onready var walk_anim = $Body/Sprites/WalkAnim
@onready var pause_timer = $PauseTimer

@onready var step_sfx = $Body/StepSFX
var dead : bool = false

func _physics_process(delta):
	if not player_state_machine.state_cant_move():
		if not is_on_floor():
			velocity += get_gravity() * delta
		if Input.is_action_just_pressed("Up") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		var direction = Input.get_axis("Left", "Right")
		if direction:
			velocity.x = direction * speed
			walk_anim.speed_scale = speed/300
			walk_anim.play("Walk")
			if direction < 0:
				body.scale.x = -1
			else:
				body.scale.x = 1
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			if walk_anim.is_playing():
				walk_anim.play("RESET")
		move_and_slide()
	elif walk_anim.is_playing() && player_state_machine.state_cant_move():
				walk_anim.play("RESET")

func steppy():
	step_sfx.pitch_scale = 0.7 + randf_range(0,0.5)
	step_sfx.play()

func _input(event):
	if event.is_action_released("Pause") && pause_timer.is_stopped():
		pause_timer.start()
		SignalBus.game_pause.emit()
		get_tree().paused = true


func commit_die():
	if not dead:
		dead = true
		var explode_instance = EXPLOSION.instantiate()
		explode_instance.top_level = true
		explode_instance.global_position = global_position
		explode_instance.scale = Vector2.ONE * 20
		get_parent().add_child(explode_instance)
