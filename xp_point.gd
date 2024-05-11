extends Area2D

@export var value = 1

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	lifetime -= delta
	if lifetime <= 0:
		queue_free()
 

func _on_body_entered(body):	
	if body.has_method("take_damage"):
		body.take_damage()
		queue_free()
