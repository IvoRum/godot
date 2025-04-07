class_name Character
extends Node

@export var profetion:String
@export var health: int

func die():
	health=0
	print(profetion+ " died.")

class Equipment:
	var armor:=10
	var wight:=5
