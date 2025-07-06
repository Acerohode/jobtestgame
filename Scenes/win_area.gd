extends Area2D

func _ready():
	connect("area_entered",detect_win)

func detect_win(area:Area2D):
	if area.has_method("hurt_player"):
		SignalBus.game_won.emit()
