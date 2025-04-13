class_name WordMaster
extends Node

var grassScen=load("res://scens/grass_tile.tscn")
var castel=load("res://scens/castle.tscn")
@onready var camera_3d: Camera3D = $"../Camera3D"

var word={
	Vector3(0,0,-1):grassScen,
	Vector3(0,0,-2):grassScen,
	Vector3(0,0,-3):grassScen,
	Vector3(1,0,-1):grassScen,
	Vector3(1,0,-2):grassScen,
	Vector3(1,0,-3):grassScen,
	Vector3(2,0,-1):grassScen,
	Vector3(2,0,-2):grassScen,
	Vector3(2,0,-3):grassScen,
	Vector3(1,1,-2):castel,
	Vector3(3,0,-1):grassScen,
	Vector3(3,0,-2):grassScen,
	Vector3(3,0,-3):grassScen,
	Vector3(4,0,-1):grassScen,
	Vector3(4,0,-2):grassScen,
	Vector3(4,0,-3):grassScen,
	Vector3(-1,0,-1):grassScen,
	Vector3(-1,0,-2):grassScen,
	Vector3(-1,0,-3):grassScen,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grassScen
	for position in word:
		if word[position]==castel:
			print("castel found")
			camera_3d.global_position=Vector3(1,5.5,4)
			print("Camera global position "+str(camera_3d.global_position))
		var tile=word[position].instantiate()
		tile.transform.origin=position
		add_child(tile);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
