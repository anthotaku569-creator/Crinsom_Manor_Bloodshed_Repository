/// @description Insert description here
// You can write your code in this editor
if (point_in_rectangle(mouse_x, mouse_y, x + 32 , y + 8, x + 224, y + 40)) {
	mouse_enter = true;
		if mouse_check_button_pressed(mb_left) {
			if input_player_source_get(wich_player) == INPUT_SOURCE.KEYBOARD_AND_MOUSE {
				input_player_source_set(INPUT_SOURCE.GAMEPAD, wich_player);
				for (var i = 0; i < array_length(input_gamepads_get_status().gamepads) ; i += 1){
					if input_gamepads_get_status().gamepads[i] > 0 {
						slot = i;
						break;
					}
				}
				input_player_gamepad_set(slot, wich_player);
				show_debug_message(input_gamepads_get_status());
				show_debug_message(string(input_player_gamepad_get(wich_player)) + "==" + string(slot));
			}
			else {
				input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE, wich_player);
			}
			/*with(obj_button_binder){
				alarm[0] = 1;
			}*/
		}
		if input_player_source_get(wich_player) == INPUT_SOURCE.GAMEPAD {
			if mouse_wheel_down(){
				slot ++
				input_player_gamepad_set(slot, wich_player);
			}if mouse_wheel_up(){
				slot --
				input_player_gamepad_set(slot, wich_player)
			}
		}
}
else{
	mouse_enter = false;
}
	
