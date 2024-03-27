extends CharacterBody2D

@onready var player = $/root/Game/Player
@export var speed = 50
@export var health = 2
const SMOKE_SCENE = preload("res://assets/smoke_explosion/smoke_explosion.tscn")

#func _ready():
	#%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func take_damage():
	#%Slime.play_hurt()
	health -= 1
	if health <= 0:
		queue_free()
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
