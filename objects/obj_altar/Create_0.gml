/// @description Initializes variables

// What room is this Instance currently attached to?
my_room = noone

// Player should always appear in front of this Instance
depth = obj_player.depth + 3

// How long does it take us to generate a Blessed Wood? (currently 30 seconds)
timer_max = game_get_speed( gamespeed_fps ) * 30

// How long have we already spent generating a Blessed Wood?
timer = 0

// What is the current Text to display?
text = ""

// Have we already generated a piece of Blessed Wood?
generated = false

// The Text object attached to this Instance
my_text = noone

// Have we already created a Text object?
text_created = false
