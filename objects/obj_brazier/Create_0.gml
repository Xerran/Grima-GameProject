/// @description Initialize Brazier variables

// Is this brazier currently lit?
is_lit = false

// What are the HP values of this Brazier?
hp_max = 250
curr_hp = hp_max

// How long is this Brazier lit for when it is refilled?
timer_max = game_get_speed( gamespeed_fps ) * 60

// How long does the Brazier have left until it is unlit?
curr_timer = 0

// Light that is attached to this Brazier
my_light = light_create( global.system, spr_light, 0.75, c_orange, 3, 0, true )
light_set_position( my_light, x, y )

// Room that this Brazier is currently located in
my_room = noone
