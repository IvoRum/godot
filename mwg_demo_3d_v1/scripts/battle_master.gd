class_name BattleMaster
extends Node

@export var playerCharicters : PlayerCharacter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerCharicters.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


static func _create_simple_grid( leght:int, wihgt:int, level: int)-> Array[Vector3i]:
	var created_map: Array[Vector3i]
	for x in leght:
		for z in wihgt:
			created_map.append(Vector3i(x,level,z))
	return created_map
