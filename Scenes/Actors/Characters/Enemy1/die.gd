extends CharState

func on_enter():
	SignalBus.enemy_killed.emit()
	character.commit_die()
