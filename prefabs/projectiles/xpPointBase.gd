extends Node2D

func spawn(min, max):
	get_node("CharacterBody2D").spawn(min, max)
