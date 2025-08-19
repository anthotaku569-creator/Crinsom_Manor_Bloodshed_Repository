draw_set_font(global.bitmap_font);
draw_set_halign(fa_left)
/*
draw_set_color(c_blue);
draw_rectangle(x + 32 , y, x + 192, y + 16, true);
*/
var _key_binding = string_delete(_verb, string_length(_verb) - 2, 3)

var _binded = input_binding_get_name(input_binding_get(_verb, control_type, _wich_player));
var _spr_image = -1;
/*
if control_type == INPUT_SOURCE.GAMEPAD {
	var _gamepad_get = input_gamepads_get_status().gamepads[slot];//input_player_gamepad_get(_wich_player);
	//input_gamepads_get_status().gamepads[i]
	//if _gamepad_get != INPUT_NO_GAMEPAD and gamepad_type!= "unkown" {
	if gamepad_type!= "unkown" {
		_binded = input_gamepad_get_button_label(
				_gamepad_get,
				gp_face1
		);
	}
	else{
		_binded = "A button"
	}
	//}
}*/

switch(_binded){
	case "gamepad face south"			: _spr_image = 0; break;
	case "gamepad face west"			: _spr_image = 2; break;
	case "gamepad face east"			: _spr_image = 1; break;
	case "gamepad face north"			: _spr_image = 3; break;
	case "gamepad thumbstick l left"	: _spr_image = 4; break;
	case "gamepad thumbstick l right"	: _spr_image = 5; break;
	case "gamepad thumbstick l up"		: _spr_image = 6; break;
	case "gamepad thumbstick l down"	: _spr_image = 7; break;
	case "gamepad thumbstick r left"	: _spr_image = 8; break;
	case "gamepad thumbstick r right"	: _spr_image = 9; break;
	case "gamepad thumbstick r up"		: _spr_image = 10; break;
	case "gamepad thumbstick r down"	: _spr_image = 11; break;
	case "gamepad dpad left"			: _spr_image = 12; break;
	case "gamepad dpad right"			: _spr_image = 13; break;
	case "gamepad dpad up"				: _spr_image = 14; break;
	case "gamepad dpad down"			: _spr_image = 15; break;
	case "gamepad shoulder l"			: _spr_image = 16; break;
	case "gamepad shoulder r"			: _spr_image = 17; break;
	case "gamepad trigger l"			: _spr_image = 18; break;
	case "gamepad trigger r"			: _spr_image = 19; break;
	case "gamepad select"				: _spr_image = 20; break;
	case "gamepad start"				: _spr_image = 21; break;
	case "gamepad guide"				: _spr_image = 22; break;
	case "gamepad misc 1"				: _spr_image = 23; break;
	default: break;
}

if mouse_enter == true {
	draw_text_ext_transformed(x , y, ">", 2, 160, 2, 2, 0)
}

switch(edit_state){
	case 0:
		draw_set_alpha(1);
		draw_set_color(c_white);
		if input_check(_verb, _wich_player) {
			draw_text_ext_transformed(x , y, "@", 2, 160, 2, 2, 0);
		}
		break;
	case 1:
		draw_set_alpha(1);
		draw_set_color(c_red);
		draw_text_ext_transformed(x , y, "!!!", 2, 160, 2, 2, 0);
		break;
	case 2:
		draw_set_alpha(0.5);
		draw_set_color(c_white);
		break;
}
if control_type == INPUT_SOURCE.GAMEPAD {
	draw_text_ext_transformed(
		x + 32 , y, _key_binding, 12, 120, 2, 2, 0);
	draw_text_ext_transformed(
		x + 144 - 48 , y, " -> ", 12, 120, 2, 2, 0);
	draw_sprite_ext(Spr_gamepad_buttons, _spr_image, x + 144 , y, 2, 2, 0, c_white, 1);
}
else{
	draw_text_ext_transformed(
		x + 32 , y, _key_binding, 12, 120, 2, 2, 0);
	draw_text_ext_transformed(
		x + 144 - 48 , y, " -> ", 12, 120, 2, 2, 0);
	draw_text_ext_transformed(
		x + 144 , y, _binded, 12, 160, 2, 2, 0);
}