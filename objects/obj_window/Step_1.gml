/// @description Determines current Sprite

// At the beginning of the step, we set all of the variables in accordance with the current
// parallel variables held by obj_game

// We only want to do this if they have been changed, so we check if the Hour has changed
if ( curr_hour != obj_game.curr_hour ) {
	
	// Set the new current Hour
	curr_hour = obj_game.curr_hour
	
	// Set our variables to the new values
	damage = obj_game.curr_damage
	damage_rate = obj_game.curr_damage_rate
	engagement_timer = obj_game.curr_engagement
	success_rate = obj_game.curr_success_rate
	spawn_rate = obj_game.curr_spawn_rate
	
}

// Changes the Sprite depending on the current State
switch ( state ) {
	
	// The Window is currently unblocked and untrapped
	case WINDOW.OPEN:
	
		// If it isn't Blocked or Trapped, then we change it to the normal Sprite
		sprite_index = spr_window
	
	break;
	
	// The Window is currently barricaded by the Player
	case WINDOW.BLOCKED:
	
		sprite_index = spr_window_boarded
	
	break;
	
	// The Window is currently Engaged by an Enemy
	case WINDOW.ENGAGED:
		
		sprite_index = spr_window_engaged
		
	break;
	
	// The Window is currently Trapped by Grima
	case WINDOW.TRAPPED:
	
		sprite_index = spr_window_trapped
	
	break;
	
}