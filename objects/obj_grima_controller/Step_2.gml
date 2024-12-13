/// @description Checks for a Valid Target in the current Room

// We only want to check if we are currently Close to a Room
if ( state = GRIMA.CLOSE ) {
	
	// Depending on our current Room, we'll check different Windows -
	// this Switch statement determines which room we're currently Close to
	switch ( curr_room ) {
					
		// In case of Room 1
		case tl_room:
		
			// Make sure our windows_total is set correctly
			windows_total = 2
						
			// Let's randomly pick a Window to Attack
			target = irandom( windows_total - 1 )
			curr_window = tl_array[ target ]
						
			// Let's also make sure this Window is a valid target
			if ( curr_window.state == WINDOW.OPEN or curr_window.state == WINDOW.BLOCKED ) {
								
				curr_window = tl_array[ target ] 
								
			// If it isn't, let's pick another Window
			} else {
								
				// If we targeted the first Window, we now target the second Window
				if ( target == 0 ) {
									
					curr_window = tl_window_2
									
					// Let's also check if this is a valid target
					if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
						// If it isn't, there aren't any valid targets for Grima
						no_valid_target = true
									
					}
									
				// If we targeted the second Window, we now target the first Window
				} else {
									
					curr_window = tl_window_1
								
					// Let's also check if this is a valid target
					if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
						// If it isn't, there aren't any valid targets for Grima
						no_valid_target = true
									
					}
									
				}
								
			}
						
		break;
					
					
		// In case of Room 2
		case tr_room:
		
			// Make sure our windows_total is set correctly
			windows_total = 2
		
			// Let's randomly pick a Window to Attack
			target = irandom( windows_total - 1 )
			curr_window = tr_array[ target ]
						
			// Let's also make sure this Window is a valid target
			if ( curr_window.state == WINDOW.OPEN or curr_window.state == WINDOW.BLOCKED ) {
								
				curr_window = tr_array[ target ] 
								
			// If it isn't, let's pick another Window
			} else {
								
				// If we targeted the first Window, we now target the second Window
				if ( target == 0 ) {
									
					curr_window = tr_window_2
									
					// Let's also check if this is a valid target
					if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
						// If it isn't, there aren't any valid targets for Grima
						no_valid_target = true
									
					}
									
				// If we targeted the second Window, we now target the first Window
				} else {
									
					curr_window = tr_window_1
								
					// Let's also check if this is a valid target
					if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
						// If it isn't, there aren't any valid targets for Grima
						no_valid_target = true
									
					}
									
				}
								
			}
		
		break;
					
		// In case of Room 3
		case bl_room:
		
			// Make sure our windows_total is set correctly
			windows_total = 3
			
			// Let's randomly pick a Window to Attack
			target = irandom( windows_total - 1 )
			curr_window = bl_array[ target ]
						
			// Let's also make sure this Window is a valid target
			if ( curr_window.state == WINDOW.OPEN or curr_window.state == WINDOW.BLOCKED ) {
								
				curr_window = bl_array[ target ] 
								
			// If it isn't, let's pick another Window
			} else {
								
				// If we targeted the first Window, we now target either the second or the third
				if ( target == 0 ) {
								
					// We first give priority to the second Window
					curr_window = bl_window_2
									
					// Let's also check if this is a valid target
					if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
						// Let's check the third Window then
						curr_window = bl_window_3
								
						// Let's also check if this is a valid target
						if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
							// If it isn't, there aren't any valid targets for Grima
							no_valid_target = true
									
						}
									
					}
									
				// If we targeted the second Window, we now target either the first or the third
				} else if ( target == 1 ) {
								
					// We give priority to the third Window
					curr_window = bl_window_3
								
					// Let's also check if this is a valid target
					if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
						// Let's check the first Window then
						curr_window = bl_window_1
								
						// Let's also check if this is a valid target
						if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
							// If it isn't, there aren't any valid targets for Grima
							no_valid_target = true
									
						}
									
					}
						
				// If we targeted the third Window, we now target either the first or the second
				} else {
					
					// We give priority to the first Window
					curr_window = bl_window_1
								
					// Let's also check if this is a valid target
					if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
						// Let's check the first Window then
						curr_window = bl_window_2
								
						// Let's also check if this is a valid target
						if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
							// If it isn't, there aren't any valid targets for Grima
							no_valid_target = true
									
						}
									
					}
					
				}
								
			}
		
		break;
					
		// In case of Room 4
		case br_room:
		
			// Make sure our windows_total is set correctly
			windows_total = 3
		
			// Let's randomly pick a Window to Attack
			target = irandom( windows_total - 1 )
			curr_window = br_array[ target ]
						
			// Let's also make sure this Window is a valid target
			if ( curr_window.state == WINDOW.OPEN or curr_window.state == WINDOW.BLOCKED ) {
								
				curr_window = br_array[ target ] 
								
			// If it isn't, let's pick another Window
			} else {
								
				// If we targeted the first Window, we now target either the second or the third
				if ( target == 0 ) {
								
					// We first give priority to the second Window
					curr_window = br_window_2
									
					// Let's also check if this is a valid target
					if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
						// Let's check the third Window then
						curr_window = br_window_3
								
						// Let's also check if this is a valid target
						if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
							// If it isn't, there aren't any valid targets for Grima
							no_valid_target = true
									
						}
									
					}
									
				// If we targeted the second Window, we now target either the first or the third
				} else if ( target == 1 ) {
								
					// We give priority to the third Window
					curr_window = br_window_3
								
					// Let's also check if this is a valid target
					if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
						// Let's check the first Window then
						curr_window = br_window_1
								
						// Let's also check if this is a valid target
						if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
							// If it isn't, there aren't any valid targets for Grima
							no_valid_target = true
									
						}
									
					}
						
				// If we targeted the third Window, we now target either the first or the second
				} else {
					
					// We give priority to the first Window
					curr_window = br_window_1
								
					// Let's also check if this is a valid target
					if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
						// Let's check the first Window then
						curr_window = br_window_2
								
						// Let's also check if this is a valid target
						if ( curr_window.state != WINDOW.OPEN and curr_window.state != WINDOW.BLOCKED ) {
									
							// If it isn't, there aren't any valid targets for Grima
							no_valid_target = true
									
						}
									
					}
					
				}
								
			}
		
		break;
					
	}

}