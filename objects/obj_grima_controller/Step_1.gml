/// @description Determines current Sprite, Overlay Position, and Variable values

// At the beginning of the step, we set all of the variables in accordance with the current
// parallel variables held by obj_game

// We only want to do this if they have been changed, so we check if the Hour has changed
if ( curr_hour != obj_game.curr_hour ) {
	
	// Set the new current Hour
	curr_hour = obj_game.curr_hour
	
	// Set our variables to the new values
	aggression = obj_game.curr_aggression
	move_success_rate = obj_game.curr_move_success
	
}

/*
 * OVERLAY POSITION SECTION
 */ 
 
// Update current X and Y to be at the center of the view
x = camera_get_view_x( camera_id ) + ( camera_get_view_width( camera_id ) / 2 )
y = camera_get_view_y( camera_id ) + ( camera_get_view_height( camera_id ) / 2 )



/*
 *	SPRITE CHANGE SECTION
 */

// Here we determine what Sprite to display to the Player depending on the current Camera
// they wish to look through, and the current state of Grima. We also use this opportunity to
// assert the total number of Windows in a Room.

// First, we determine the Camera
switch ( curr_camera ) {
	
	// In case of Room 1 - the Top Left Room/Camera
	case tl_room:
		
		// Now we check the current Room that Grima is in against this Room
		if ( curr_room == tl_room ) {
			
			// Set the total number of Windows for this Room
			windows_total = 2
			
			// Depending on Grima's current State, we will show a number of different Sprites
			switch ( state ) {
				
				// In the case that Grima is Distant
				case GRIMA.DISTANT:
					
					curr_sprite = spr_tl_camera_gd
					
				break;
				
				// In the case that Grima is a Medium distance away
				case GRIMA.MEDIUM:
					
					curr_sprite = spr_tl_camera_gm
					
				break;
				
				// In the case that Grima is Close
				case GRIMA.CLOSE:
					
					curr_sprite = spr_tl_camera_gc
					
				break;
				
			}
			
		// If Grims is not in this Room, we draw it normally
		} else {
			
			curr_sprite = spr_tl_camera
			
		}
		
	break;
	
	// In case of Room 2 - the Top Right Room/Camera
	case tr_room:
		
		// Now we check the current Room that Grima is in against this Room
		if ( curr_room == tr_room ) {
			
			// Set the total number of Windows for this Room
			windows_total = 2
			
			// Depending on Grima's current State, we will show a number of different Sprites
			switch ( state ) {
				
				// In the case that Grima is Distant
				case GRIMA.DISTANT:
					
					curr_sprite = spr_tl_camera_gd
					
				break;
				
				// In the case that Grima is a Medium distance away
				case GRIMA.MEDIUM:
					
					curr_sprite = spr_tl_camera_gm
					
				break;
				
				// In the case that Grima is Close
				case GRIMA.CLOSE:
					
					curr_sprite = spr_tl_camera_gc
					
				break;
				
			}
			
		// If Grims is not in this Room, we draw it normally
		} else {
			
			curr_sprite = spr_tl_camera
			
		}
		
	break;
	
	// In case of Room 3 - the Bottom Left Room/Camera
	case bl_room:
		
		// Now we check the current Room that Grima is in against this Room
		if ( curr_room == bl_room ) {
			
			// Set the total number of Windows for this Room
			windows_total = 3
			
			// Depending on Grima's current State, we will show a number of different Sprites
			switch ( state ) {
				
				// In the case that Grima is Distant
				case GRIMA.DISTANT:
					
					curr_sprite = spr_tl_camera_gd
					
				break;
				
				// In the case that Grima is a Medium distance away
				case GRIMA.MEDIUM:
					
					curr_sprite = spr_tl_camera_gm
					
				break;
				
				// In the case that Grima is Close
				case GRIMA.CLOSE:
					
					curr_sprite = spr_tl_camera_gc
					
				break;
				
			}
			
		// If Grims is not in this Room, we draw it normally
		} else {
			
			curr_sprite = spr_tl_camera
			
		}
		
	break;
	
	// In case of Room 4 - the Bottom Right Room/Camera
	case br_room:
		
		// Now we check the current Room that Grima is in against this Room
		if ( curr_room == br_room ) {
			
			// Set the total number of Windows for this Room
			windows_total = 3
			
			// Depending on Grima's current State, we will show a number of different Sprites
			switch ( state ) {
				
				// In the case that Grima is Distant
				case GRIMA.DISTANT:
					
					curr_sprite = spr_tl_camera_gd
					
				break;
				
				// In the case that Grima is a Medium distance away
				case GRIMA.MEDIUM:
					
					curr_sprite = spr_tl_camera_gm
					
				break;
				
				// In the case that Grima is Close
				case GRIMA.CLOSE:
					
					curr_sprite = spr_tl_camera_gc
					
				break;
				
			}
			
		// If Grims is not in this Room, we draw it normally
		} else {
			
			curr_sprite = spr_tl_camera
			
		}
		
	break;
	
}
