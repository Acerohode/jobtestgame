extends Area2D


func _ready():
	connect("area_entered", damage)

func damage(area:Area2D):
	if area.has_method("damage_enemy"):
		area.damage_enemy()
