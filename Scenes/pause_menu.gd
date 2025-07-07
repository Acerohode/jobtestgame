extends Control
@onready var restart_button = $RestartButton
@onready var quit_button = $QuitButton

func _ready():
	SignalBus.connect("game_pause",show)
	restart_button.connect("pressed",restart)
	quit_button.connect("pressed",quit_game)

func _input(event):
	if event.is_action_released("Pause"):
		hide()
		get_tree().paused = false
		print("paused")


func restart():
	get_tree().paused = false
	get_tree().reload_current_scene()

func quit_game():
	get_tree().quit()
