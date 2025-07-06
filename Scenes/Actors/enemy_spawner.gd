extends Node2D
const ENEMY = preload("res://Scenes/Actors/Characters/Enemy1/enemy.tscn")
var dead : bool = true
@onready var visibility_indicator = $Visibility_indicator

func _ready():
	spawn_enemy()
	

func _process(delta):
	if dead && not visibility_indicator.is_on_screen():
		spawn_enemy()


func spawn_enemy():
	dead = false
	var enemy_instance = ENEMY.instantiate()
	enemy_instance.connect("died",deadflip)
	add_child(enemy_instance)
	

func deadflip():
	dead = true
