extends Node2D


@onready var collision_polygon_2d = $StaticBody2D/CollisionPolygon2D2
@onready var collision_polygon_2d2 = $StaticBody2D/CollisionPolygon2D3
@onready var polygon = $StaticBody2D/CollisionPolygon2D2/Polygon2D
@onready var polygon2 = $StaticBody2D/CollisionPolygon2D3/Polygon2D
func _ready():
	polygon.polygon = collision_polygon_2d.polygon 
	polygon2.polygon =collision_polygon_2d2.polygon
