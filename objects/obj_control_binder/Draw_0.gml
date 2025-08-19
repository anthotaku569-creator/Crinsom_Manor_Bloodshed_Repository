/// @description Insert description here
// You can write your code in this editor
draw_set_font(global.bitmap_font);
draw_set_halign(fa_left)

if mouse_enter {
	draw_text_ext_transformed(x , y, ">", 2, 160, 2, 2, 0)
}

if input_player_source_get(wich_player) == INPUT_SOURCE.KEYBOARD_AND_MOUSE {
	control_type = "Mouse & Keyboard"
}
if input_player_source_get(wich_player) == INPUT_SOURCE.GAMEPAD {
	control_type = "Gamepad (slot: " + string(slot) + ")";
}
draw_text_ext_transformed(
x + 32 , y, "Control current" + "->" + control_type, 12, 120, 2, 2, 0)