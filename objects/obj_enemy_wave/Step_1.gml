/// @description Updates Light's current position & alpha

light_set_position( my_light, x, y )

// Update Light's alpha value until it is high enough
if ( my_alpha < 0.5 ) {
	my_alpha += 0.01
}

light_set_alpha( my_light, my_alpha )
