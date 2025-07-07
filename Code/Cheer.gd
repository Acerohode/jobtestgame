extends Control


@onready var animation_player = $AnimationPlayer

func _ready():
	SignalBus.connect("enemy_killed",cheer)
	SignalBus.connect("game_won",cheer_ultra)

func cheer():
	animation_player.play("cheer")

func cheer_ultra():
	animation_player.queue("cheer_2")
