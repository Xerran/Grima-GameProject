/// @description Governs Player movement and actions every frame

/*
 * PLAYER MOVEMENT AND DIRECTIONALS
 */

// First we calculate Horizontal movement
if (x_dir != 0) {
	
	if (x_dir < 0) {
		if (!instance_place(x - curr_speed, y, obj_solid)) {
			hspeed = -curr_speed
		}
	}
	
	if (x_dir > 0) {
		if (!instance_place(x + curr_speed, y, obj_solid)) {
			hspeed = curr_speed
		}
	}
	
} else {
	hspeed = 0
}

// Next we calculate Vertical movement
if (y_dir != 0) {
	
	if (y_dir < 0) {
		if (!instance_place(x, y - curr_speed, obj_solid)) {
			vspeed = -curr_speed
		}
	}
	
	if (y_dir > 0) {
		if (!instance_place(x, y + curr_speed, obj_solid)) {
			vspeed = curr_speed
		}
	}
} else {
	vspeed = 0
}

// Now we determine where the Player is aiming for both the Gun object's direction and the Player
// sprite's direction
aim_dir = point_direction(x, y, mouse_x, mouse_y)

pl_gun.image_angle = aim_dir

// Now we shift the Player's X-scale and the Gun's Y-scale to fit with the Cursor's position, making
// the Gun and Player "face" the Cursor
if (aim_dir > 90 && aim_dir < 270) {
	image_xscale = -2
	pl_gun.image_yscale = -1
} else {
	image_xscale = 2
	pl_gun.image_yscale = 1
}

// This will give us where the tip of the Gun object is at all times, for Bullet-spawning purposes
var _gun_tip_x = pl_gun.x + (6 * pl_gun.image_yscale)
var _gun_tip_y = pl_gun.y - 1

// Finally, when the Player is invulnerable, we make them slightly see-through to signify they are
// invulnerable. If they are not invulnerable, we make the Player fully opaque again
if ( invulnerable ) {
	image_alpha = 0.5
} else { 
	image_alpha = 1
}

/*
 * PLAYER ACTIONS
 */

// Player's Ability to Shoot
if ( mouse_check_button(mb_left) ) {
	if ( can_shoot ) {
		can_shoot = false
		alarm[1] = fire_rate
		gun_distance = 5
		
		// Creates a new Bullet, setting its Speed and Direction
		var _bullet_instance = instance_create_layer( _gun_tip_x, _gun_tip_y, "Bullets", obj_bullet )
		with (_bullet_instance) {
			speed = other.bullet_speed
			direction = other.aim_dir
			image_angle = other.aim_dir
			owner_id = obj_player
		}
	}
}