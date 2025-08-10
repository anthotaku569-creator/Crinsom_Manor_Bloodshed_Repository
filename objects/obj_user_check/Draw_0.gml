/// @description Insert description here
// You can write your code in this editor
draw_set_font(global.bitmap_font);
draw_set_halign(fa_left)

if mouse_enter{
	draw_text_ext_transformed(x , y, ">", 2, 160, 2, 2, 0)
}
draw_text_ext_transformed(x + 48 , y, "User 0" + string(user_number), 2, 160, 2, 2, 0)
