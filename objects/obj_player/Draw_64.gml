/// @description Draws the Player's healthbar, stamina bar, and resources

// Draw the Player's healthbar
draw_healthbar( 8, 6, 256, 32, curr_hp, c_black, c_red, c_red, 0, true, true )
draw_set_font(fnt_menu)
//draw_text( 102, 4, string( curr_hp ) + "/" + string( health_max ) )

// Draw the Player's Stamina
draw_healthbar( 8, 36, 232, 52, stamina, c_black, #486856, #486856, 0, true, true )

// Display current amount of Blessed Wood
draw_sprite( spr_blessed_wood, 0, 304, 19 )
draw_text( 322, 4, ": " + string( blessed_wood ) )

// Display current amount of Bullets
draw_sprite( spr_bullet_pickup, 0, 372, 19)
draw_text( 390, 4, ": " + string( bullets) )
