extends CharacterBody2D


var speed = 300.0
const JUMP_VELOCITY = -800.0

@onready var body = $Body
@onready var player_state_machine = $PlayerStateMachine
@onready var foot_r = $Body/Sprites/FootR
@onready var foot_l = $Body/Sprites/FootL

@onready var walk_anim = $Body/Sprites/WalkAnim


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
