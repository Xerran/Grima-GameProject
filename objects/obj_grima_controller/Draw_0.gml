/// @description Draws current Sprites and Overlays

// We only actually draw the Overlay if the Player wants to see it
if ( show_overlay ) {
	
	draw_rectangle_color( x - 144, y - 112, x + 144, y + 144, c_black, c_black, c_black, c_black, false )
	
	sprite_index = curr_sprite
	
	draw_self()
}
