extends Node

@onready var camera_3d: Camera3D = $Camera3D
@onready var grid_map: GridMap = $GridMap

enum camera_pos_states {left,rigth,up,down}
var battle_camera_pos_stat

var grid_lenght=20
var grid_wight=20
var grid_center=Vector3(grid_lenght/2,0,grid_wight/2)
var spacing=1
var camera_hight=10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(grid_map.get_navigation_map())
	camera_3d.center_on_grid(grid_wight,grid_lenght)
	var simple_grid:Array[Vector3i] = BattleMaster._create_simple_grid(grid_lenght,grid_wight,0)
	for pos in simple_grid:
		grid_map.set_cell_item(pos,0,0)
	battle_camera_pos_stat=camera_pos_states.down

func _input(event) -> void:
	var vec_right= Vector3(-spacing,camera_hight,grid_wight/2)
	var vec_up= Vector3(grid_lenght/2,camera_hight,grid_wight + spacing)
	var vec_left= Vector3(grid_lenght +spacing ,camera_hight,grid_wight/2)
	var vec_down= Vector3(grid_lenght/2 ,camera_hight,-spacing)
	
	if event.is_action_pressed("click"):
		var pos=camera_3d.shoot_rey()
		print(pos)
		if !(pos == Vector3i(-100,-100,-100)):
			grid_map.set_cell_item(pos,1,0)
	if event.is_action_pressed("rotate_right"):
		match battle_camera_pos_stat:
			camera_pos_states.down:
				_rotate_and_look_battle_camera(vec_right,grid_center,camera_pos_states.rigth)
			camera_pos_states.rigth:
				_rotate_and_look_battle_camera(vec_up,grid_center,camera_pos_states.up)
			camera_pos_states.up:
				_rotate_and_look_battle_camera(vec_left,grid_center,camera_pos_states.left)
			camera_pos_states.left:
				_rotate_and_look_battle_camera(vec_down,grid_center,camera_pos_states.down)
	if event.is_action_pressed("rotate_left"):
		match battle_camera_pos_stat:
			camera_pos_states.down:
				_rotate_and_look_battle_camera(vec_left,grid_center,camera_pos_states.left)
			camera_pos_states.left:
				_rotate_and_look_battle_camera(vec_up,grid_center,camera_pos_states.up)
			camera_pos_states.up:
				_rotate_and_look_battle_camera(vec_right,grid_center,camera_pos_states.rigth)
			camera_pos_states.rigth:
				_rotate_and_look_battle_camera(vec_down,grid_center,camera_pos_states.down)

func _rotate_and_look_battle_camera(move_to:Vector3,look_at:Vector3,new_state: camera_pos_states) -> void:
	camera_3d.look_at_from_position(move_to,look_at,Vector3.UP)
	battle_camera_pos_stat=new_state
	print(battle_camera_pos_stat)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	# нещо такова за вземане на позицията ма мишката ама това е 2д
	# var hover_over_tile = grid_map.local_to_map(get_global_mouse_position())
	
