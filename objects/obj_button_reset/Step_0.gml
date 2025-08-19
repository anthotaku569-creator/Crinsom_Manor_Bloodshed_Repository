control_type = input_player_source_get(_wich_player);

if (point_in_rectangle(mouse_x, mouse_y, x + 32 , y + 8, x + 224, y + 24)) {
		mouse_enter = true
		if mouse_check_button_pressed(mb_left){
			input_bindings_reset(control_type, _wich_player);
		}
}
else{
	mouse_enter = false
}


/*
if (point_in_rectangle(mouse_x, mouse_y, x , y, x + 160, y + 16)) {
	mouse_enter = true;
}
else {
	mouse_enter = false;
}
*/

