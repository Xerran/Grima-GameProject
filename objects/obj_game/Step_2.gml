/// @description Determines if the Player is Dead

// We simply check if global.game_over is true to determine if the Player is Dead
if ( global.game_over ) {
	
	// Pause all audio and go to the Death room
	audio_pause_all()
	audio_play_sound( snd_death, 1, false, 0.25, 0.5 )
	room_goto( rm_death )
	
	// Also reset global.game_over
	global.game_over = false
	
}