/// @description Draws Text for various screens

draw_set_font( fnt_title )

if ( room_get_name( room ) != room_get_name( rm_death ) ) {
	
	draw_text( ( room_width / 2 ) - 216, y, text )
	
} else {
	
	draw_text( ( room_width / 2 ) - 320, y, text )
	
}
