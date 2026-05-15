// Inherit the parent event

if !check_collision and state == states.idle {
	if input_check_released(inputs.k_up, wich_player, 3){
		if jump_cancel == true and vely < 0 {
			vely = vely * 0.5;
			jump_cancel = false;
		}
	}
}
event_inherited();

