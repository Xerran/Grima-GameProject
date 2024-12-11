/// @description Determines current Sprite

// Just to make sure we have actually attached to our Room at this point
if ( my_room != noone && instance_exists( my_room ) ) {

	// If our Room is dark, then we use the unlit Sprite, and "turn off" the Light
	if ( my_room.is_dark ) {
		
		sprite_index = spr_candelabra_dark
		light_set_scale( my_light, 0 )
		
	// Otherwise, we change to the lit Sprite, and "turn on" the Light
	} else {
		
		sprite_index = spr_candelabra
		light_set_scale( my_light, 0.1 )
		
	}

}
