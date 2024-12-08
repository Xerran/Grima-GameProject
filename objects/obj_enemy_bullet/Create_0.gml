/// @description Initializes Bullet variables

// Range the Bullet travels before despawning
range = 450

// The owner of this Bullet instance
owner_id = noone

// ID of the target to follow
target_id = noone

// How far the Bullet has traveled since creation
distance_traveled = 0

// How much damage does this Bullet deal?
damage = obj_enemy_cultist.damage

// How long does this bullet wait before pursuing the player?
wait_time = irandom(60) + 16

// What is this Bullet's waiting point?
wait_point_x = 0
wait_point_y = 0

// Create a light to follow this specific Bullet
my_light = light_create( global.system, spr_light, 0.1, c_red, 0.4, 0, false )
light_set_position( my_light, x, y )