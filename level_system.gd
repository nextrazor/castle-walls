extends Node

var level = 0
var currnet_xp = 0
var nextLvlXp = 1000

func levelUp():
	level += 1
	currnet_xp -= nextLvlXp
	nextLvlXp *= 1.2

func addXp(inputXP):
	currnet_xp += inputXP
	print(currnet_xp)
	if (currnet_xp >= nextLvlXp):
		levelUp()


func _on_xp_collider_add_xp(ammount):
	addXp(ammount)
