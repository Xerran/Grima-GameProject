/// @description When hit by the Sword, knocks enemy back, damages them, and determines if Enemy is now Dead

// Check to make sure Enemy is not already Dead, or hasn't already taken Damage
if ( state != STATES.DEAD and !hit_with_sword ) {
	
	// Immediately cause the Path to end, and force it to recalculate
	path_end()

	// We make sure that the target is damaged first, before running logic based on its Current Health Points
	curr_hp -= other.damage
	
	// Enable Alarm[2] so that the Enemy can flash Red for a moment
	alarm[ 2 ] = 3

	// Knock back a little bit, but more than if hit with the Sword
	var _dir = point_direction( obj_player.x, obj_player.y, x, y )
	hsp += lengthdir_x( other.knockback_dis, _dir )
	vsp += lengthdir_y( other.knockback_dis, _dir )

	// If the Enemy has more than 0 health, then we only damage them
	if ( curr_hp > 0 ) {
		
		// The Enemy is now immediately aware of and Hunting the Player
		hunting = true
	
		// Set a small delay where the Enemy is now knocked back, and needs a moment to recalculate a Path
		path_timer = other.knockback_time
	
		// Set the hurt_timer to the Knockback Time
		hurt_timer = other.knockback_time
		
		// They have been damaged once by the Sword already, so they can't again by that instance
		hit_with_sword = true
		alarm[ 1 ] = game_get_speed( gamespeed_fps )
		
		// Finally, set the Enemy state to the Hurt state
		state = STATES.HURT
	
	// If they have 0 health or less, then we Destroy the Enemy instance
	} else {
		
		state = STATES.DEAD
		curr_hp = 0
		image_index = 0
		
	}
}