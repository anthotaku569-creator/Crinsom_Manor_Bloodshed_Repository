/// @description Insert description here
// You can write your code in this editor
if (point_in_rectangle(mouse_x, mouse_y, x , y, x + 192, y + 24)) {
	mouse_enter = true;
		if mouse_check_button_pressed(mb_left) {
			if input_player_source_get(wich_player) == INPUT_SOURCE.KEYBOARD_AND_MOUSE {
				input_player_source_set(INPUT_SOURCE.GAMEPAD, wich_player);
				/*
				array_foreach(input_gamepads_get_status().gamepads, function (_element, _i = 0){
					i++
					if _element > 0 {
						slot = i;
						return;
					}
				});
				*/
				for (var i = 0; i < array_length(input_gamepads_get_status().gamepads) ; i += 1){
					if input_gamepads_get_status().gamepads[i] > 0 {
						slot = i;
						break;
					}
				}
				show_debug_message(input_gamepads_get_status());
				input_player_gamepad_set(slot, wich_player);
			}
			else {
				input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE, wich_player);
			}
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
	
