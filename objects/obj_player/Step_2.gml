/// @description Governs Gun movement

// Sets Gun to be in front of the Player
pl_gun.depth = depth - 1

// Sets the Gun X and Y to be equal to the Player X and Y, but with a small gap so as to allow it to
// rotate around the Player in a circle
pl_gun.x = x + lengthdir_x(gun_distance, aim_dir)
pl_gun.y = y + lengthdir_y(gun_distance, aim_dir)

// Returns Gun distance to 10 pixels from Player over time after it has been fired
gun_distance = lerp(gun_distance, 15, 0.1)