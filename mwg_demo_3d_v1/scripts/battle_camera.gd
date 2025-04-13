extends Camera3D

func shoot_rey() ->Vector3i:
	var mouse_pos= get_viewport().get_mouse_position()
	var rey_leght= 1000
	var from = project_ray_origin(mouse_pos)
	var to =from +project_ray_normal(mouse_pos) * rey_leght
	var space = get_world_3d().direct_space_state
	var rey_query= PhysicsRayQueryParameters3D.new()
	rey_query.from=from
	rey_query.to=to
	var rey_cast_result=  space.intersect_ray(rey_query)
	if(rey_cast_result=={}):
		return Vector3i(-100,-100,-100)
	if rey_cast_result.position.y <1:
		print("y<1")
		rey_cast_result.position.y=1
	return rey_cast_result.position

func center_on_grid(wight:int, lenght:int) ->void:
	var pos=Vector3(lenght/2,10,-1)
	print("center pos "+str(pos))
	print("Rotation "+str(self.rotation))
	#transform.basis= Basis(pos,0)
	#self.position=pos
	transform.origin=pos

func rotate_around_center_of_grid():
	pass
