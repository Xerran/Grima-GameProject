/// @description Deals damage to Brazier

// Is the Brazier able to be damaged?
if ( !other.invulnerable ) {
	
	// We start by damaging the Brazier
	other.curr_hp -= obj_enemy_zombie.damage
	
	// Make Brazier invulnerable for a moment
	other.invulnerable = true

	other.alarm[0] = game_get_speed( gamespeed_fps )
	
} 