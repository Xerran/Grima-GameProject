/// @description Governs all Game Behaviors

/*
 * GLOBAL TIMER SECTION
 */
 
// Over the course of the game, the "Global Timer" will tick down, representing the
// passage of time from the game's start at "11 PM" to the game's end at "6 AM". This
// will affect certain mechanics such as how often Enemies spawn, how aggressively
// Enemies and Grima will try to destroy barricades on Windows, and how commonly
// Grima moves

// First we will determine the current Hour and decrement the Global Timer

// The "Global Timer" will only begin counting down when we are in the main game Room (rm_game)
if ( room_get_name( room ) == room_get_name( rm_game ) ) {
	
	// We constantly decrement the Global Timer until enough time has passed for the Hour
	// to increment (when global_timer is less than or equal to 0)
	if ( global_timer-- <= 0 ) {
		
		// Reset the Global Timer
		global_timer = hour_timer_max
		
		// Stop the ticking sound
		audio_stop_sound( snd_clock_ticking )
		
		// Increment the Hour
		curr_hour += 1
		
		
	// If Global Timer is approaching a new Hour, then we play a slowly-deepening Tick sound
	} else if ( global_timer <= game_get_speed( gamespeed_fps ) * 5.5 ) {
		
		// What is the current time of our Global Timer in seconds?
		var _curr_time = ceil( global_timer / game_get_speed( gamespeed_fps ) )
		
		// Changes behavior based on how many seconds are left
		switch ( _curr_time ) {
			
			// In the case of 6 seconds, we just want to start playing the sound
			case 6:
			
				// Reset the pitch and play the sound if it isn't already playing
				if ( !audio_is_playing( snd_clock_ticking ) ) {
					
					audio_play_sound( snd_clock_ticking, 1, false, 0.25, 0, 1 )
				
					// Set to slowly rise in gain over the next 5 seconds
					audio_sound_gain( snd_clock_ticking, 0.5, 5000 )
				
				}
				
			break;
			
			// For 5 seconds and below, we will just gradually make the ticking sound 
			// lower in pitch
			
			// In the case of 5 seconds
			case 5:
			
				audio_sound_pitch( snd_clock_ticking, 0.95 )
			
			break;
			
			// In the case of 4 seconds
			case 4:
				
				audio_sound_pitch( snd_clock_ticking, 0.9 )
				
			break;
			
			// In the case of 3 seconds
			case 3:
				
				audio_sound_pitch( snd_clock_ticking, 0.85 )
				
			break;
			
			// In the case of 2 seconds
			case 2:
			
				audio_sound_pitch( snd_clock_ticking, 0.8 )
			
			break;
			
			// In the case of 1 second
			case 1:
			
				// At this point, we are close enough to play the Hour Change sound
				if ( !audio_is_playing( snd_hour_change ) ) {
					
					audio_play_sound( snd_hour_change, 1, false, 0.5, 0.1, 1 )
					
				}
			
			break;
			
		}
		
	}
	
}


/*
 * CURRENT HOUR SECTION
 */

// As stated previously, Global Timer will tick down and will gradually change the
// current Hour. In this section, we will implement the changes wrought by the changing
// of the Hour, including Enemy spawn mechanics and Grima's aggressiveness

// We begin with a switch statement to determine which changes to implement
switch ( curr_hour ) {
	
	// In case it is 11 PM - the Prep Hour. No Enemy spawns and no Grima at all
	case -1:
		
		// Change the current Hour display
		curr_hour_text = "11 AM"
		
		// Set our current Grima-related values
		curr_aggression = PREP
		curr_move_success = PREP
		
		// Set our current Window-related values
		curr_spawn_rate = PREP
		curr_engagement = PREP
		curr_success_rate = PREP
		curr_damage = PREP
		curr_damage_rate = PREP
		
		
	break;
	
	
	// In case it is 12 AM - lowest Enemy spawns, lowest Window-barricade damage, 
	// low Grima aggression
	case 0:
		
		// Change the current Hour display
		curr_hour_text = "12 AM"
		
		// Set our current Grima-related values
		curr_aggression = low_aggression
		curr_move_success = low_move_success
		
		// Set our current Window-related values
		curr_spawn_rate = lowest_spawn_rate
		curr_engagement = lowest_engagement
		curr_success_rate = lowest_success_rate
		curr_damage = lowest_damage
		curr_damage_rate = lowest_damage_rate
		
		
	break;
	
	
	// In case it is 1 AM - low Enemy spawns, low Window-barricade damage, low Grima aggression
	case 1:
		
		// Change the current Hour display
		curr_hour_text = " 1 AM"
		
		// Set our current Grima-related values
		curr_aggression = low_aggression
		curr_move_success = low_move_success
		
		// Set our current Window-related values
		curr_spawn_rate = low_spawn_rate
		curr_engagement = low_engagement
		curr_success_rate = low_success_rate
		curr_damage = low_damage
		curr_damage_rate = low_damage_rate
		
		
	break;
	
	
	// In case it is 2 AM - low Enemy spawns, low Window-barricade damage, low Grima aggression
	// (no change from 1 AM)
	case 2:
		
		// Change the current Hour display
		curr_hour_text = " 2 AM"
		
		// Set our current Grima-related values
		curr_aggression = low_aggression
		curr_move_success = low_move_success
		
		// Set our current Window-related values
		curr_spawn_rate = low_spawn_rate
		curr_engagement = low_engagement
		curr_success_rate = low_success_rate
		curr_damage = low_damage
		curr_damage_rate = low_damage_rate
		
		
	break;
	
	
	// In case it is 3 AM - medium Enemy spawns, medium Window-barricade damage, 
	// medium Grima aggression
	case 3:
		
		// Change the current Hour display
		curr_hour_text = " 3 AM"
		
		// Set our current Grima-related values
		curr_aggression = medium_aggression
		curr_move_success = medium_move_success
		
		// Set our current Window-related values
		curr_spawn_rate = medium_spawn_rate
		curr_engagement = medium_engagement
		curr_success_rate = medium_success_rate
		curr_damage = medium_damage
		curr_damage_rate = medium_damage_rate
		
		
	break;
	
	
	// In case it is 4 AM - medium Enemy spawns, medium Window-barricade damage, 
	// medium Grima aggression (no change from 3 AM)
	case 4:
		
		// Change the current Hour display
		curr_hour_text = " 4 AM"
		
		// Set our current Grima-related values
		curr_aggression = medium_aggression
		curr_move_success = medium_move_success
		
		// Set our current Window-related values
		curr_spawn_rate = medium_spawn_rate
		curr_engagement = medium_engagement
		curr_success_rate = medium_success_rate
		curr_damage = medium_damage
		curr_damage_rate = medium_damage_rate
		
		
	break;
	
	
	// In case it is 5 AM - high Enemy spawns, high Window-barricade damage,
	// high Grima aggression
	case 5:
		
		// Change the current Hour display
		curr_hour_text = " 5 AM"
		
		// Set our current Grima-related values
		curr_aggression = high_aggression
		curr_move_success = high_move_success
		
		// Set our current Window-related values
		curr_spawn_rate = high_spawn_rate
		curr_engagement = high_engagement
		curr_success_rate = high_success_rate
		curr_damage = high_damage
		curr_damage_rate = high_damage_rate
		
		
	break;
	
	
	// In case it is 6 AM - the Player has just won the game
	case 6:
		
		// Fixes issue where Game would "freeze" - really Room was just being constantly
		// reassigned to rm_victory
		if ( room_get_name( room ) != room_get_name( rm_victory ) ) {
			
			room_goto( rm_victory )
			
		}
		
	break;
}


/*
 * NORTH HALLWAY SECTION
 */

// If all 5 Braziers are lit, then the North Hallway is no longer counted as being dark,
// with its Candelabras lighting up to signify as much (this debuffs enemies that
// enter through the North window by making them move at walk speed rather than immediately
// at sprint speed)

// First we ensure that the North Hallway has been set
if ( north_hallway != noone && instance_exists( north_hallway ) ) {
	
	if ( lit == 5 ) {
	
		north_hallway.is_dark = false
	
	// However, if even one Brazier is destroyed or unlit, the North Hallway is made dark
	} else {
	
		north_hallway.is_dark = true
	
	}
	
} 
