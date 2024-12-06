/// @description If the Searchable has been searched, then we reward the Player with an item

// Check if this Searchable has been searched
if ( searched && has_item ) {
	
	// Now, depending on the item, we display some different texts
	switch ( item ) {
		
		// If there is no item, then we display "There was nothing"
		case noone:
		
			my_text = instance_create_layer( x, y - 8, "Enemies", obj_searchable_text )
			my_text.text = "There was nothing" 
			my_text.response_text = true
			
			// Text exists for a short time, then destroys self
			alarm[0] = game_get_speed( gamespeed_fps ) * 4
			
			// Searchable no longer has any item - it is now fully defunct
			has_item = false
			
		break;
		
		case obj_bullet_pickup:
		
		break;
		
		case obj_blessed_wood:
		
		break;
	}
	
}


