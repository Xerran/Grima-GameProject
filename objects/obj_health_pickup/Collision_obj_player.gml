/// @description We heal the Player by a set amount

other.curr_hp += hp

// We do want to make sure that the maximum HP doesn't go above maximum, though
if ( other.curr_hp > other.health_max ) {
	
	other.curr_hp = other.health_max
	
}

// Play the Health_Pickup sound
audio_play_sound( snd_health_pickup, 1, false, 0.2 )

// Destroy this Instance
instance_destroy()
