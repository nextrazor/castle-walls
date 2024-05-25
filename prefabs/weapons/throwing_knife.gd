extends Area2D

const BULLET = preload("res://prefabs/projectiles/piercing.tscn")

func _physics_process(delta):
	look_at(PlayerVariables.pos + PlayerVariables.direction * 100)

func shoot():
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)

func _on_timer_timeout():
	shoot()
