/// @description Makes Object disappear if not picked up quickly enough

// Always subtract from the timer
timer--

// If this object only has half of its maximum time left, we turn it slightly
// transparent
if ( timer < timer_max / 2 ) {
	
	curr_alpha = 0.5
	
}

// Looks like we've run out of time - let's delete this Instance
if ( timer <= 0 ) {
	
	instance_destroy()
	
}
