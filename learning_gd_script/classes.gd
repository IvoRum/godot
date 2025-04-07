extends Node

@export var character_to_kill:Character

func _ready() -> void:
	character_to_kill.die()
