/// @description Upon hitting a non-invulnerable Player, deals damage and destroys self

if ( !other.invulnerable ) {
	// We start by damaging the Player
	other.curr_hp -= damage
	
	// Check if Player is Dead
	if ( other.curr_hp <= 0 ) {
		
		global.game_over = true
		
	// If Player is not Dead, then make them invulnerable for a short while
	} else {

		other.invulnerable = true

		other.alarm[2] = game_get_speed( gamespeed_fps ) * 3
	}
	
	instance_destroy()
}