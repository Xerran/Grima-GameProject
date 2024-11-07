/// @description Governs Player movement and actions every frame
// You can write your code in this editor


if (x_dir != 0) {
	
	if (x_dir < 0) {
		if (!instance_place(x - curr_speed, y, obj_placeholder)) {
			hspeed = -curr_speed
		}
	}
	
	if (x_dir > 0) {
		if (!instance_place(x + curr_speed, y, obj_placeholder)) {
			hspeed = curr_speed
		}
	}
	
} else {
	hspeed = 0
}

if (y_dir != 0) {
	
	if (y_dir < 0) {
		if (!instance_place(x, y - curr_speed, obj_placeholder)) {
			vspeed = -curr_speed
		}
	}
	
	if (y_dir > 0) {
		if (!instance_place(x, y + curr_speed, obj_placeholder)) {
			vspeed = curr_speed
		}
	}
} else {
	vspeed = 0
}



image_angle = point_direction(x, y, mouse_x, mouse_y);