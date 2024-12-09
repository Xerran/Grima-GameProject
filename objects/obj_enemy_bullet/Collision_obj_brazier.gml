/// @description Deals damage to Brazier

// Is the Brazier able to be damaged?
if ( !other.invulnerable ) {
	
	// We start by damaging the Brazier
	other.curr_hp -= damage
	
	// Make Brazier invulnerable for a moment
	other.invulnerable = true

	other.alarm[0] = game_get_speed( gamespeed_fps )
	
	// Destroy Light
	light_delete( my_light )
	
	// Destroy Self
	instance_destroy()
	
// If it isn't, let's go ahead and Destroy this instance anyways, to prevent too much
// damage from piling up
} else {
	
	// Destroy Light
	light_delete( my_light )
	
	// Destroy Self
	instance_destroy()
	
}
