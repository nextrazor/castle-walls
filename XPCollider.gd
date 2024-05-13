extends Area2D

signal add_xp(ammount)

func _on_body_entered(body):
	if body.has_method("give_xp"):
		add_xp.emit(body.give_xp())

