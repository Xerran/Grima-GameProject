/// @description Determines Unlit and Lit behaviors

// First we check if Brazier is even lit or not, since that governs everything else
if ( !is_lit && curr_hp > 0) {
	
	// We must determine if the Player is currently nearby, so we can decide if we
	// need to display any text
	var _player_distance = point_distance(x, y, obj_player.x, obj_player.y)
	
	// If Player is close enough to the Brazier, then we generate some text
	if (_player_distance < (sprite_height / 2) + 16) {
		
		player_nearby = true
	
		// If we haven't yet created the text, and the Player actually has fuel, then we create the text
		if ( !text_created && obj_player.blessed_wood > 0 ) {
			my_text = instance_create_layer(x, y - 8, "Text", obj_searchable_text)
			my_text.text = light_text
			my_text.is_brazier_text = true
			text_created = true
		
			// Sets this Brazier as belonging to the Text instance, co-opting the Searchable code
			my_text.my_searchable = self
		}
	
	// Otherwise, we delete the Text
	} else {
		
		player_nearby = false
	
		// Only delete the text if it actually exists
		if ( text_created ) {
			
			instance_destroy( my_text )
			text_created = false
			
		}
	}
	
// If the Brazier is lit, then we are reducing the time left until the brazier goes out again
} else if ( is_lit && curr_hp > 0 ) {
	
	// If we still have time left for this Brazier to be lit, then we reduce the timer
	if ( curr_timer-- > 0 ) {
		
		is_lit = true
		my_room.is_dark = false
		
		// Is the timer low enough for us to prompt a refill?
		if ( curr_timer <= timer_max / 2 ) {
			
			// If we haven't yet created the text, and the Player actually has fuel, then we create the text
			if ( !text_created && obj_player.blessed_wood > 0 ) {
				my_text = instance_create_layer(x, y - 8, "Text", obj_searchable_text)
				my_text.text = refill_text
				my_text.is_brazier_text = true
				text_created = true
		
				// Sets this Brazier as belonging to the Text instance, co-opting the Searchable code
				my_text.my_searchable = self
			}
			
		}
		
	// Otherwise, Brazier isn't lit anymore
	} else {
		
		is_lit = false
		my_room.is_dark = true
		
	}
	
// Otherwise, the Brazier is destroyed, and it is completely inoperable
} else {
	
	// Object destruction is handled in the End Step event
	
}