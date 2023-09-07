extends Node3D

var direction = Vector3.FORWARD
@export var smooth_speed = 2.5
#var smooth_speed = 2.5
func _physics_process(delta):
	var current_velocity = get_parent().linear_velocity
	current_velocity.y = 0
	if current_velocity.length_squared() > 1:
		direction = lerp(direction, -current_velocity.normalized(), smooth_speed*delta)
	#set the roation of this camera pivot to the point in the direction vector
	#problem? its a vector and we need a rotation(basis)
	global_transform.basis = get_roation_from_direction(direction)
	

#Takes in Vector then returns Bassis(roation)
func get_roation_from_direction(look_direction : Vector3) -> Basis:
	look_direction = look_direction.normalized()
	var x_axis = look_direction.cross(Vector3.UP)
	return Basis(x_axis, Vector3.UP, -look_direction)
