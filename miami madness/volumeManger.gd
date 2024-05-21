extends HSlider

@export
var name_bus: String
var index_bus: int 


func _ready():
	index_bus = AudioServer.get_bus_index(name_bus)
	value_changed.connect(on_value_change)
	
	value = db_to_linear(AudioServer.get_bus_volume_db(index_bus))

func on_value_change(new_value: float) -> void:
	AudioServer.set_bus_volume_db(index_bus, linear_to_db(new_value))
