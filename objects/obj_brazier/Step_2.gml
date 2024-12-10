/// @description Destroys Brazier if applicable

if ( curr_hp <= 0 ) {
	
	// Decrease total number of Braziers
	obj_game.braziers--
	
	// If the Brazier was still lit, we reduce the number of lit Braziers
	if ( is_lit ) {
		
		obj_game.lit--
		
	}
	
	// Delete the Light attached to this instance
	light_delete( my_light )
	
	// Make sure this Brazier's Room is registered as being Dark
	my_room.is_dark = true
	
	// Destroy this Instance
	instance_destroy()
	
}
