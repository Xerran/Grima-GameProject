/// @description For Testing

if ( keyboard_check_pressed( ord( "D" ) ) ) {
	
	global.game_over = true
	
}


if ( keyboard_check_pressed( ord( "V" ) ) ) {
	
	room_goto( rm_victory )
	
}

