extends Node

var xp:=0
signal leveled_up


func _on_timer_timeout() -> void:
	xp+=5
	print("ex: "+str(xp))
	if xp>=20:
		xp=0
		leveled_up.emit()


func _on_leveled_up() -> void:
	print("Ding")
