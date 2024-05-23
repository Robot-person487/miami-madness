class_name shop_Menu
extends Control
@onready var shop_menu = $"."
@onready var player = $"../Player"
@onready var title = $Title
@onready var sell = $sell
@onready var lab_name = $lab_name
@onready var lab_cost = $lab_cost
@onready var cost = $cost
@onready var name1 = $name1
@onready var cost_2 = $cost2
@onready var name_2 = $name2
@onready var cost_3 = $cost3
@onready var name_3 = $name3
@onready var sell_2 = $sell2
@onready var candy = $candy
@onready var candy_2 = $candy2
@onready var candy_3 = $candy3
@onready var texture_button = $TextureButton
@onready var texture_button_2 = $TextureButton2
@onready var texture_button_3 = $TextureButton3
@onready var lab_candy = $lab_candy
@onready var texture_rect = $TextureRect


var prefixes = ["El", "An", "Mar", "Lu", "Jo", "Da", "Re", "Sa"]
var infixes = ["na", "li", "ma", "ra", "la", "ta", "ri", "mi"]
var suffixes = ["ton", "ra", "sa", "na", "th", "ron", "an", "en"]

func generate_random_cost() -> int:
	randomize()
	return randi() % 100 + 1
func generate_candy_random_cost() -> int:
	randomize()
	return randi() % 20 + 1

func generate_random_name() -> String:
	randomize()
	var prefix = prefixes[randi() % prefixes.size()]
	var infix = infixes[randi() % infixes.size()]
	var suffix = suffixes[randi() % suffixes.size()]
	return prefix + infix + suffix

func update() -> void:
	name1.text = generate_random_name()
	name_2.text = generate_random_name()
	name_3.text = generate_random_name()
	cost_2.text = "Cost $" + str(generate_random_cost())
	cost_3.text = "Cost $" + str(generate_random_cost())
	cost.text = "Cost $" + str(generate_random_cost())
	candy_2.text = "Candy " + str(generate_candy_random_cost())
	candy_3.text = "Candy " + str(generate_candy_random_cost())
	candy.text = "Candy " + str(generate_candy_random_cost())
func _process(delta):
	sell_2.button_down.connect(exit)
	sell.button_down.connect(sellFunc)
	texture_button.button_down.connect(button1)
	texture_button_3.button_down.connect(button2)
	texture_button_2.button_down.connect(button3)
func button1() -> void:
	lab_name.text = name1.text
	lab_cost.text = cost.text
	lab_candy.text = candy.text
	texture_rect.texture = texture_button.texture_normal

func button2() -> void:
	lab_name.text = name_2.text
	lab_cost.text = cost_2.text
	lab_candy.text = candy_2.text
	texture_rect.texture = texture_button_2.texture_normal

func button3() -> void:
	lab_name.text = name_3.text
	lab_cost.text = cost_3.text
	lab_candy.text = candy_3.text
	texture_rect.texture = texture_button_3.texture_normal

func exit() -> void:
	shop_menu.visible = false

func sellFunc() -> void:
	sell.text ="Sell"
	if player.candy >= lab_candy.text.split(" ")[1].to_int():
		player.money += lab_cost.text.split(" ")[1].to_int()
		player.candy -= lab_candy.text.split(" ")[1].to_int()
	else: 
		sell.text ="not enough"
