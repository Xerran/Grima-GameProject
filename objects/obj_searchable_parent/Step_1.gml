/// @description Figures out if the Player is still nearby, deactivating visuals if they move away

if ( player_nearby ) {
	var _player_distance = point_distance(x, y, obj_player.x, obj_player.y)
	
	if (_player_distance > (sprite_height / 2) + 16) {
		player_nearby = false
		instance_destroy(my_text)
		text_created = false
	} else {
		text_created = true
	}
} 
