extends CharacterBody2D
class_name Player


const speed =60
var current_dir = "none"
var money: int=0
var candy: int=0
@export var max_health = 100
@onready var health: int=max_health
func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		
		current_dir="right"
		play_anim()
		velocity.x =speed
		velocity.y=0
		
	elif Input.is_action_pressed("ui_left"):
		current_dir ="left"
		play_anim()
		velocity.x=-speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim()
		velocity.y =speed
		velocity.x=0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim()
		velocity.y=-speed
		velocity.x=0
	else:
		if current_dir == "up":
			current_dir= "back"
		elif current_dir == "right":
			current_dir = "Mr.Arnold"
		elif current_dir == "left":
			current_dir = "flip"
		elif current_dir =="down":
			current_dir = "Mr.Marsh"
		play_anim()
		velocity.x=0
		velocity.y = 0
	move_and_slide()

func play_anim():
	
	var dir =current_dir
	var anim = $CollisionShape2D/AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		anim.play("walk_right")
	elif dir == "left":
		anim.play("walk_left")
	elif dir == "down":
		anim.play("walk_back")
	elif dir == "up":
		anim.play("walk_forward")
	elif  dir == "back":
		anim.play("standing_back")
	elif dir == "flip":
		anim.flip_h = true
		anim.play("idle")
	else:
		anim.play("idle")
func take_damage(amount: float):
	health -= amount
	if health < 0:
		health = 0


func heal(amount: float):
	health += amount
	if health > max_health:
		
		health = max_health

