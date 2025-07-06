extends CharState

func on_enter():
	SignalBus.enemy_killed.emit()
	on_exit()

func on_exit():
	character.died.emit()
	character.queue_free()
