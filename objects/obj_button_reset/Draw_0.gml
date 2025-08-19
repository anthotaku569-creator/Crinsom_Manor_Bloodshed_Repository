draw_set_font(global.bitmap_font);
draw_set_halign(fa_left)
/*
draw_set_color(c_blue);
draw_rectangle(x + 32 , y, x + 192, y + 16, true);
*/

if mouse_enter == true {
	draw_text_ext_transformed(x , y, ">", 2, 160, 2, 2, 0)
}

draw_set_color(c_black);
draw_text_ext_transformed(
x + 32 , y, "Reset all, player " + string(_wich_player), 12, 160, 2, 2, 0)