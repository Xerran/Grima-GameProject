/// @description Destroys Brazier if applicable

if ( curr_hp <= 0 ) {
	
	// Decrease total number of Braziers
	obj_game.braziers--
	
	// Delete the Light attached to this instance
	light_delete( my_light )
	
	// Make sure this Brazier's Room is registered as being Dark
	my_room.is_dark = true
	
	// Destroy this Instance
	instance_destroy()
	
}
