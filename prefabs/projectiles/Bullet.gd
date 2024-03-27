extends Area2D

@export var speed = 300
@export var lifetime = 5

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	lifetime -= delta
	if lifetime <= 0:
		queue_free()
 

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
