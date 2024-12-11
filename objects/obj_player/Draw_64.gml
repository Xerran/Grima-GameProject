/// @description Draws the Player's healthbar, stamina bar, and resources

// Draw the Player's healthbar
draw_healthbar( 8, 6, 256, 32, curr_hp, c_black, c_red, c_red, 0, true, true )

// Draw the Player's Stamina
draw_healthbar( 8, 36, 232, 52, stamina, c_black, #486856, #486856, 0, true, true )

// Set fibt or Display numbers
draw_set_font( fnt_menu )

// Display current amount of Blessed Wood
draw_sprite( spr_blessed_wood, 0, 304, 19 )
draw_text( 322, 4, ": " + string( blessed_wood ) )

// Display current amount of Bullets
draw_sprite( spr_bullet_pickup, 0, 380, 19)
draw_text( 398, 4, ": " + string( bullets) )

// Here we draw the current Hour as given to us by obj_game
draw_text( 1292, 4, obj_game.curr_hour_text )

// If we are starting the Game, then we display the Intro Text
if ( obj_game.intro_timer-- > 0 ) {
	
	draw_set_font(fnt_intro)
	draw_text( 512, 180, obj_game.intro_text )
	
}
