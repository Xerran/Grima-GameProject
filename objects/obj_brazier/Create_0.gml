/// @description Initialize Brazier variables

// Is this brazier currently lit?
is_lit = false

// What are the HP values of this Brazier?
hp_max = 250
curr_hp = hp_max

// Text to be displayed by this Brazier
my_text = noone

// What Text do we want displayed?
light_text = "Hold E to Light"
refill_text = "Hold E to Refill"

// Have we already created a text instance?
text_created = false

// Is the Player currently nearby?
player_nearby = false

// How long is this Brazier lit for when it is refilled? (Currently set to 120 seconds)
timer_max = game_get_speed( gamespeed_fps ) * 120

// How long does the Brazier have left until it is unlit?
curr_timer = 0

// Light that is attached to this Brazier
my_light = light_create( global.system, spr_light, 0, c_orange, 1, 0.75, true )
light_set_position( my_light, x, y )

// Array of Light Size values to iterate through randomly every step, adding visual flair
size_array = [ 0.95, 0.96, 0.97, 0.98, 0.99, 1 ]

// Length of the Light Size array
length = array_length( size_array )

// How long do we wait until we change the Light Size?
size_wait = 5

// How long have we been waiting already to change the Light Size?
size_timer = 0

// Room that this Brazier is currently located in
my_room = instance_nearest( x, y, obj_room )

// Is this Brazier currently able to be damaged?
invulnerable = false

// Have we played a sound yet?
played_sound = false

