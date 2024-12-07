/// @description Determines current Sprite and Sprite settings to display

// If Player is currently invulnerable due to being damaged, shows them as 
// half-opacity to signify as much
if ( invulnerable and !is_dashing ) {
	
	draw_sprite_ext( sprite_index, image_index, x, y, facing, 2, 0, c_white, 0.5 )
		
// If Player is about to regain ability to Dash, have them flash white to signify
// they will soon be able to Dash again
} else if( alarm[3] <= 3 and !can_dash ) {
	
	gpu_set_fog( 1, c_white, 0, 1 )
	draw_sprite_ext( sprite_index, image_index, x, y, facing, 2, 0, c_white, 1 )
	gpu_set_fog( 0, c_white, 0, 1 )
	
// Draw Player as normal if all other cases are false, with added Dash animation if they are Dashing
} else {
	
	// Current length of the dash_array
	var _length = array_length( dash_array )
	
	// Loops through the dash_array, drawing each element a little less opaque each time
	for ( var _i = _length - 1; _i >= 0; _i-- ) {
		
		// Make the current element a little more transparent, giving the appearance of it fading away
		dash_array[_i].image_alpha -= 0.05
		
		// If current element is not completely transparent, draw it out
		if ( dash_array[_i].image_alpha > 0 ) {
			
			draw_sprite_ext( spr_player_dash, 0, dash_array[_i].x, dash_array[_i].y, facing, 2, 0, c_white, dash_array[_i].image_alpha )
		
		// Otherwise, we can go ahead delete an image we can no longer see
		} else {
			
			array_delete( dash_array, _i, 1 )
			
		}
		
	}
	
	draw_sprite_ext( sprite_index, image_index, x, y, facing, 2, 0, c_white, 1 )

}