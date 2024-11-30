/// @description Draws the Player and the Player's current Health if the Player has been damaged

draw_self()

if ( curr_hp != health_max and curr_hp > 0 ) {
	draw_healthbar( x - 14, y - 32, x + 14, y - 28, curr_hp / health_max * 100, $003300, $3232FF, $00B200, 0, 1, 1 )
}