/// @description Sets the Zombie enemy instance for this to follow

// Set this as the Zombie instance for my_wave to follow
my_zombie = instance_nearest( x, y, obj_enemy_zombie )

// Create a light to follow this specific Wave
my_light = light_create( global.system, spr_light, 0.1, c_red, 0, 0, false )
light_set_position( my_light, x, y )

// Current alpha of my_light
my_alpha = 0
