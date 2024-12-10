/// @description Draws Text and "Healthbar" to represent Player searching

draw_set_font(fnt_searchable)

// If this is for a Window, then we set the position above the Player
if ( is_window_text ) {
	
	draw_text( obj_player.x - 38, obj_player.y - 44, text )
	draw_healthbar( obj_player.x - 32, obj_player.y - 28, obj_player.x + 32, obj_player.y - 27, curr_search_time / search_max * 100, c_black, c_white, c_white, 0, false, false)
	
// Otherwise, we set the Text & Healthbar above the object
} else {
	
	draw_text( x - 32, y - 16, text )
	draw_healthbar(x - 32, y - 1, x + 32, y + 1, curr_search_time / search_max * 100, c_black, c_white, c_white, 0, false, false)
	
}




