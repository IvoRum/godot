extends Node

signal health_changed(new_heath)

var heath:=100:
	set(value):
		heath=clamp(value,0,100)
		health_changed.emit(heath)

# Mnogo silno za calculirane na mnogo addons kum dadena magiq
var chance :=0.2
var chance_pct: int:
	get:
		return chance * 100

func _ready() -> void:
	heath=-100

func _on_health_changed(new_heath: Variant) -> void:
	print("new health"+str(new_heath))
