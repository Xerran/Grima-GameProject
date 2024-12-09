/// @description Determines directionality of Player movement, and Sprinting

/*
 * MOVEMENT CODE
 */

// If we are not Dashing, then we will check for our Player's current intended movement directions
if ( !is_dashing ) {
	
	// First we determine the directionality of the Player's horizontal movement
	// We'll be allowing for both Arrow Key-based movement and WASD-based movement
	right_x = (keyboard_check(ord("D")) + keyboard_check(vk_right))
	left_x = (keyboard_check(ord("A")) + keyboard_check(vk_left))

	x_dir = right_x - left_x // This is our sum of the X-axis directional inputs

	// Next, we determine the directionality of the Player's vertical movement
	// We'll be allowing for both Arrow Key-based movement and WASD-based movement
	down_y = (keyboard_check(ord("S")) + keyboard_check(vk_down))
	up_y = (keyboard_check(ord("W")) + keyboard_check(vk_up))

	y_dir = down_y - up_y // This is our sum of the Y-axis directional inputs

// Otherwise, if we are Dashing, we lock our directionality to the Dash directional variables
} else {
	
	x_dir = dash_dir_x
	y_dir = dash_dir_y
	
}

/*
 * SPRINTING CODE
 */
 
// This section determines if the Player is currently sprinting, as well as if they able to sprint.
// If a Player is not sprinting, an alarm is set. Afterwards, the Player's stamina will recover

// First we check that the Player is not currently Dashing, disallowing all Sprinting actions
// if the Player is in the middle of a Dash
if ( !is_dashing ) {
	
	// If a player is not Sprinting, and starts, then we check if their stamina is above 0
	// and then let them Sprint
	if ( keyboard_check( vk_shift ) and !is_sprinting ) {
		if ( stamina > 0 ) {
		
			is_sprinting = true
			curr_speed = sprint_speed
			stamina -= stamina_drain
		
		}

	// If player is already Sprinting and keeps Sprinting, we let them do so until Stamina is at
	// or below 0
	} else if ( keyboard_check( vk_shift ) and is_sprinting and !is_dashing ) {
		if ( stamina > 0 ) {
		
			curr_speed = sprint_speed
			stamina -= stamina_drain
		
		} else {
		
			stamina = 0
			is_sprinting = false
			curr_speed = move_speed
			stamina_shock = true
			alarm[0] = game_get_speed( gamespeed_fps ) * 2
		
		}

	// If the Player is already Sprinting, but stops pressing Shift, then we reset the Player
	// to a normal movement speed
	} else if ( !keyboard_check( vk_shift ) and is_sprinting ) {
	
		curr_speed = move_speed
		is_sprinting = false
		stamina_shock = true
		alarm[0] = game_get_speed( gamespeed_fps )

	// If the Player is not Sprinting and their Stamina is ready to recover, then we let it recover
	} else if ( !keyboard_check( vk_shift ) and !is_sprinting and !stamina_shock ) {
	
		if ( stamina < stamina_max ) {
			
			stamina += stamina_recovery
			
		}
		
	}
	
}

/*
 * SPRITE CODE
 */


// Now we determine what the Player's sprite should be based on our inputs
// If they aren't moving, then they are Idle
if ( x_dir == 0 && y_dir == 0 ) {
	
	sprite_index = spr_player_idle
	
// If they are moving, they are either running or walking
} else {
	
	// In case they are Sprinting, we use the Running sprite
	if ( is_sprinting ) {
		
		sprite_index = spr_player_running
		
	// Otherwise, they are Walking
	} else {
		
		sprite_index = spr_player_walking
		
	}
	
}
