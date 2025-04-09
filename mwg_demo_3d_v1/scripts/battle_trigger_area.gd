class_name BattleTriggerArea
extends Node3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	Battle.battle_factory(body)
	#get_tree().change_scene_to_file("res://scens/battle.tscn")
