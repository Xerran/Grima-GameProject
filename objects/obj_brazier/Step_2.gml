/// @description Destroys Brazier if applicable, and plays Damage sound

if ( curr_hp <= 0 ) {
	
	// Decrease total number of Braziers
	obj_game.braziers--
	
	// If the Brazier was still lit, we reduce the number of lit Braziers
	if ( is_lit ) {
		
		obj_game.lit--
		
		// Also make sure the sound is turned off
		if ( audio_is_playing( snd_brazier ) ) {
			
			audio_stop_sound( snd_brazier )
			
		}
		
	}
	
	// Delete the Light attached to this instance
	light_delete( my_light )
	
	// Make sure this Brazier's Room is registered as being Dark
	my_room.is_dark = true
	
	// Destroy this Instance
	instance_destroy()
	
}

// Plays sound when damaged
if ( invulnerable and !played_sound ) {
	
	audio_play_sound( snd_brazier_damage, 1, false, 0.1 )
	
	played_sound = true
	
}
