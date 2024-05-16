class_name MainMenu
extends Control

@onready var start_button =$MarginContainer/VBoxContainer/play as Button
@onready var settings_button =$MarginContainer/VBoxContainer/options as Button
@onready var quit_button =$MarginContainer/VBoxContainer/Quit as Button
@onready var setting_scene =preload("res://settings.tscn") 
@onready var options_menu = $"Settings menu" as settings_menu
@onready var margin_container = $MarginContainer as MarginContainer
@onready var volMargin_container = $"Settings menu/ColorRect2/volumeContainer" as MarginContainer
@onready var credMargin_container = $"Settings menu/ColorRect2/CreditContainer" as MarginContainer
@onready var volume_button =$"Settings menu/MarginContainer/HBoxContainer/volume" as Button
@onready var credits_button =$"Settings menu/MarginContainer/HBoxContainer/credits" as Button
@onready var gameScene = preload("res://game.tscn")
func on_exit_options_menu() -> void:
	margin_container.visible = true
	options_menu.visible = false
func _ready():
	start_button.button_down.connect(start_pressed)
	settings_button.button_down.connect(setting_pressed)
	quit_button.button_down.connect(quit_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_menu) 
	volume_button.button_down.connect(volMenu)
	credits_button.button_down.connect(credMenu)

func start_pressed() -> void:
	get_tree().change_scene_to_packed(gameScene)
func setting_pressed() -> void:
	margin_container.visible = false
	options_menu.visible = true
func quit_pressed() -> void:
	get_tree().quit()

func volMenu() -> void:
	volMargin_container.visible = true
	credMargin_container.visible= false
func credMenu() -> void:
	volMargin_container.visible = false
	credMargin_container.visible= true
