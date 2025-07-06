extends Control
@onready var health_label = $HealthLabel
var current_health: int = 5
@onready var score_label = $ScoreLabel

var score : int = 0



func _ready():
	SignalBus.connect("player_damage",update_health)
	SignalBus.connect("enemy_killed",update_score)
	health_label.text = "Health: " + str(current_health)
	score_label.text = "Enemies_defeated: " + str(score)


func update_health():
	current_health -= 1
	health_label.text = "Health: " + str(current_health)
	if current_health < 1:
		SignalBus.player_dead.emit()
		

func update_score():
	score+= 1
	score_label.text = "Enemies_defeated: " + str(score)
	
