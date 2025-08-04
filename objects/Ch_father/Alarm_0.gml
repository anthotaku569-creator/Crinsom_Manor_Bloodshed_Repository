/// @description Knockback delay
// You can write your code in this editor

function calc_kback(angle, kcbk, other_dir){
	var hor_kb = (cos(angle*pi/180)*kcbk*other_dir);
	var ver_kb = (sin(angle*pi/180)*kcbk*-1);
	#region remove DI
	/*
	var h_influence = 0;
	var v_influence = 0;
	
	if bars.HealthBar.actual > 0 {
		var current_DItap = stats.weight.DI_Tap / (guts);
	}
	else {
		var current_DItap = stats.weight.DI_Tap/ 0.002
	}
	if state== states.hitstun or state == states.knockdown{
		if global.training_mode == true and wich_player == 2 {
			if match_controller.training_settings[? "Control"] != 0 {
				switch (match_controller.training_settings[? "Dir. Influence"]){
					case 1:
						var t_vi = choose(8,4,2,6,5)
						switch(t_vi){
							case 8:
								v_influence = current_DItap*scaling.kbck*-1*kcbk;
								h_influence = current_DItap*scaling.kbck*sign(hor_kb)*-1*kcbk;
								break;
							case 2:
								v_influence = current_DItap*scaling.kbck*kcbk;
								h_influence = current_DItap*scaling.kbck*sign(hor_kb)*-1*kcbk;
								break;
							case 4:
								v_influence = current_DItap*scaling.kbck*sign(ver_kb)*kcbk*-1;
								h_influence = current_DItap*scaling.kbck*-1*kcbk;
								break;
							case 6:
								v_influence = current_DItap*scaling.kbck*sign(ver_kb)*kcbk*-1;
								h_influence = current_DItap*scaling.kbck*kcbk;
								break;
						}
						break;
					case 2:
						v_influence = current_DItap*scaling.kbck*-1*kcbk;
						h_influence = current_DItap*scaling.kbck*sign(hor_kb)*-1*kcbk;
						break;
					case 3:
						v_influence = current_DItap*scaling.kbck*kcbk;
						h_influence = current_DItap*scaling.kbck*sign(hor_kb)*-1*kcbk;
						break;
					case 4:
						v_influence = current_DItap*scaling.kbck*sign(ver_kb)*kcbk*-1;
						h_influence = current_DItap*scaling.kbck*-1*kcbk;
						break;
					case 5:
						v_influence = current_DItap*scaling.kbck*sign(ver_kb)*kcbk*-1;
						h_influence = current_DItap*scaling.kbck*kcbk;
						break;
					case 6:
						// Variables iniciales
						var Di_direction = 0; // numpad
						var actual_angle = angle;
						//normalizar
						if (actual_angle < 0) {
						    actual_angle += 360;
						}
						if (actual_angle >= 360) {
						    actual_angle -= 360;
						}
						//reflejar
						if (other_dir == -1) {
						    if (actual_angle >= 0 and actual_angle < 90) {
						        actual_angle = 180 - actual_angle;
						    } else if (actual_angle >= 90 and actual_angle < 180) {
						        actual_angle = 180 - actual_angle;
						    } else if (actual_angle >= 180 and actual_angle < 270) {
						        actual_angle = 540 - actual_angle;
						    } else if (actual_angle >= 270 and actual_angle < 360) {
						        actual_angle = 540 - actual_angle;
						    }
						}
						//Di
						if (actual_angle >= 330 and actual_angle < 360) { //8
						    Di_direction = 4; //left
						} else if (actual_angle >= 0 and actual_angle < 30){ //1
						    Di_direction = 4; //left
						} else if (actual_angle >= 30 and actual_angle < 90) { //2
							Di_direction = 2; //down
						}
						else if (actual_angle  == 90) { // : 3
							if other_dir == -1 { Di_direction = 2;  }//down
							else {Di_direction = 2; }//down
						}
						else if (actual_angle > 90 and actual_angle < 150) { //3
						    Di_direction = 2; //down
						} else if (actual_angle >= 150 and actual_angle < 180) { //4
						   Di_direction = 6; //right
						} else if (actual_angle >= 180 and actual_angle < 210) { //5
						   Di_direction = 6; //right
						} else if (actual_angle >= 210 and actual_angle < 270) { //6
						   Di_direction = 8; //up					    
						} else if (actual_angle >= 270 and actual_angle < 330) { //7
						   Di_direction = 8; //up	
						}

						// Aplicar la dirección del DI según el numpad
						switch (Di_direction) {
						    case 8: // Arriba
						        v_influence = current_DItap*scaling.kbck*-1*kcbk;
								h_influence = current_DItap*scaling.kbck*sign(hor_kb)*-1*kcbk;
						        break;
						    case 2: // Abajo
								v_influence = current_DItap*scaling.kbck*kcbk;
								h_influence = current_DItap*scaling.kbck*sign(hor_kb)*-1*kcbk;
						        break;
						    case 4: // Izquierda
								v_influence = current_DItap*scaling.kbck*sign(ver_kb)*kcbk*-1;
								h_influence = current_DItap*scaling.kbck*-1*kcbk;
						        break;
						    case 6: // Derecha
								v_influence = current_DItap*scaling.kbck*sign(ver_kb)*kcbk*-1;
								h_influence = current_DItap*scaling.kbck*kcbk;
						        break;
						}
						break;
					case 7:
						// Variables iniciales
						var Di_direction = 0; // numpad
						var actual_angle = angle;
						//normalizar
						if (actual_angle < 0) {
						    actual_angle += 360;
						}
						if (actual_angle >= 360) {
						    actual_angle -= 360;
						}
						//reflejar
						if (other_dir == -1) {
						    if (actual_angle >= 0 and actual_angle < 90) {
						        actual_angle = 180 - actual_angle;
						    } else if (actual_angle >= 90 and actual_angle < 180) {
						        actual_angle = 180 - actual_angle;
						    } else if (actual_angle >= 180 and actual_angle < 270) {
						        actual_angle = 540 - actual_angle;
						    } else if (actual_angle >= 270 and actual_angle < 360) {
						        actual_angle = 540 - actual_angle;
						    }
						}
						//Di
						if (actual_angle >= 330 and actual_angle < 360) { //8
						    Di_direction = 6; //right
						} else if (actual_angle >= 0 and actual_angle < 30){ //1
						    Di_direction = 8; //up
						} else if (actual_angle >= 30 and actual_angle < 90) { //2
							Di_direction = 6; //right
						}
						else if (actual_angle  == 90) { // : 3
							if other_dir == -1 { Di_direction = 4;  }//left
							else { Di_direction = 6; } //right 
						}
						else if (actual_angle > 90 and actual_angle < 150) { //3
						   Di_direction = 4 //left
						} else if (actual_angle >= 150 and actual_angle < 180) { //4
						   Di_direction = 8; //up
						} else if (actual_angle >= 180 and actual_angle < 210) { //5
						   Di_direction = 4 //left
						} else if (actual_angle >= 210 and actual_angle < 270) { //6
						   Di_direction = 4 //left			    
						} else if (actual_angle >= 270 and actual_angle < 330) { //7
						   Di_direction = 6; //right
						}

						// Aplicar la dirección del DI según el numpad
						switch (Di_direction) {
						    case 8: // Arriba
						        v_influence = current_DItap*scaling.kbck*-1*kcbk;
								h_influence = current_DItap*scaling.kbck*sign(hor_kb)*-1*kcbk;
						        break;
						    case 2: // Abajo
								v_influence = current_DItap*scaling.kbck*kcbk;
								h_influence = current_DItap*scaling.kbck*sign(hor_kb)*-1*kcbk;
						        break;
						    case 4: // Izquierda
								v_influence = current_DItap*scaling.kbck*sign(ver_kb)*kcbk*-1;
								h_influence = current_DItap*scaling.kbck*-1*kcbk;
						        break;
						    case 6: // Derecha
								v_influence = current_DItap*scaling.kbck*sign(ver_kb)*kcbk*-1;
								h_influence = current_DItap*scaling.kbck*kcbk;
						        break;
						}
						break;
					default: break;
				}
			}
		}
		else{
			if input_check_pressed(inputs.k_up, wich_player, 8){//buffer.vertical == ver_buffer.d_up{
				v_influence = current_DItap*scaling.kbck*-1*kcbk;
				h_influence = current_DItap*scaling.kbck*sign(hor_kb)*-1*kcbk;
			}
			if input_check_pressed(inputs.k_left, wich_player, 8){
				v_influence = current_DItap*scaling.kbck*sign(ver_kb)*kcbk*-1;
				h_influence = current_DItap*scaling.kbck*-1*kcbk;
			}
			if input_check_pressed(inputs.k_down, wich_player, 8){
				v_influence = current_DItap*scaling.kbck*kcbk;
				h_influence = current_DItap*scaling.kbck*sign(hor_kb)*-1*kcbk;
			}
			if input_check_pressed(inputs.k_right, wich_player, 8){
				v_influence = current_DItap*scaling.kbck*sign(ver_kb)*kcbk*-1;
				h_influence = current_DItap*scaling.kbck*kcbk;
			}
		}
	}
	//v_influence = current_DItap*scaling.kbck*sign(ver_kb)*kcbk*-1;
	//h_influence = current_DItap*scaling.kbck*kcbk;
	*/
	#endregion
	
	velx = hor_kb;
	vely = ver_kb;
	last_velx = velx;
	last_vely = vely;
	if bbox_collision_function(x + (velx), y, false) and scaling.enemy != noone{
		scaling.enemy.velx = abs(kcbk)*sign(velx)*-0.5;
	}
}

calc_kback(delay_kback.angle, delay_kback.strength, delay_kback.other_dir);