/// @description Draws Sprite, Healthbar, and Timers

draw_self()

// If Health is below maximum and above 0, we draw the healthbar
if ( curr_hp != hp_max and curr_hp > 0 ) {
	
	draw_healthbar( x - 14, y - 48, x + 14, y - 44, curr_hp / hp_max * 100, $003300, $3232FF, $00B200, 0, 1, 1 )
	
}

// If the timer for how long this Brazier is lit is above 0, we draw the timer
if ( curr_timer > 0 ) {
	
	draw_healthbar(x - 32, y + 4, x + 32, y + 5, curr_timer / timer_max * 100, c_black, c_red, c_white, 0, false, false)
	
}
