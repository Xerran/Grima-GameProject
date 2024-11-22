/// @description Insert description here
// You can write your code in this editor

// Retrieves and stores distance to Player every step
var _distance_to_player = distance_to_object(obj_player)

// Can we make a path to the Player?
var _found_player = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, choose(0, 1))

// Start path if the Player is reachable
if (_found_player) {
	path_start(path, move_speed, path_action_stop, false)
}