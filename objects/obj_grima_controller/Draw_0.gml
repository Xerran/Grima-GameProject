/// @description Draws current Sprites and Overlays

// We only actually draw the Overlay if the Player wants to see it
if ( show_overlay ) {
	
	draw_rectangle_color( x - 144, y - 112, x + 144, y + 144, c_black, c_black, c_black, c_black, false )
	
	sprite_index = curr_sprite
	
	// Draw the current Sprite
	draw_self()
	
	// If the Flash is recharging, we draw the recharge bar
	if ( flash_timer < flash_charge ) {
		
		draw_healthbar( x - 100, y + 80, x + 100, y + 81, 
			( flash_timer / flash_charge ) * 100, c_black, #D3D3D3, #D3D3D3, 0, false, false )
		
	} 
	
	// If we have recently Flashed Grima, we want to show the aftermath of the Flash
	if ( alarm[ 0 ] > flash_effect_timer / 2 ) {
		
		draw_sprite_ext( spr_flash, 0, x, y, 1, 1, 0, c_white, 1 )
		
	// After half a second, the Flash Effect begins to diminish
	} else if ( alarm[ 0 ] > 0 ) {
		
		var _alpha = alarm[ 0 ] / ( flash_effect_timer / 2 )
		
		draw_sprite_ext( spr_flash, 0, x, y, 1, 1, 0, c_white, _alpha )
		
	// Otherwise, we just draw the current Camera view
	} 
	
	draw_sprite_ext( spr_static_overlay, floor( static_frame / 8 ), x, y, 1, 1, 0, c_white, 0.5 )
	
	// Finally, we draw the number of the current Camera
	draw_set_font( fnt_help )
	draw_text( x - 128, y - 100, "Camera " + string( curr_camera ) )
	
}


// If we are currently counting down to the Player's Death, then we draw the countdown
if ( grima_countdown ) {
	
	// Subtract from the countdown
	curr_countdown--
	
	draw_set_font( fnt_intro )
	draw_text( x - 175, y - 128, "GRIMA IS COMING" )
	if ( ceil( curr_countdown / game_get_speed( gamespeed_fps ) ) == 10 ) {
		
		draw_text( x - 32, y - 64, ceil( curr_countdown / game_get_speed( gamespeed_fps ) ) )
		
	} else {
		
		draw_text( x - 16, y - 64, ceil( curr_countdown / game_get_speed( gamespeed_fps ) ) )
		
	}
	
	// Looks like game over
	if ( curr_countdown <= 0 ) {
		
		global.game_over = true
		
	}
	
// Otherwise we just make sure that the countdown is reset
} else {
	
	curr_countdown = countdown_max
	
}