/// @description If Enemy is Dead, then we Destroy the Enemy. If Enemy is done Attacking, resume Moving

switch ( state ) {
	// If the Attack is over with, reset all necessary variables and return to the Move state
	case STATES.ATTACK:
		if ( attack_done ) {
			attack_done = false
			state = STATES.IDLE
		}
	break;
	// If Enemy is Dead, then once the dying animation is done, they should be destroyed
	case STATES.DEAD:
		instance_destroy()
	break;
}
