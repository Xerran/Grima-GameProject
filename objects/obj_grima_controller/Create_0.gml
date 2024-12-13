/// @description Initializes all variables

/*
 * GRIMA SECTION
 */

// How aggressive is Grima currently?
aggression = PREP

// What is the success rate of our movement options?
move_success_rate = PREP

// What is our current room?
curr_room = 1

// What is the current gameplay Hour?
curr_hour = obj_game.curr_hour

// States for Grima to iterate through
enum GRIMA {
	
	WAITING,
	DISTANT,
	MEDIUM,
	CLOSE
	
}

// What is our current state, or what is our current distance from the Fortress?
state = GRIMA.WAITING

// How long have we been waiting to move?
move_timer = obj_game.low_aggression

// Are we counting down to Player death?
grima_countdown = false

// How long is the countdown? (Currently 10 seconds)
countdown_max = game_get_speed( gamespeed_fps ) * 10

// How long have we been counting down for?
curr_countdown = countdown_max

// How many total Windows are in this area?
windows_total = 0

// How many Windows have we already gone through?
windows_count = 0

// What is the current Window we are checking?
curr_window = noone

// What is the numeric value of the Window we are targeting?
target = 0

// Is there no valid target for Grima in his current Room?
no_valid_target = false



/*
 * OVERLAY SECTION
 */

// Are we currently wanting the Player to see this overlay?
show_overlay = false

// What Camera is the Player looking at?
curr_camera = 1

// What sprite do we actually want to display to the Player?
curr_sprite = spr_tl_camera

// How long do we flash this Sprite for?
sprite_timer = game_get_speed( gamespeed_fps ) * 0.5

// Can we currently Flash?
can_flash = true

// How long does the Flash effect last? (Currently 1 second)
flash_effect_timer = game_get_speed( gamespeed_fps )

// How long do we have to wait for the Flash to recharge? (Currently 60 seconds)
flash_charge = game_get_speed( gamespeed_fps ) * 45

// How long have we been waiting for the Flash to recharge?
flash_timer = flash_charge

// Retrieves the id of the current Camera
camera_id = view_get_camera( 0 )

// What is the current frame of the Static Overlay?
static_frame = 0



/*
 * ROOMS AND WINDOWS
 */ 
 
// Here we initialize all of our Rooms and Windows that Grima can attack
 
// Room 1 - the Top Left Corner of the Fortress
tl_room = 1

// What is the current Room 1 sprite?
tl_sprite = spr_tl_camera

// The Windows for Room 1 - there are two
tl_window_1 = instance_nearest( 192, 96, obj_window )
tl_window_2 = instance_nearest( 448, 96, obj_window )

// The array of Windows for this Room
tl_array = [ tl_window_1, tl_window_2 ]



// Room 2 - the Top Right Corner of the Fortress
tr_room = 2

// What is the current Room 2 sprite?
tr_sprite = spr_tl_camera

// The Windows for Room 2 - there are two
tr_window_1 = instance_nearest( 1344, 96, obj_window )
tr_window_2 = instance_nearest( 1568, 320, obj_window )

// The array of Windows for this Room
tr_array = [ tr_window_1, tr_window_2 ]



// Room 3 - the Bottom Left Corner of the Fortress
bl_room = 3

// What is the current Room 3 sprite?
bl_sprite = spr_tl_camera

// The Windows for Room 3 - there are three
bl_window_1 = instance_nearest( 96, 896, obj_window )
bl_window_2 = instance_nearest( 96, 1024, obj_window )
bl_window_3 = instance_nearest( 352, 1184, obj_window )

// The array of Windows for this Room
bl_array = [ bl_window_1, bl_window_2, bl_window_3 ]



// Room 4 - the Bottom Right Corner of the Fortress
br_room = 4

// What is the current Room 4 sprite?
br_sprite = spr_tl_camera

// The Windows for Room 4 - there are three
br_window_1 = instance_nearest( 1248, 1184, obj_window )
br_window_2 = instance_nearest( 1376, 1184, obj_window )
br_window_3 = instance_nearest( 1568, 960, obj_window )

// The array of Windows for this Room
br_array = [ br_window_1, br_window_2, br_window_3 ]


