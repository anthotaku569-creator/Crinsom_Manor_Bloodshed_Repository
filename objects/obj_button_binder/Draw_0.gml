draw_set_font(global.bitmap_font);
draw_set_halign(fa_left)
/*
draw_set_color(c_blue);
draw_rectangle(x + 32 , y, x + 192, y + 16, true);
*/
var _key_binding = string_delete(_verb, string_length(_verb) - 2, 3)
var _binded = input_binding_get_name(input_binding_get(_verb, INPUT_SOURCE.KEYBOARD_AND_MOUSE, _wich_player));


if mouse_enter == true {
	draw_text_ext_transformed(x , y, ">", 2, 160, 1, 1, 0)
}

switch(edit_state){
	case 0:
		draw_set_alpha(1);
		draw_set_color(c_white);
		if input_check(_verb, _wich_player) {
			draw_text_ext_transformed(x , y, "@", 2, 160, 1, 1, 0);
		}
		break;
	case 1:
		draw_set_alpha(1);
		draw_set_color(c_red);
		draw_text_ext_transformed(x , y, "!!!", 2, 160, 1, 1, 0);
		break;
	case 2:
		draw_set_alpha(0.5);
		draw_set_color(c_white);
		break;
}


draw_text_ext_transformed(
x + 32 , y, _key_binding + " -> " + _binded, 12, 160, 1, 1, 0)