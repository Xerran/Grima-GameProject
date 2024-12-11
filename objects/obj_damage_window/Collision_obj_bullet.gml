/// @description Upon collision with Bullet, "damages" Window

// Only damages Window if it exists
if ( instance_exists( my_window ) ) {
	
	// Only damages Window if it is in the proper state
	
	// In this case, the Engaged state
	if ( my_window.state == WINDOW.ENGAGED ) {
		
		my_window.state = WINDOW.BLOCKED
		my_window.player_damaged = true
		my_window.alarm[ 0 ] = my_window.flash_timer
		
		// Also, let's play a random Zombie damage sound
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
		
	// In this case, the Trapped state
	} else if ( my_window.state == WINDOW.TRAPPED ) {
		
		my_window.state = WINDOW.OPEN
		my_window.player_damaged = true
		my_window.alarm[ 0 ] = my_window.flash_timer
		
	}
	
	
}
