/// @description When hit by a Bullet, knocks enemy back, damages them, and determines if Enemy is now Dead

// Check to make sure Enemy is not already Dead
if ( state != STATES.DEAD ) {
	
	// Immediately cause the Path to end, and force it to recalculate
	path_end()

	// We make sure that the target is damaged first, before running logic based on its Current Health Points
	curr_hp -= other.damage
	
	// Enable Alarm[2] so that the Enemy can flash Red for a moment
	alarm[ 2 ] = 3

	// Knock back a little bit, but more than if hit with the Sword
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
		
		// Also play a Sound depending on the type of Enemy
		switch ( enemy_id ) {
			
			// In case it's a Zombie
			case 1:
				
				// We have 2 sounds, let's pick one randomly
				switch ( irandom( 1 ) ) {
					
					// Zombie Hurt Sound 1
					case 0:
						
						// We only want nearby Players to hear this
						audio_play_sound_at( snd_zombie_hurt1, x, y, 0, 50, 160, 1, false, 1, 0.5 )
						
					break;
					
					// Zombie Hurt Sound 2
					case 1:
					
						// We only want nearby Players to hear this
						audio_play_sound_at( snd_zombie_hurt2, x, y, 0, 50, 160, 1, false, 1, 0.5 )
						
					break;
				}
			
			break;
			
			// In case it's a Cultist
			case 2:
			
				// We only want nearby Players to hear this
				audio_play_sound_at( snd_cultist_hurt, x, y, 0, 50, 160, 1, false, 1, 0.5 )
			
			break;
			
		}
	
	// If they have 0 health or less, then we Destroy the Enemy instance
	} else {
		
		state = STATES.DEAD
		curr_hp = 0
		image_index = 0
		
		// Also play a Sound depending on the type of Enemy
		switch ( enemy_id ) {
			
			// In case it's a Zombie
			case 1:
				
				// We have 2 sounds, let's pick one randomly
				switch ( irandom( 1 ) ) {
					
					// Zombie Death Sound 1
					case 0:
						
						// We only want nearby Players to hear this
						audio_play_sound_at( snd_zombie_death1, x, y, 0, 50, 160, 1, false, 1, 0.5 )
						
					break;
					
					// Zombie Death Sound 2
					case 1:
					
						// We only want nearby Players to hear this
						audio_play_sound_at( snd_zombie_death2, x, y, 0, 50, 160, 1, false, 1, 0.5 )
						
					break;
				}
			
			break;
			
			// In case it's a Cultist
			case 2:
			
				// We only want nearby Players to hear this
				audio_play_sound_at( snd_cultist_death, x, y, 0, 50, 160, 1, false, 1, 0.5 )
			
			break;
			
		}
		
	}
	
}