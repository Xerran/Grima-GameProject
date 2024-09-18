/// @description Governs Player movement and actions every frame
// You can write your code in this editor

var _input = rollback_get_input();

if (_input.left) {
	x -= move_speed;
}
if (_input.right) {
	x += move_speed;
}
if (_input.up) {
	y -= move_speed;
}
if (_input.down) {
	y += move_speed;
}

image_angle = point_direction(x, y, _input.mb_x, _input.mb_y);