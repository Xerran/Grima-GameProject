/// @description Initializes variables

// What room is this Instance currently attached to?
my_room = noone

// Player should always appear in front of this Instance
depth = obj_player.depth + 2

// Light attached to this instance
my_light = light_create( global.system, spr_light, 0, c_orange, 0.5, 0, true )
light_set_position( my_light, x, y - 8 )

