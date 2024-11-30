/// @description Creation event for the Player object

// Basic stats for health, stamina, and stamina recovery
health_max = 100
curr_hp = health_max
stamina = 10
stamina_recovery = 0.5
stamina_drain = 2

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

// After a Player has been hit, will allow them to have multiple invincibility frames to recover
invulnerable = false

// Determines if the Player is currently sprinting or not
is_sprinting = false

// Determines Player's current speed (normal movement or sprinting)
curr_speed = move_speed

// Resize the sprite a little to make it fit the environment more comfortably
image_xscale = 2
image_yscale = 2

// Now we create the Gun object for our Player to wield
pl_gun = instance_create_layer(x, y, "Player", obj_gun)

// Sets the distance the Gun will circle around the Player
gun_distance = 15

// Sets the rate at which Bullets travel
bullet_speed = 8

// And we assign the Player's cursor to be the spr_cursor we created
cursor_sprite = spr_cursor
window_set_cursor(cr_none)
