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
	image_xscale = -facing
	pl_gun.image_yscale = -1
} else {
	image_xscale = facing
	pl_gun.image_yscale = 1
}

// This will give us where the tip of the Gun object is at all times, for Bullet-spawning purposes
var _gun_tip_x = pl_gun.x + (6 * pl_gun.image_yscale)
var _gun_tip_y = pl_gun.y - 1

// Here, we will set the current position of the Light following the Player
light_set_position( my_light, x, y )


/*
 *
 ********************
 *                  *
 *  PLAYER ACTIONS  *
 *                  *
 ********************
 *
 */
 
/*
 * DASH CODE
 */

// First we check to make sure the Player is not already Dashing, and if they are pressing
// the Space button
if ( keyboard_check_pressed( vk_space ) and !is_dashing and can_dash ) {
	
	// First off, a Dash is only allowable if the Player is already moving, so
	// we must make sure they are already moving in at least one direction
	if ( x_dir != 0 or y_dir != 0 ) {
		
		// If Stamina is above 0, then we can allow a Dash
		if ( stamina > 0 ) {
		
			// Set all appropriate variables for using the Dash action
			is_dashing = true
			curr_speed = dash_speed
			stamina -= dash_cost
			dash_time = dash_limit
			invulnerable = true
			
			// Ensure that Stamina cannot recover while in a Dash
			stamina_shock = true
		
			// Now we get the direction and distance we're moving while Dashing
			dash_dir_x = x_dir
			dash_dir_y = y_dir
			
			// Initialize our Dash array for use in the Dash action
			dash_array = []
	
		}
		
	}

// If the Player is already Dashing, then we do our Dashing things
} else if ( is_dashing ) {
	
	// Adds a slight afterimage of the Player to make it appear like they are moving quickly
	array_push( dash_array, { x : x, y : y, image_alpha: 0.75 } )
	
	// Have we dashed for our entire limit?
	if ( dash_time-- < 0 ) {
		is_dashing = false
		can_dash = false
		invulnerable = false
		curr_speed = move_speed
		alarm[3] = game_get_speed( gamespeed_fps )
		image_index = 2
		
		// If subtracting dash_cost from Stamina causes Stamina to go below 0,
		// make Stamina equal 0 and have a higher Stamina Shock timer
		if ( stamina < 0 ) {
		
			stamina = 0
			alarm[0] = game_get_speed( gamespeed_fps ) * 2
		
		// Otherwise we still initiate Stamina Shock, but with a lower timer
		} else {
			
			alarm[0] = game_get_speed(gamespeed_fps)
			
		}
	}
}

/*
 * GUN CODE
 */

// We check if the Player has pressed the Mouse button, as well as make sure
// they are not in the middle of a Dash
if ( mouse_check_button(mb_left) and !is_dashing ) {
	if ( can_shoot && bullets > 0 ) {
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
		
		// Subtract a bullet from the Player's current amount
		bullets--
	}
}