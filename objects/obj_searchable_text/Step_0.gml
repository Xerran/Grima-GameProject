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
	
		my_searchable.searched = true
	
		instance_destroy()
	
	}
}
