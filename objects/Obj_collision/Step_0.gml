/// @description Insert description here
// You can write your code in this editor


x = char_bounded.x;
y = char_bounded.y + 2;
image_yscale = get_CharHeight();
image_xscale = 0.5;


if place_meeting(x - 1, y, Collision_father) {
	x += 8;
}
if place_meeting(x + 1, y, Collision_father) {
	x -= 8;
}