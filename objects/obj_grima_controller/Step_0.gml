/// @description Determines Grima Behaviors and Overlay Behaviors

/*
 * OVERLAY SECTION
 */

// First we give priority to the Player and the showing of the Overlay

// If we are already displaying the Overlay, then we allow the Player to interact with it
if ( show_overlay ) {
	
	// If the Player wishes to close the Overlay, then we close the Overlay
	if ( keyboard_check_pressed( ord( "C" ) ) ) {
		
		show_overlay = false
		
	}
	
// Otherwise, we are simply waiting for the Player to open the Overlay
} else {
	
	// If the Player wishes to open the Overlay, then we open the Overlay
	if ( keyboard_check_pressed( ord( "C" ) ) ) {
		
		show_overlay = true
		
	}
	
}


/*
 * GRIMA SECTION
 */
 
// Depending on Grima's current State, he will try to move closer to the Player,
// break through Blocked Windows, or Trap Windows

// However, none of this can happen if it is still the Prep Hour
if ( curr_hour != -1 ) {
	
	// All States depend on the Movement Timer to decide Grima's behaviors, so we 
	// will count it down no matter what
	move_timer--
	
	
	// We begin by determining Grima's current State
	switch ( state ) {
		
		// If Grima is in the Waiting state, he will attempt to pick a Room to approach
		case GRIMA.WAITING:
			
			// If the Movement Timer is less than/equal to 0, then it's time to attempt to 
			// approach a Room
			if ( move_timer <= 0 ) {
				
				// Our success depends on the current Movement Success Rate; in the case of 0,
				// our Movement was a success!
				if ( irandom( move_success_rate ) == 0 ) {
					
					// Let's randomly pick a Room to appear at
					curr_room = irandom_range( 1, 4 )
					
					// Let's also play a noise to let the Player know that Grima is approaching
					audio_play_sound( snd_grima_far, 1, false, 0.2, 0, 0.8 )
					
					// Finally, let's not forget to go to the Distant State
					state = GRIMA.DISTANT
					
				// Otherwise, we remain waiting
				} else {
					
					move_timer = aggression
					
				}
				
			}
			
		break;
		
		// If Grima is in the Distant state, he will either approach his current Room,
		// or move to an adjacent Room
		case GRIMA.DISTANT:
			
			// If the Movement Timer is less than/equal to 0, then it's time to make a Move
			if ( move_timer <= 0 ) {
				
				// Our success depends on the current Movement Success Rate; in the case of 0,
				// our Movement was a success!
				if ( irandom( move_success_rate ) == 0 ) {
					
					// In this case, we have two options - either approach a Room and go to
					// the Medium distance State, or Move to an adjacent Room and remain
					// in the Distant State
					
					// Let's flip a coin to see what we do - Heads we move to the Medium
					// distance State
					if ( irandom( 1 ) == 0 ) {
						
						// Let's play a noise to let the Player know that Grima is approaching
						audio_play_sound( snd_grima_medium, 1, false, 0.25, 0, 0.8 )
					
						// Finally, let's not forget to go to the Medium distance State
						state = GRIMA.MEDIUM
						
					// Tails, we switch to another Room
					} else {
						
						// Let's play a noise to let the Player know that Grima is switching
						// his Room
						audio_play_sound( snd_grima_laugh, 1, false, 0.25, 0, 0.7 )
					
						// Now we switch our Room depending on another coin flip and the Room
						// Grima is currently in
						var _switch = irandom( 1 )
						
						switch ( curr_room ) {
							
							// Case Room 1
							case tl_room:
								
								// If Heads, the Room to the Left
								if ( _switch == 0 ) {
									
									curr_room = tr_room
									
								// If Tails, the Room to the Right
								} else {
									
									curr_room = bl_room
									
								}
								
							break;
							
							// Case Room 2
							case tr_room:
								
								// If Heads, the Room to the Left
								if ( _switch == 0 ) {
									
									curr_room = br_room
									
								// If Tails, the Room to the Right
								} else {
									
									curr_room = tl_room
									
								}
								
							break;
							
							// Case Room 3
							case bl_room:
								
								// If Heads, the Room to the Left
								if ( _switch == 0 ) {
									
									curr_room = tl_room
									
								// If Tails, the Room to the Right
								} else {
									
									curr_room = br_room
									
								}
								
							break;
							
							// Case Room 4
							case br_room:
								
								// If Heads, the Room to the Left
								if ( _switch == 0 ) {
									
									curr_room = bl_room
									
								// If Tails, the Room to the Right
								} else {
									
									curr_room = tr_room
									
								}
								
							break;
							
						}
						
					}
					
					
				// Otherwise, we wait for another chance to make a Move
				} else {
					
					move_timer = aggression
					
				}
				
			}
			
		break;
		
		// If Grima is in the Medium distance state, he will attempt to keep approaching the
		// currently chosen Room
		case GRIMA.MEDIUM:
			
			// If the Movement Timer is less than/equal to 0, then it's time to attempt to 
			// approach a Room
			if ( move_timer <= 0 ) {
				
				// Our success depends on the current Movement Success Rate; in the case of 0,
				// our Movement was a success!
				if ( irandom( move_success_rate ) == 0 ) {
					
					// Let's  play a noise to let the Player know that Grima has fully
					// approached a Room
					audio_play_sound( snd_grima_close, 1, false, 0.3, 0, 0.8 )
					
					// Let's reset our Windows_Trapped count
					windows_trapped = 0
					
					// Finally, let's not forget to go to the Close State
					state = GRIMA.CLOSE
					
				// Otherwise, we wait for another chance to make a Move
				} else {
					
					move_timer = aggression
					
				}
				
			}
			
		break;
		
		// If Grima is in the Close state, he will attempt to break through Blocked Windows
		// and Trap Windows in his area
		case GRIMA.CLOSE:
			
			// If the Movement Timer is less than/equal to 0, then it's time to take an Action
			if ( move_timer <= 0 ) {
				
				// Our success depends on the current Movement Success Rate; in the case of 0,
				// our Action was a success!
				if ( irandom( move_success_rate ) == 0 ) {
					
					
					
				// Otherwise, we wait for another chance to take an Action
				} else {
					
					move_timer = aggression
					
				}
				
			}
			
		break;
		
	}
	
}

