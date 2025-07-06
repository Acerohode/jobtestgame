extends Control

func _ready():
	SignalBus.connect("game_won",show)
	hide()
