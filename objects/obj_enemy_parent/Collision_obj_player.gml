/// @description If Enemy is currently hazardous to touch, damages Player

// First we check if this Enemy is currently hazardous to touch
if ( is_hazard ) {
	
	// Is the Player currently invulnerable to damage?
	if ( !other.invulnerable ) {
		
		// We start by damaging the Player
		other.curr_hp -= obj_enemy_zombie.damage
	
		// Check if Player is Dead
		if ( other.curr_hp <= 0 ) {
		
			global.game_over = true
		
		// If Player is not Dead, then make them invulnerable for a short while
		} else {

			other.invulnerable = true

			other.alarm[2] = game_get_speed( gamespeed_fps ) * 3
		}
	}
}
