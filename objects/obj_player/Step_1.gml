/// @description Determines directionality of Player movement

// First we determine the directionality of the Player's horizontal movement
// We'll be allowing for both Arrow Key-based movement and WASD-based movement
right_x = (keyboard_check(ord("D")) + keyboard_check(vk_right))
left_x = (keyboard_check(ord("A")) + keyboard_check(vk_left))

x_dir = right_x - left_x // This is our sum of the X-axis directional inputs

// Next, we determine the directionality of the Player's vertical movement
// We'll be allowing for both Arrow Key-based movement and WASD-based movement
down_y = (keyboard_check(ord("S")) + keyboard_check(vk_down))
up_y = (keyboard_check(ord("W")) + keyboard_check(vk_up))

y_dir = down_y - up_y // This is our sum of the Y-axis directional inputs

// This determines if the Player is currently sprinting, as well as if they able to sprint
// If a Player is not sprinting, an alarm is set. Afterwards, the Player's stamina will recover
if (keyboard_check(vk_shift) and !is_sprinting) {
	is_sprinting = true
	if (stamina > 0) {
		curr_speed = sprint_speed
		stamina -= stamina_drain
	} else {
		curr_speed = move_speed
		stamina_shock = true
		alarm[0] = game_get_speed(gamespeed_fps) * 2
	}
} else if (!keyboard_check(vk_shift) and is_sprinting) {
	curr_speed = move_speed
	is_sprinting = false
} else if (!keyboard_check(vk_shift) and !is_sprinting and !stamina_shock) {
	stamina += stamina_recovery
}