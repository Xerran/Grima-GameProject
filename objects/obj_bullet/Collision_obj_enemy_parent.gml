/// @description If Bullet hits an Enemy that is not currently Dead, destroys Bullet

if ( other.state != STATES.DEAD ) {
	instance_destroy()
}