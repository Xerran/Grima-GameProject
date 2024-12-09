/// @description Governs Gun and Sword movement

// If we aren't in the middle of a Sword attack, then we worry about Gun values
if ( !is_swinging ) {
	
	// Reset the image_alpha
	pl_gun.image_alpha = 1
	
	// Sets Gun to be in front of the Player
	pl_gun.depth = depth - 1

	// Sets the Gun X and Y to be equal to the Player X and Y, but with a small gap so as to allow it to
	// rotate around the Player in a circle
	pl_gun.x = x + lengthdir_x( gun_distance, aim_dir )
	pl_gun.y = y + lengthdir_y( gun_distance, aim_dir )

	// Returns Gun distance to 10 pixels from Player over time after it has been fired
	gun_distance = lerp( gun_distance, 15, 0.1 )

// If we are in the middle of a Sword attack, then we worry about Sword values
} else {
	
	// Set the image_alpha of the gun to 0, making it disappear for now
	pl_gun.image_alpha = 0
	
	// Sets the image_angle of the Sword - this is crucial to the Sword's "swing" motion,
	// and thus crucial to the execution of the attack
	if ( curr_offset > -sword_offset ) {
		
		// Change the current offset of the Sword's Angle
		curr_offset -= offset_change
		
		// Change the Image_Angle in accordance with our offset change
		pl_sword.image_angle = orig_dir - curr_offset
		
		// Sets depth of the Sword depending on angle in reference to the player
		// If it is above the Player, then set it behind the Player sprite
		if ( pl_sword.y < y ) {
		
			pl_sword.depth = depth + 1
		
		// If it is below the Player, then it is set in front of the Player sprite
		} else {
		
			pl_sword.depth = depth - 1
		
		}
	
		// Sets the Sword X and Y to be equal to the Player X and Y, but with a small gap so as to allow it to
		// rotate around the Player in a circle
		pl_sword.x = x + lengthdir_x( sword_distance, orig_dir - curr_offset )
		pl_sword.y = y + lengthdir_y( sword_distance, orig_dir - curr_offset )
	
	// If we exceed the offset in the opposite direction, it means we have finished our Swing,
	// and can return things to normal
	} else {
		
		// Reset all necessary variables
		is_swinging = false
		instance_destroy( pl_sword )
		curr_offset = sword_offset
		
		// Once the Sword Swing is done, we give the ability to Swing again after a short time
		can_swing = false
		alarm[ 4 ] = game_get_speed( gamespeed_fps ) * 0.5
		
		// Regarding Stamina Shock, if the Player caused Stamina to go below 0,
		// the timer will be longer
		if ( stamina <= 0 ) {
			
			alarm[ 0 ] = game_get_speed( gamespeed_fps ) * 2
			
		// Otherwise, normal timer
		} else {
			
			alarm[ 0 ] = game_get_speed( gamespeed_fps )
			
		}
		
	}
	
	
	
	
}