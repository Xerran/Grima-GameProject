/// @description Creation event for the Player object

// Basic stats for health, stamina, and stamina recovery
hp = 100
stamina = 10
stamina_recovery = 0.1
stamina_drain = 0.2

// Governs horizontal movement
right_x = 0
left_x = 0
x_dir = 0

// Governs vertical movement
down_y = 0
up_y = 0
y_dir = 0

// After a Player has been hit, will allow them to have multiple invincibility frames to recover
invulnerable = false

// Determines if the Player is currently sprinting or not
is_sprinting = false

// Determines Player's current speed (normal movement or sprinting)
curr_speed = move_speed

// Determines if a player is in their normal state, or in their attacking state
enum STATES {
	NORMAL,
	ATTACKING
}

state = STATES.NORMAL

