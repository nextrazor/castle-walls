extends CharacterBody2D

@export var value = 1
@export var speed = 100

var magnet_in_range = false


func _physics_process(delta):
	if (magnet_in_range):
		var direction = (PlayerVariables.pos - self.global_position).normalized()
		position += direction * speed * delta

func spawn(min: int, max:int):
	value = randi_range(min, max);
	if (value >= 200):
		get_node("xp_sprite").texture = load("res://assets/Tiles/Colored/tile_0132.png")
	else:
		get_node("xp_sprite").texture = load("res://assets/Tiles/Colored/tile_0131.png")

func turm_magnet_on():
	magnet_in_range = true

func turm_magnet_off():
	magnet_in_range = false

func give_xp():
	queue_free()
	return value
