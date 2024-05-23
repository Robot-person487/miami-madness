extends Node2D

@onready var collision_polygon_2d = $StaticBody2D/CollisionPolygon2D2
@onready var collision_polygon_2d2 = $StaticBody2D/CollisionPolygon2D3
@onready var polygon = $StaticBody2D/CollisionPolygon2D2/Polygon2D
@onready var polygon2 = $StaticBody2D/CollisionPolygon2D3/Polygon2D
@onready var money_text = $MarginContainer/HBoxContainer/Label
@onready var candy_txt = $MarginContainer/HBoxContainer/Label2
@onready var character = $Player
var coin_scene: PackedScene
var bag_coin_scene: PackedScene
@export var spawn_area_min = Vector2(80, 64)
@export var spawn_area_max = Vector2(240, 144) 
@export var spawn_interval = 9.0  

func spawn_coin():
	if coin_scene != null: 
		var coin_instance = coin_scene.instantiate()
		var coin_bag_instance = bag_coin_scene.instantiate()
		var spawn_position = Vector2(
			randf_range(spawn_area_min.x, spawn_area_max.x),
			randf_range(spawn_area_min.y, spawn_area_max.y)
		)
		var spawn_position1 = Vector2(
			randf_range(spawn_area_min.x, spawn_area_max.x),
			randf_range(spawn_area_min.y, spawn_area_max.y)
		)
		coin_instance.position = spawn_position
		coin_bag_instance.position = spawn_position1
		add_child(coin_instance)
		add_child(coin_bag_instance)
	else:
		print("Coin scene is not loaded.")

func _ready():
	randomize()
	coin_scene = load("res://coin.tscn")
	bag_coin_scene = load("res://bag_coin.tscn")
	spawn_coin()
	set_process(true)
	polygon.polygon = collision_polygon_2d.polygon
	polygon2.polygon = collision_polygon_2d2.polygon

func _process(delta):
	display_update()
	spawn_interval -= delta
	if spawn_interval <= 0:
		spawn_coin()
		spawn_interval = 9.0

func display_update() -> void:
	money_text.text = "$" + str(character.money)
	candy_txt.text = str(character.candy)
