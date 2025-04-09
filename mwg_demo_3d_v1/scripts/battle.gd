class_name Battle
extends Node

@export var playerCharicters : PlayerCharacter
const BATTLE_SCEN = preload("res://scens/battle.tscn")

##	Returns a new isntance of a Battle class. If you are ready to switch to the 
##	Battle class the use get_tree().change_scene_to_packed()
##
static func battle_factory(playerCharicters : PlayerCharacter)-> Battle:
	#whitch to the battle scneen
	var newBatter= BATTLE_SCEN.instantiate()
	newBatter.playerCharicters=playerCharicters
	return newBatter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
