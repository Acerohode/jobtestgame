extends Area2D

func _ready():
	connect("area_entered",deal_damage)


func deal_damage(area:Area2D):
	if area.has_method("hurt_player"):
		area.hurt_player()
