/// @description Determines if the Player is Dead

// Check the number of Lit braziers and the Current Hour to see if Grima is able
// to kill the Player
if ( instance_exists( obj_grima_controller ) ) {
	
	if ( curr_hour >= 0 and lit == 0 ) {
	
		obj_grima_controller.grima_countdown = true
	
	} else {
	
		obj_grima_controller.grima_countdown = false
	
	}
	
}

// We simply check if global.game_over is true to determine if the Player is Dead
if ( global.game_over ) {
	
	// Pause all audio and go to the Death room
	audio_pause_all()
	audio_play_sound( snd_death, 1, false, 0.25, 0.5 )
	room_goto( rm_death )
	
	// Also reset global.game_over
	global.game_over = false
	
}