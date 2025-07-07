extends Node2D
@onready var explode_sfx = $ExplodeSFX

func _ready():
	explode_sfx.connect("finished",queue_free)
