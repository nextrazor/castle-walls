extends CharacterBody2D

@export var speed = 100
@export var health = 100.0
@export var max_health = 100.0
@export var damageTaken = 5

@onready var boo = %HappyBoo

signal health_deplited

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	#if velocity.length() > 0.0:
		#boo.play_walk_animation()
	#else:
		#boo.play_idle_animation()
		
	var overlaping_mobs = %HurtBox.get_overlapping_bodies()
	var enemies_touching = overlaping_mobs.size()
	if enemies_touching > 0:
		health -= damageTaken * enemies_touching * delta
		%HPBar.value = health / max_health * 100
		if health <= 0.0:
			health_deplited.emit()
