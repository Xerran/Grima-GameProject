/// @description If Player is pressing E, then Searches the cabinet

//Is this a response text?
if ( !response_text ) {
	
	// If Player is pressing E, then adds to the time that the Player has spent searching the Searchable object
	if ( keyboard_check( ord( "E" ) ) ) {
		curr_search_time += game_get_speed(gamespeed_fps)
	}

	// If Player has spent enough time searching, then deletes object and rewards Player 
	// with Blessed Wood or Bullets
	if ( curr_search_time >= search_max ) {
	
		// As we are co-opting this for use with Braziers, we will have to ensure we avoid any
		// errors caused by that
		if ( is_brazier_text ) {
			
			my_searchable.is_lit = true
			my_searchable.curr_timer = my_searchable.timer_max
			obj_player.blessed_wood--
			my_searchable.text_created = false
			
		} else {
			
			my_searchable.searched = true
			
		}
		
		// Finally, we destroy this instance
		instance_destroy()
	
	}
}
