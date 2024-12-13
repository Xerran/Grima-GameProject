/// @description Initializes the Motion Planning Grid of the "Game" Room, and Handles Music

// Plays the Title Music
if ( room_get_name( room ) == room_get_name( rm_title ) ) {
	
	// Stop the Death and Victory Musics if they are playing
	audio_stop_sound( snd_death_music )
	audio_stop_sound( snd_victory_music )
	
	// Only play the Title Music if it isn't already playing
	if ( !audio_is_playing( snd_title_music ) ) {
		
		audio_play_sound( snd_title_music, 2, true, 0.1, 0, 0.9 )
		
	}
	
}

// We first check to see if the current Room is "Game" or not, that way
// we don't create a MP Grid if we don't need it
if ( room_get_name( room ) == room_get_name( rm_game ) ) {
	
	// Stop playing the Title Music
	audio_stop_sound( snd_title_music )
	
	// Start playing the Prep Hour Music
	audio_play_sound( snd_prep_hour_music, 2, true, 0.1, 0, 1 )
		
	
	// Sets the "Grid Size" of the room - 32 pixels
	#macro GS		32 

	// Number of tiles in the room (Room dimension / 32)
	var _width = ceil( room_width / GS )
	var _height = ceil( room_height / GS )

	// Now we create the Motion Planning Grid
	global.mp_grid = mp_grid_create( 0, 0, _width, _height, GS, GS )

	// We need to add solid instances to Grid to allow for collisions
	mp_grid_add_instances( global.mp_grid, obj_solid, true )
	
	// Initialize North Hallway
	north_hallway = instance_nearest( 832, 272, obj_room )
	
	// Initialize the Intro Timer
	intro_timer = game_get_speed( gamespeed_fps ) * 3
	
	// And we assign the Player's cursor to be the spr_cursor we created
	cursor_sprite = spr_cursor
	window_set_cursor( cr_none )
	
// If we aren't in rm_game, we reset the Player's cursor
} else {
	
	cursor_sprite = noone
	window_set_cursor( cr_default )
	
}

// In case the Player is in the Death Room
if ( room_get_name( room ) == room_get_name( rm_death ) ) {
	
	audio_stop_sound( snd_grima_music )
	
	audio_play_sound( snd_death_music, 2, true, 0.1, 0, 0.9 )
	
	alarm[ 0 ] = game_get_speed( gamespeed_fps ) * 1
	
}

// In case the Player is in the Victory Room
if ( room_get_name( room ) == room_get_name( rm_victory ) ) {
	
	audio_stop_all()
	
	audio_play_sound( snd_victory_chimes, 2, false, 0.1, 2, 1 )
	
	alarm[ 1 ] = game_get_speed( gamespeed_fps ) * 10
	
}

// In case the Player is in the Ending Room
if ( room_get_name( room ) == room_get_name( rm_end ) ) {
	
	audio_play_sound( snd_victory_music, 2, false, 0.1, 0, 1 )
	
}
