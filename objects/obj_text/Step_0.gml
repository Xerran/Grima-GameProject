/// @description If Player is pressing E, then Searches the cabinet

//Is this a response text?
if ( !response_text ) {
	
	// If Player is pressing E, then adds to the time that the Player has spent searching the Searchable object
	if ( keyboard_check( ord( "E" ) ) ) {
		
		curr_search_time += game_get_speed( gamespeed_fps )
		
	}

	// If Player has spent enough time searching, then deletes object and rewards Player 
	// with Blessed Wood or Bullets
	if ( curr_search_time >= search_max ) {
	
		// As we are co-opting this for use with Braziers and Windows, we will have to ensure we avoid any
		// errors caused by that
		
		// Does this Text belong to a Brazier?
		if ( is_brazier_text ) {
			
			// Light the Brazier, reset the timer, and remove a Blessed Wood from the Player
			my_instance.is_lit = true
			my_instance.curr_timer = my_instance.timer_max
			obj_player.blessed_wood--
			my_instance.text_created = false
			
			// If this isn't a refill, then we up the number of currently lit Braziers
			if ( !is_refill ) {
				
				obj_game.lit++
				
			}
			
		// Does this Text belong to a Window?
		} else if ( is_window_text ) {
			
			// Was the Window trapped?
			if ( my_instance.is_trapped ) {
				
				// Uh oh... Player is now very, very dead
				
				
			// Otherwise, proceed as normal
			} else {
				
				// Window is now Blocked, with full HP, and we remove a Blessed Wood from the Player
				my_instance.is_blocked = true
				my_instance.curr_hp = my_instance.hp_max
				obj_player.blessed_wood--
				my_instance.text_created = false
				
			}
			
			
		// This Text must belong to a Searchable then
		} else {
			
			my_instance.searched = true
			
		}
		
		// Finally, no matter what, we destroy this instance
		instance_destroy()
	
	}
}
