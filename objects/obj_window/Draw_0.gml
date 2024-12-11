/// @description Draws Sprite and Healthbar

draw_self()

// If Health is below maximum and above 0, we draw the healthbar
if ( curr_hp != hp_max and curr_hp > 0 ) {
	
	draw_healthbar( x - 14, y - 48, x + 14, y - 44, curr_hp / hp_max * 100, $003300, $3232FF, $00B200, 0, 1, 1 )
	
}

// If the Window has been recently damaged, we determine by what, and then flash
// a color
if( alarm[ 0 ] <= 3 ) {
	
	// If damaged by an Enemy, we flash Red
	if ( enemy_damaged ) {
		
		gpu_set_fog( 1, c_red, 0, 1 )
		draw_sprite_ext( sprite_index, image_index, x, y, 1, 1, 0, c_white, 1 )
		gpu_set_fog( 0, c_red, 0, 1 )
	
	// If damaged by the Player, we flash White
	} else if ( player_damaged ) {
		
		gpu_set_fog( 1, c_white, 0, 1 )
		draw_sprite_ext( sprite_index, image_index, x, y, 1, 1, 0, c_white, 1 )
		gpu_set_fog( 0, c_white, 0, 1 )
		
	}
}