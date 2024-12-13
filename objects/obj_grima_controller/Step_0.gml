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
	
	// Does the Player wish to repel Grima with a Flash?
	if ( keyboard_check_pressed( ord( "F" ) ) && can_flash ) {
		
		// Set can_flash to false
		can_flash = false
		
		// Set the Flash effect timer for the drawing
		alarm[ 0 ] = flash_effect_timer
		
		// Set the Flash recharge timer 
		flash_timer = 0
		
		// Now we check if this actually had any effect on Grima depending on his State
		switch ( state ) {
			
			// In case of Medium State - Grima is forced back to the Waiting State
			case GRIMA.MEDIUM:
				
				state = GRIMA.WAITING
				curr_room = 0
				move_timer = aggression
				
				// Also, play the Grima_Laugh sound - Player should have waited
				audio_play_sound( snd_grima_laugh, 1, false, 0.25, 0, 0.7 )
				
			break;
			
			// In case of Close State - Grima is forced back to the Waiting State, but
			// with a longer Movement Timer
			case GRIMA.CLOSE:
				
				state = GRIMA.WAITING
				curr_room = 0
				move_timer = aggression * 2
				
				// Also, play the Grima_Hurt sound - Player really showed Grima!
				audio_play_sound( snd_grima_hurt, 1, false, 0.25, 0, 0.7 )
				
			break;
			
		}
		
	}
	
	// Check the Keyboard to see if Player wants to switch Cameras that way
	if ( keyboard_check_pressed( vk_numpad1 ) or keyboard_check_pressed( ord( "1" ) ) ) {
		
		curr_camera = 1
		
	}
	
	if ( keyboard_check_pressed( vk_numpad2 ) or keyboard_check_pressed( ord( "2" ) ) ) {
		
		curr_camera = 2
		
	}
	
	if ( keyboard_check_pressed( vk_numpad3 ) or keyboard_check_pressed( ord( "3" ) ) ) {
		
		curr_camera = 3
		
	}
	
	if ( keyboard_check_pressed( vk_numpad1 ) or keyboard_check_pressed( ord( "4" ) ) ) {
		
		curr_camera = 4
		
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
					
				
				} 
				
				// Regardless of success or failure, we reset the Movement Timer
				move_timer = aggression
				
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
				
				} 
				
				// Regardless of success or failure, we reset the Movement Timer
				move_timer = aggression
				
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
					
					// Let's reset our Windows_Count
					windows_count = 0
					
					// We also reset the move_timer
					move_timer = aggression
					
					// Finally, let's not forget to go to the Close State
					state = GRIMA.CLOSE
					
				} 
				
				
				// Regardless of success or failure, we reset the Movement Timer
				move_timer = aggression
				
			}
			
		break;
		
		// If Grima is in the Close state, he will attempt to break through Blocked Windows
		// and Trap Windows in his area
		case GRIMA.CLOSE:
			
			// If the Movement Timer is less than/equal to 0, then it's time to take an Action
			if ( move_timer <= 0 ) {
				
				// Our success depends on the current Movement Success Rate; in the case of 0,
				// our Action was a success!
				if ( irandom( move_success_rate ) == 0 && !no_valid_target ) {
					
					// The state of our current Window will determine our Action
					switch ( curr_window.state ) {
						
						// In case the Window is Blocked
						case WINDOW.BLOCKED:
							
							// Destroy the Block, and instantly Trap the Window
							curr_window.state = WINDOW.TRAPPED
							
							// Let's also play a sound to signal that the Window is being Damaged
							switch( irandom( 1 ) ) {
				
								// Window Damage Sound 1
								case 0:
					
									// We only want nearby Players to hear this
									if ( curr_window.player_distance < 500 ) {
						
										// Set the gain to grow louder the closer the Player is
										var _gain = ( 500 - curr_window.player_distance ) / 500
						
										audio_play_sound_at( snd_window_damage1, curr_window.x, curr_window.y, 0, 50, 240, _gain, false, 1)
						
									}
				
								break;
				
								// Window Damage Sound 2
								case 1:
				
									// We only want nearby Players to hear this
									if ( curr_window.player_distance < 500 ) {
						
										// Set the gain to grow louder the closer the Player is
										var _gain = ( 500 - curr_window.player_distance ) / 500
						
										audio_play_sound_at( snd_window_damage2, curr_window.x, curr_window.y, 0, 50, 240, _gain, false, 1)
						
									}
				
								break;
				
							}
						
						// In case the Window is Open
						case WINDOW.TRAPPED:
							
							// We simply change the Window State to Trapped
							curr_window.state = WINDOW.TRAPPED
							
						break;
						
					}
					
					
				// If there is no valid target for Grima in his current Room, then
				// Grima will return to the Distant State in the next sequential Room
				} else if ( no_valid_target ) {
					
					// Let's play a noise to let the Player know that Grima is switching
					// his Room
					audio_play_sound( snd_grima_laugh, 1, false, 0.25, 0, 0.7 )
					
					state = GRIMA.DISTANT
					
					// If the current Room's ID is 4 (for the Bottom Right Room), Grima goes to the
					// Top Left Room
					if ( curr_room++ > br_room ) {
						
						curr_room = tl_room
						
					}
					
					// Also reset our No_Valid_Target to false
					no_valid_target = false
				
				} 
				
				// Regardless of success or failure, we reset the Movement Timer
				move_timer = aggression
				
			}
			
		break;
		
	}
	
}

