extends PlayerState

func _ready():
	SignalBus.connect("player_dead",die)

func die():
	playback.stop()
	interrupt_state.emit(self)
	player.commit_die()
	player.hide()
	
