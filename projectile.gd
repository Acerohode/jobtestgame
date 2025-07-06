extends Node2D
@onready var bullet_hit_area = $Bullet_hit_area
var direction : float = 1.0
var speed = 10
@onready var phys_collision_cast = $PhysCollisionCast

func _ready():
	bullet_hit_area.connect("area_entered",check_collision)

func _physics_process(delta):
	position.x += direction * speed * delta
	if phys_collision_cast.is_colliding():
		queue_free()


func check_collision(area:Area2D):
	if area.has_method("nuke_enemy"):
		area.nuke_enemy()
		queue_free()
	
	
