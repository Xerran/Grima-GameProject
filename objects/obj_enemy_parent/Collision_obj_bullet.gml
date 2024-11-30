/// @description When hit by a Bullet, knocks enemy back, damages them, and determines if Enemy is now Dead

// Check to make sure Enemy is not already Dead
if ( state != STATES.DEAD ) {
	// Immediately cause the Path to end, and force it to recalculate
	path_end()

	// We make sure that the target is damaged first, before running logic based on its Current Health Points
	curr_hp -= other.damage

	// Knock back a little bit, but more than if hit with the sword
	var _dir = point_direction( other.x, other.y, x, y )
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
		
		// Finally, set the Enemy state to the Hurt state
		state = STATES.HURT
	
	// If they have 0 health or less, then we Destroy the Enemy instance
	} else {
		state = STATES.DEAD
		curr_hp = 0
		image_index = 0
	}
}