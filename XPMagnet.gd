extends Area2D

var radius = 1

func _on_body_entered(body):
	if body.has_method("turm_magnet_on"):
		body.look_at(self.position)
		body.turm_magnet_on()

func _on_body_exited(body):
	if body.has_method("turm_magnet_off"):
		body.turm_magnet_off()
