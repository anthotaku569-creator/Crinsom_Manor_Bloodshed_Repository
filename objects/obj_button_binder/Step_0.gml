
//gamepad_type = input_player_gamepad_get_type(_wich_player);

control_type = input_player_source_get(_wich_player);

slot = input_player_gamepad_get(_wich_player);

if (point_in_rectangle(mouse_x, mouse_y, x + 32 , y + 8, x + 224, y + 24)) {
	mouse_enter = true;
	if mouse_check_button_pressed(mb_left){
		if edit_state == 0 {
			obj_button_binder.edit_state = 2;
			self.edit_state = 1;
		}
	}
}
else{
	mouse_enter = false;
}


switch(edit_state){
	case 0:
		break;
	case 1:
		var _bind_check = input_binding_scan_tick(control_type, _wich_player);
		if _bind_check!= undefined {
			if (input_value_is_binding(_bind_check)) {
				input_binding_set(_verb, _bind_check, _wich_player);
				show_debug_message(input_binding_get(_verb, control_type, _wich_player));
			}
			else{
				show_debug_message("Error during rebinding! (" + string(_bind_check) + ")");
			}
			obj_button_binder.edit_state = 0; // close all
		}
		break;
	case 2:
		break;
}
/*
if (point_in_rectangle(mouse_x, mouse_y, x , y, x + 160, y + 16)) {
	mouse_enter = true;
}
else {
	mouse_enter = false;
}
*/

