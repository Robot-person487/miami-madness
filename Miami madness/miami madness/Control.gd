class_name  settings_menu
extends Control

@onready var exit_button = $exit as Button
signal  exit_options_menu
func _ready():
	exit_button.button_down.connect(exit)
	set_process(false)

func exit() -> void:
	exit_options_menu.emit()
	set_process(false)
