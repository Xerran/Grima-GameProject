/// @description If the Searchable has been searched, then we reward the Player with an item

// Check if this Searchable has been searched
if ( searched && has_item ) {
	
	// Now, depending on the item, we display some different texts
	switch ( item ) {
		
		// If there is no item, then we display "There was nothing"
		case noone:
		
			my_text = instance_create_layer( x, y - 8, "Text", obj_text )
			my_text.text = "There was nothing." 
			my_text.response_text = true
			
			// Text exists for a short time, then destroys self
			alarm[0] = game_get_speed( gamespeed_fps ) * 4
			
			// Searchable no longer has any item - it is now fully defunct
			has_item = false
			
		break;
		
		// In the case that this Searchable contained a Bullet refill
		case obj_bullet_pickup:
		
			my_text = instance_create_layer( x - 10, y - 8, "Text", obj_text )
			my_text.text = "You found some Bullets!" 
			my_text.response_text = true
			
			// Now we actually give the Player some Bullets
			obj_player.bullets += 6
			
			// Text exists for a short time, then destroys self
			alarm[0] = game_get_speed( gamespeed_fps ) * 4
			
			// Searchable no longer has any item - it is now fully defunct
			has_item = false
		
		break;
		
		// In the case that this Searchable contained Blessed Wood
		case obj_blessed_wood:
		
			my_text = instance_create_layer( x - 12, y - 8, "Text", obj_text )
			my_text.text = "You found Blessed Wood!" 
			my_text.response_text = true
			
			// Now we actually give the Player some Blessed Wood
			obj_player.blessed_wood++
			
			// Text exists for a short time, then destroys self
			alarm[0] = game_get_speed( gamespeed_fps ) * 4
			
			// Searchable no longer has any item - it is now fully defunct
			has_item = false
		
		break;
	}
	
}


