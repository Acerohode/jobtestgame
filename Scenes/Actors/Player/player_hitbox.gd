extends Area2D


func hurt_player():
	SignalBus.player_damage.emit()
