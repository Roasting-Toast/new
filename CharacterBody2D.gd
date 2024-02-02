extends CharacterBody2D

class_name Player

signal healthChanged

@onready var player_speed = 300
@onready var animated_sprite = $AnimatedSprite2D
@export var maxHealth = 100
@onready var currentHealth: int = maxHealth
@export var healthBar: healthbar


func _process(_delta):
	
	animated_sprite.play()
	var _direction = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"),Input.get_action_strength("down") - Input.get_action_strength("up"))
	velocity = Input.get_vector("left", "right", "up", "down").normalized() * player_speed
	move_and_slide()
	
	if Input.is_action_just_pressed("right"):
		animated_sprite.flip_h = 100
	elif Input.is_action_just_pressed("left"):
		animated_sprite.flip_h = 0
		

	if currentHealth >= 100:
		currentHealth = 100
	if currentHealth <= 0:
		currentHealth = 0
		get_tree().change_scene_to_file("res://died.tscn")

func _on_damage_pressed():
	currentHealth -= 25
	healthChanged.emit()
	

func _on_heal_pressed():
	currentHealth += 25
	healthChanged.emit()


func _on_healthbar_ready():
	healthChanged.connect(update)
	update()
	
func update():
	healthBar.value = currentHealth
	
