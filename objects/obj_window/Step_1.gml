/// @description Determines current Sprite

// Is this Window currently Blocked/barricaded?
if ( is_blocked ) {
	
	sprite_index = spr_window_boarded
	
// If it isn't, then we change it to the normal Sprite
} else {
	
	sprite_index = spr_window
	
}