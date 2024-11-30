/// @description Follows the Zombie this instance is attached to every step

// Sets Wave to follow the Zombie instance every single Step
x = my_zombie.x + ( image_xscale * 32 )
y = my_zombie.y

image_xscale = 1 * sign( my_zombie.image_xscale )

// In case of accidental attachment to a foreign Zombie instance,
// checks if my_zombie is out of Attack state
if ( my_zombie.state != STATES.ATTACK ) {
	instance_destroy()
}