/// @description Updates current Light position

// Update current Light position
light_set_position( my_light, x, y )

// If our target has been destroyed, we instantly delete this instance
if ( !instance_exists( target_id ) ) {
	
	instance_destroy()
	
}
