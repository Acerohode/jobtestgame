extends Control
@onready var button = $Button

func _ready():
	SignalBus.connect("player_dead",show)
	button.connect("pressed",restart)
	hide()


func restart():
	get_parent().get_parent().get_parent().queue_redraw()
