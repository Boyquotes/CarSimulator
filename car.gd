extends VehicleBody3D

var max_rpm = 500
var max_torque = 200
func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("right", "left") * 0.4, 5 * delta);
	var acceleration = Input.get_axis("back", "forward");
	var rpm = abs($back_left_wheel.get_rpm())
	$back_left_wheel.engine_force = acceleration * max_torque * ( 1 - rpm / max_rpm)
	rpm = abs($back_left_wheel.get_rpm())
	$back_right_wheel.engine_force = acceleration * max_torque * ( 1 - rpm / max_rpm)
	
	
	
