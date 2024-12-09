/// @description Draws the Enemy and the Enemy Healthbar

// If Enemy is below maximum health, but above 0, draw a Healthbar for them above their Sprite
if ( curr_hp != health_max and curr_hp > 0 ) {
	
	draw_healthbar( x - 14, y - 32, x + 14, y - 28, curr_hp / health_max * 100, $003300, $3232FF, $00B200, 0, 1, 1 )

}

// If Enemy has been damaged recently, have them flash Red
if ( alarm[ 2 ] > 0 ) {
	
	gpu_set_fog( 1, c_red, 0, 1 )
	draw_self()
	gpu_set_fog( 0, c_red, 0, 1 )
	
// Otherwise, just draw the Sprite as normal
} else {
	
	draw_self()
	
}

