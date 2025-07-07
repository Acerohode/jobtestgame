extends VSlider


@export var busname : String
var bus_index : int

func _ready():
	bus_index = AudioServer.get_bus_index(busname)
	value_changed.connect(change_volume)
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))


func change_volume(value:float):
	AudioServer.set_bus_volume_db(bus_index,linear_to_db(value))
