/// @description Governs Sprite and Lighting related behaviors

// Depending on the Player's current Y, we will either appear in front of or behind the
// Player sprite

// If the Player is above this Instance, then it should appear to be in front of the Player
if ( obj_player.y < y ) {
	
	depth = obj_player.depth - 1
	
// Otherwise, the Player should appear to be in front of this instance
} else {
	
	depth = obj_player.depth + 3
	
}


// First we determine if the Brazier is lit or not
if ( !is_lit ) {
	
	// Make sure our light is turned back off
	light_set_scale ( my_light, 0 )
	
	// Completely healthy unlit Brazier sprite
	if ( curr_hp > ( hp_max / 2 ) ) {
		
		sprite_index = spr_brazier_unlit
		
	// Half health unlit Brazier Sprite
	} else if ( curr_hp > ( hp_max / 4 ) ) {
		
		sprite_index = spr_brazier_unlit_light_damage
		
	// Close to destruction unlit Brazier Sprite
	} else if ( curr_hp > 0 ) {
		
		sprite_index = spr_brazier_unlit_heavy_damage
	
	// Destroy object
	} else {
		
		// Object destruction is handled in End Step event
		
	}

// If it is lit, then we also have to worry about lighting changes
} else {
	
	// Good check to make sure we aren't going to be changing lights for a destroyed Brazier
	if ( curr_hp > 0) {
		
		// How long has it been since we last changed the light size?
		if ( size_timer-- < 0 ){
		
			// Change the Light to a random size in our size_array
			light_set_scale ( my_light, size_array[ irandom( length - 1 ) ] )
		
			// Reset the timer
			size_timer = size_wait
		
		}
		
		// Completely healthy lit Brazier sprite
		if ( curr_hp > ( hp_max / 2 ) ) {
		
			sprite_index = spr_brazier
		
		// Half health lit Brazier Sprite
		} else if ( curr_hp > ( hp_max / 4 ) ) {
		
			sprite_index = spr_brazier_light_damage
		
		// Close to destruction lit Brazier Sprite
		} else {
		
			sprite_index = spr_brazier_heavy_damage
	
		}
		
	// Destroy object
	} else {
		
		// Object destruction is handled in End Step event
		
	}
	
}
