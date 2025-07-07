extends Area2D

@onready var body = $".."

func hurt_player():
	SignalBus.player_damage.emit()
	var tween = create_tween()
	tween.tween_property(body,"modulate",Color.RED,0.2)
	tween.tween_property(body,"modulate",Color.WHITE,0.1)
