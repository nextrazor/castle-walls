extends Area2D

@export var speed = 300
@export var hits_left = 3

var enemies_touched = []

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
 
func _on_body_entered(body):
	if body.has_method("take_damage"):
		if !enemies_touched.has(body.id):
			enemies_touched.append(body.id)
			body.take_damage()
			hits_left -= 1
			if hits_left <= 0:
				queue_free()
