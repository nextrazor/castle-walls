extends CharacterBody2D

var id = randf()
@onready var player = $/root/Game/Player
@export var speed = 50
@export var health = 2
const SMOKE_SCENE = preload("res://assets/smoke_explosion/smoke_explosion.tscn")
const XP_POINT_SCENE = preload("res://prefabs/projectiles/xpPoint.tscn")

#func _ready():
	#%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func spawnXp(count):
	for i in count:
		var point = XP_POINT_SCENE.instantiate()
		point.spawn(100, 300)
		point.global_position = global_position
		get_parent().add_child(point)

func take_damage():
	#%Slime.play_hurt()
	health -= 1
	if health <= 0:
		queue_free()
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		spawnXp(1)
		smoke.global_position = global_position
