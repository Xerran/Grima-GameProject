/// @description Creation event for the Player object

// Basic stats for Health and Stamina, including their respective maximums
health_max = 100
curr_hp = health_max
stamina = 100
stamina_max = 100

// The stats for how much Stamina recovers each step, and how much Stamina is
// drained while Sprinting/Dashing
stamina_recovery = 1
stamina_drain = 0.5
dash_cost = 25

// Governs horizontal movement
right_x = 0
left_x = 0
x_dir = 0

// Governs vertical movement
down_y = 0
up_y = 0
y_dir = 0

// Governs where Player and Gun should be pointing
aim_dir = 0

// After a Player has been hit, will allow them to have a few seconds to recover
// Also used in tandem with the Dash action to grant Player a small amount of invincibility frames
invulnerable = false

// Determines if the Player is currently Sprinting or not
is_sprinting = false

// Determines if Player is currently able to Dash 
can_dash = true

// Array to be used in concert with the Dash action, storing Player positions
dash_array = []

// How long we stay Dashing after using the Dash action
dash_limit = 20

// How long do we have left to continue Dashing?
dash_time = dash_limit

// Determines Player's current speed (normal movement, sprinting, or dash)
curr_speed = move_speed

// Are we currently Dashing? This disallows Sprinting while Dashing
is_dashing = false

// The directionality of our Dash movement
dash_dir_x = 0
dash_dir_y = 0

// Current direction the Player's sprite should be facing
facing = 2

// Resize the sprite a little to make it fit the environment more comfortably
image_xscale = facing
image_yscale = 2

// Now we create the Gun object for our Player to wield
pl_gun = instance_create_layer( x, y, "Player", obj_gun )

// Sets the distance the Gun will circle around the Player
gun_distance = 15

// Sets the rate at which Bullets travel
bullet_speed = 8

// This is just to make sure Player does not immediately fire the gun upon entering Game
alarm[1] = fire_rate

// What is the offset for the position of the Player's Sword upon creation?
sword_offset = 60

// What is the current offset for the position?
curr_offset = sword_offset

// What is the rate of change for the offset of the Player's Sword?
offset_change = 6

// What was the original aim_dir for the Sword attack?
orig_dir = 0

// What distance is the Sword from the Player?
sword_distance = 35

// What is the Stamina cost of swinging the Sword?
sword_cost = 15

// This is the Sword object our Player shall wield
pl_sword = noone

// Finally, we create a new light for use with the Player
my_light = light_create( global.system, spr_light, 0.25, c_gray, 0.5, 0, true )
light_set_position( my_light, x, y )


