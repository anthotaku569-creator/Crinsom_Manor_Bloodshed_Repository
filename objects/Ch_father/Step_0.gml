/// @description Insert description here
// You can write your code in this editor

event_user(1);

//gravity

if !bbox_place_meeting(self.x,self.y,Collision_normal){
	if state == states.hitstun or state == states.knockdown or state == states.kdown_recovery{
		vely = vely + 1;
	}
	else{
		vely = vely + stats.jump.grav;
	}
}
else{
	vely = 0;
}

if bars.HealthBar.actual < 0{
	bars.HealthBar.actual = 0
}
if bars.HealthBar.actual > bars.HealthBar.maximum{
	bars.HealthBar.actual = bars.HealthBar.maximum
}

guts = (bars.HealthBar.actual)/(bars.HealthBar.maximum); //!!!!!!

//When on top of a moving platform
/*
_floormovement = instance_place(x, y + 1 , Collision_movin)

if _floormovement != noone {
	if y < _floormovement.y {
		x += _floormovement.velx;
		y += _floormovement.vely;
		con_velx = _floormovement.velx;
		con_vely = _floormovement.vely;
	}
}
else if con_velx + con_vely != 0{
		velx += con_velx;
		vely += con_vely;
		con_velx = 0;
		con_vely = 0;
}
*/
#region Functions indeed
#region training mode
/*
function training_settings(){
	enemy_current = match_controller.player_one.current_attack;
	if enemy_current != noone{
		if enemy_current.animation != match_controller.player_one.sprite_index {
			enemy_current = noone;
		}
	}
	function switch_stance(){
		switch(match_controller.training_settings[? "Block Stance"]){
								case 0:
									keyboard_key_release(input_binding_get("down_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
									break;
								case 1:
									keyboard_key_press(input_binding_get("down_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
									break;
								case 2:
									if place_meeting(x, y, hitbox_obj) {
										var frame_block = choose(0, 1);
										if frame_block == 0 {
											keyboard_key_release(input_binding_get("down_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value); 
										}
										else{
											keyboard_key_press(input_binding_get("down_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
										}
									}
									break;
								case 3:
									if !variable_instance_exists(self, "hitbox_bloc"){
										var hitbox_bloc = blc_types.mid;
									}
									if enemy_current != noone{
										//hboxs
										var boxes = array_length(enemy_current.hboxs);
										for (var i = 0; i < boxes; i += 1){
											if (
											match_controller.player_one.image_index < enemy_current.hboxs[i].create + enemy_current.hboxs[i].hbox.duration
											){
												hitbox_bloc = enemy_current.hboxs[i].hbox.bloc;
												break;
											}
										}
									}
									//
									if hitbox_bloc == blc_types.ovh {
										keyboard_key_release(input_binding_get("down_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value); 
									}
									else{
										keyboard_key_press(input_binding_get("down_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
									}
									break;
								default:
									keyboard_key_release(input_binding_get("down_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
									break;
							}
	}
	function switch_stance_parry(){
		if !variable_instance_exists(self, "hitbox_bloc"){
			var hitbox_bloc = blc_types.mid;
		}
		if !variable_instance_exists(self, "parry_time"){
			var parry_time = false;
		}
		if enemy_current != noone{
			//hboxs
			var boxes = array_length(enemy_current.hboxs);
			for (var i = 0; i < boxes; i += 1){
				if (
				match_controller.player_one.image_index < enemy_current.hboxs[i].create and
				match_controller.player_one.image_index > enemy_current.hboxs[i].create - 5
				){
					hitbox_bloc = enemy_current.hboxs[i].hbox.bloc;
					parry_time = true;
					
				}
			}
		}
		switch(match_controller.training_settings[? "Block Stance"]){
								case 0:
									keyboard_key_release(input_binding_get("down_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
									break;
								case 1:
									keyboard_key_press(input_binding_get("down_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
									break;
								case 2:
									if place_meeting(x, y, hitbox_obj) {
										var frame_block = choose(0, 1);
										if frame_block == 0 {
											keyboard_key_release(input_binding_get("down_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value); 
										}
										else{
											keyboard_key_press(input_binding_get("down_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
										}
									}
									break;
								case 3:
									if hitbox_bloc != blc_types.low {
										keyboard_key_release(input_binding_get("down_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value); 
									}
									else{
										keyboard_key_press(input_binding_get("down_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
									}
									break;
								default:
									keyboard_key_release(input_binding_get("down_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
									break;
							}
		if parry_time == true and state == states.block and bars.HitstunBar.actual <= 0 {//
			if input_check("down_p2", 2){
				sprite_index = extras.parry.animations.low;
			}
			else{
				sprite_index = extras.parry.animations.high;
			}
			state = states.parry;
			parry_time = false;
		}
	}
	
	if global.training_mode == true and wich_player == 2 {
			//input_player_source_set(INPUT_SOURCE.NONE, 2)
		if match_controller.training_settings[? "Control"] != 0 {
			input_clear_momentary(true)
			//input_consume(all, 2)
			switch(match_controller.training_settings[? "Control"]){
				case 1:
					switch(match_controller.training_settings[? "Block"]){
						case 3:
							keyboard_key_press(input_binding_get("blc_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
							if extras.parry.can {
								switch_stance_parry()
							}
							break;
						case 2:
							p_bloc.active = true
							p_bloc.duration = 10;
							p_bloc.cooldown = 0;
						case 1:
							switch_stance();
							keyboard_key_press(input_binding_get("blc_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
							break;
						default:
						break;
					}
					switch(match_controller.training_settings[? "Grab parry"]){
						case 1:
							if !variable_instance_exists(self, "hitbox_bloc"){
								var hitbox_bloc = blc_types.mid;
							}
							if enemy_current != noone{
								var boxes = array_length(enemy_current.hboxs);
								if boxes > 0 {
									if (
											match_controller.player_one.image_index < enemy_current.hboxs[0].create + 2 and
											match_controller.player_one.image_index > enemy_current.hboxs[0].create - 2
									){
										hitbox_bloc = enemy_current.hboxs[0].hbox.bloc;
									}
								}
							}
							
							if hitbox_bloc == blc_types.grb {
								keyboard_key_press(input_binding_get("grb_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value); 
							}
							else{
								keyboard_key_release(input_binding_get("grb_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
							}
							break;
						case 2:
							var tech = choose(true, false);
							if state == states.grab and sprite_index == animations.hitstun and tech {
								keyboard_key_press(input_binding_get("grb_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
							}
							else{
								keyboard_key_release(input_binding_get("grb_p2", INPUT_SOURCE.KEYBOARD_AND_MOUSE , 2).value);
							}
							break;
						default: break;
					}
					switch(match_controller.training_settings[? "Inst. Recovery"]){
						case 1:
							if state == states.knockdown {
								if (bars.HitstunBar.actual < 60 and image_index <= 6 and bars.HealthBar.actual > 0){
									bars.HitstunBar.kdwn = 0
									image_index = -1
									bars.HitstunBar.actual = 0
									state = states.kdown_recovery
								}
							}
							break;
						case 2:
							var choosing = choose(0, 1);
							if choosing == 1 {
								if state == states.knockdown {
									if (bars.HitstunBar.actual < 60 and image_index <= 6 and bars.HealthBar.actual > 0){
										bars.HitstunBar.kdwn = 0
										image_index = -1
										bars.HitstunBar.actual = 0
										state = states.kdown_recovery
									}
								}
							}
							break;
						default :
							break;
					}
					if should_reverse == true and bars.HitstunBar.actual == 0 and (state == states.idle or state == states.block) {
						switch(match_controller.training_settings[? "Recovery"]){
							case 1:
								if should_reverse == true and prot = protections.nothing{
									//state = states.idle;
									image_index = -1
									if bbox_collision_function(x, y + 1){
										functionAttackStart(attacks.n_tilt, states.normal_atack);
									}
									else{
										functionAttackStart(attacks.n_air, states.normal_atack);
									}
									should_reverse = false;
								}
								break;
							case 2:
								if  should_reverse == true and prot = protections.nothing{
									//state = states.idle;
									image_index = -1
									if bbox_collision_function(x, y + 1){
										functionAttackStart(attacks.n_u_spe, states.special_atack);
									}
									else{
										functionAttackStart(attacks.a_u_spe, states.special_atack);
									}
									should_reverse = false;
								}
								break;
							case 3:
								if  should_reverse == true and prot = protections.nothing{
									//state = states.idle;
									image_index = -1
									if bbox_collision_function(x, y + 1){
										functionAttackStart(attacks.super_n, states.super_atack);
									}
									else{
										functionAttackStart(attacks.super_a, states.super_atack);
									}
									should_reverse = false;
								}
								break;
							default: break;
						}
					}
					//
					break;
				case 2:
					break;
			}
		}
	}
	else{
		input_clear_momentary(false)
		keyboard_key_release(vk_anykey);
	}
}

training_settings()

*/
	function GetFrameData(){
		if (wich_player == 1) {
			var _enemy = match_controller.player_two;
			if state == states.l_attack or state == states.special_atack
					or state == states.m_attack or state == states.h_attack
					or state == states.super_atack or state == states.landing {
				if _enemy.bars.HitstunBar.actual > 0 or _enemy.stt_effects.paralysis > 0
					or _enemy.state == states.knockdown
					or _enemy.state == states.kdown_recovery{
					frame_data = 0;
				}
				else {
					frame_data -= 1;
				}
			}
			else {
				if _enemy.bars.HitstunBar.actual > 0 or _enemy.stt_effects.paralysis > 0
					or _enemy.state == states.knockdown
					or _enemy.state == states.kdown_recovery {
					frame_data += 1;
				}
			}
			_enemy.frame_data = frame_data*-1;
		}
	}

	if global.training_mode == true{
	GetFrameData();
	}
#endregion

function InspirationGain(){
	if abs(velx) > 0{
		match_controller.modify_blodlust(0.1, wich_player);
	}
}

function auto_turn(){
	if bbox_collision_function(self.x, self.y+1, false){
		if match_controller.x < x {
			image_xscale = -1;
		}
		if match_controller.x > x {
			image_xscale = 1;
		}
	}
}

function movimientoHorizontal(dir){
	if sprite_index != animations.crouch {
		image_speed = 1;
		var curr_speed = stats.ground.ground_speed;
		var walk_animation = animations.walk;
		if image_xscale != dir{
			sprite_index = animations.walkback;
			curr_speed =  stats.ground.ground_speed * 0.5;
		}
		switch(dir){
			case 1:
				if bbox_collision_function(self.x, self.y+1, false){
					if (velx <  curr_speed){
						velx +=  curr_speed - velx;
					}
					else{
						velx += gnd_fric_1;
					}
					sprite_index = walk_animation;
				}
				else{
					if (velx < stats.aerial.max_air_speed){
						if (velx + stats.aerial.air_acc >  stats.aerial.max_air_speed){
							velx += stats.aerial.max_air_speed - velx;
						}
						else{
							velx += stats.aerial.air_acc;
						}
					}
					else{
						velx += air_fric_1;
					}
				}
				stt_effects.burn-=0.5;
				break;
			case -1:
				if bbox_collision_function(self.x, self.y+1, false){
						run_function();
						if (velx > -curr_speed){
							velx += -curr_speed - velx;
						}
						else{
							velx -= gnd_fric_1;
						}
						sprite_index = walk_animation;
				}
				else{
					if (velx > -1 * stats.aerial.max_air_speed){
						if (velx - stats.aerial.air_acc <  -1 * stats.aerial.max_air_speed){
							velx -= stats.aerial.max_air_speed + velx;
						}
						else{
							velx -= stats.aerial.air_acc;
						}
					}
					else{
						velx -= air_fric_1;
					}
				}
				stt_effects.burn-=0.5;
				break;
			default:
				break;
		}
	}
}

function jumpFunction(jump_height){
	vely = -1 * jump_height;
	/*if _floormovement != noone {
		velx += _floormovement.velx;
		vely += _floormovement.vely;
	}*/
	
	
	//right
	if input_check(inputs.k_right, wich_player) and velx < stats.ground.ground_speed{
		velx = stats.ground.ground_speed;
	}
	//left
	if input_check(inputs.k_left, wich_player) and velx > -stats.ground.ground_speed{
		velx = -1*stats.ground.ground_speed;
	}
}

function functionAttackStart(_attack, _state){
	if stopPRYspam(_attack){
		if SpecialCost(_attack){
			actual_startup = 0;
			startup_counter = true;
			scaling.attack = noone;
			
			current_attack = _attack;
			sprite_index = _attack.animation;
			image_index = 0;
			state = _state;
			cancel = false;
			//restart frame data : )
			frame_data = 0;
			
			if not (global.training_mode == true and wich_player == 2 and match_controller.training_settings[? "Control"] == 1) {
				var n_hitboxes = array_length(current_attack.hboxs)
				var n_prots = array_length(current_attack.prots)
	
				//create hitboxes
			
				if n_hitboxes>0{
					for (var i = 0; i < n_hitboxes; i += 1){
						var hitbox_i = current_attack.hboxs[i];
						if(hitbox_i.create == 0){
							if (jump_cancel == true and !bbox_collision_function(x,y+1)) and hitbox_i.hbox.bloc == blc_types.ovh{
								hitbox_i.hbox.bloc = blc_types.mid;
							}
							var created = hitbox_function(self, hitbox_i.hbox);
							if created.bloc == blc_types.pry{
								if (ds_map_exists(active_prys, string(sprite_index))){
									active_prys[? string(sprite_index)] += 1;
								}
								else{
									active_prys[? string(sprite_index)] = 1;
								}
							}
						}
					}
				}
	
				//do protection
				if n_prots>0{
					for (var i = 0; i < n_prots; i += 1){
						var prot_i = current_attack.prots[i];
						if(prot_i.start == 0){
							if i == 0 {
								actual_inv = image_index ;
							}
							prot = prot_i.type
						}
					}
				}
	
				var n_movement = array_length(current_attack.movements)
				//do movement
				if n_movement>0{
					for (var i = 0; i < n_movement; i += 1){
						var movement_i = current_attack.movements[i];
						if(movement_i.start == 0){
			
							if (movement_i.x_speed != 0){
								if sign(velx) == sign(-1*image_xscale*movement_i.x_speed) {
									velx = image_xscale*movement_i.x_speed;
								}
								else{
									if abs(velx) < abs(movement_i.x_speed){
										velx += (image_xscale*movement_i.x_speed) - velx;
									}
									else{
										if bbox_collision_function(self.x, self.y+1){
											velx += gnd_fric_1;
										}
										else{
											velx += air_fric_1;
										}
									}
								}
							}
							else{
								velx = 0
							}
				
							if (movement_i.y_speed != 0){
								vely = movement_i.y_speed;
							}
							else{
								vely = 0
							}
				
						}
						/*else{
							if current_attack.lnd_strng == 4 and image_index > (movement_i.start + 5){
								current_attack.lnd_strng = 3
							}
						}*/
					}
				}
			}
		}
	}
}

function stopPRYspam(_attack){
	if (ds_map_exists(active_prys, string(_attack.animation))){
		if (active_prys[? string(_attack.animation)] <= 0){
			return true;
		}
		else{
			return false;
		}
	}
	else{
		return true;
	}
}

function SpecialCost(_attack){
	var check = false;
	if (_attack.cost <= match_controller.get_bloodlust(wich_player)){
		match_controller.modify_blodlust(-1*_attack.cost, wich_player);
		check = true;
	} else {check = false;}
	return check;
}

function functionCurrentAttack(){
	//sprite_index = current_attack.animation;
	
	var n_hitboxes = array_length(current_attack.hboxs)
	var n_prots = array_length(current_attack.prots)
	
	//create hitboxes
	if n_hitboxes>0{
		for (var i = 0; i < n_hitboxes; i += 1){
			var hitbox_i = current_attack.hboxs[i];
			if(hitbox_i.create == image_index){
				startup_counter = false;
				var created = hitbox_function(self, hitbox_i.hbox);
				if created.bloc == blc_types.pry{
					if (ds_map_exists(active_prys, string(sprite_index))){
						active_prys[? string(sprite_index)] += 1;
					}
					else{
						active_prys[? string(sprite_index)] = 1;
					}
				}
			}
		}
		if startup_counter == true{
			actual_startup ++;
		}
	}
	
	//do protection
	if n_prots>0{
		for (var i = 0; i < n_prots; i += 1){
			var prot_i = current_attack.prots[i];
			if(prot_i.start == image_index ){
				if i == 0 {
					actual_inv = image_index ;
				}
				prot = prot_i.type
			}
			if(prot_i.finish == image_index){
				prot = protections.nothing
			}
		}
	}
	
	var n_movement = array_length(current_attack.movements)
	//do movement
	if n_movement>0{
		for (var i = 0; i < n_movement; i += 1){
			var movement_i = current_attack.movements[i];
			if(movement_i.start == image_index){
			
				if (movement_i.x_speed != 0){
					if sign(velx) == sign(-1*image_xscale*movement_i.x_speed) {
						velx = image_xscale*movement_i.x_speed;
					}
					else{
						if abs(velx) < abs(movement_i.x_speed){
							velx += (image_xscale*movement_i.x_speed) - velx;
						}
						else{
							if bbox_collision_function(self.x, self.y+1){
								velx += gnd_fric_1;
							}
							else{
								velx += air_fric_1;
							}
						}
					}
				}
				else{
					velx = 0
				}
				
				if (movement_i.y_speed != 0){
					vely = movement_i.y_speed;
				}
				else{
					vely = 0
				}
				
			}
			/*else{
				if current_attack.lnd_strng == 4 and image_index > (movement_i.start + 5){
					current_attack.lnd_strng = 3
				}
			}*/
		}
	}
	
	current_attack.scrpt(self);
}

function reduceVelocity(){	
	/*if (vely>0){
		vely -= grav_1/2;
	}*/
	if bbox_collision_function(self.x, self.y+1, false){
		if (velx>0){
			velx += gnd_fric_1/2;
		}
		if (velx<0){
			velx -= gnd_fric_1/2;
		}
	}
	else{
		if (velx>0){
			velx -= air_fric_1/2;
		}
		if (velx<0){
			velx += air_fric_1/2;
		}
	}
	
}

function velocityInfluence(){
	//Automatic DI
	if global.training_mode == true and wich_player == 2 {
		if match_controller.training_settings[? "Control"] != 0 {
			switch (match_controller.training_settings[? "Vel. Influence"]){
				case 1:
					var t_vi = choose(8,4,2,6,5)
					switch(t_vi){
						case 8:
							if abs(vely) > stats.weight.DI_hold and !bbox_collision_function(x, y + 1){
								y -= stats.weight.DI_hold;
							}
							break;
						case 2:
							if abs(vely) > stats.weight.DI_hold and !bbox_collision_function(x, y + 1){
								y += stats.weight.DI_hold;
							}
							break;
						case 4:
							if velx != 0 {
								x -= stats.weight.DI_hold;
							}
							else {
								velx = -1*stats.weight.DI_hold;
							}
							break;
						case 6:
							if velx != 0 {
								x -= stats.weight.DI_hold;
							}
							else {
								velx = -1*stats.weight.DI_hold;
							}
							break;
					}
					break;
				case 2:
					if abs(vely) > stats.weight.DI_hold and !bbox_collision_function(x, y + 1){
						y -= stats.weight.DI_hold;
					}
					break;
				case 3:
					if abs(vely) > stats.weight.DI_hold and !bbox_collision_function(x, y + 1){
						y += stats.weight.DI_hold;
					}
					break;
				case 4:
					if velx != 0 {
						x -= stats.weight.DI_hold;
					}
					else {
						velx = -1*stats.weight.DI_hold;
					}
					break;
				case 5:
					if velx != 0 {
						x -= stats.weight.DI_hold;
					}
					else {
						velx = -1*stats.weight.DI_hold;
					}
					break;
				case 6:
					if scaling.enemy!= noone {//velx != 0 and input_check(inputs.k_right, wich_player){
						if scaling.enemy.x > x{
							if velx != 0 {
								x += stats.weight.DI_hold;
							}
							else {
								velx = stats.weight.DI_hold;
							}
						}
						if scaling.enemy.x < x{
							if velx != 0 {
								x -= stats.weight.DI_hold;
							}
							else {
								velx = -1*stats.weight.DI_hold;
							}
						}
						if scaling.enemy.y < y{
							if abs(vely) > stats.weight.DI_hold and !bbox_collision_function(x, y + 1){
								y -= stats.weight.DI_hold;
							}
						}
						if scaling.enemy.y > y{
							if abs(vely) > stats.weight.DI_hold and !bbox_collision_function(x, y + 1){
								y += stats.weight.DI_hold;
							}
						}
					}
					break;
				case 7:
					if scaling.enemy!= noone{//velx != 0 and input_check(inputs.k_right, wich_player){
						if scaling.enemy.x < x{
							if velx != 0 {
								x += stats.weight.DI_hold;
							}
							else {
								velx = stats.weight.DI_hold;
							}
						}
						if scaling.enemy.x > x{
							if velx != 0 {
								x -= stats.weight.DI_hold;
							}
							else {
								velx = -1*stats.weight.DI_hold;
							}
						}
						if scaling.enemy.y > y{
							if abs(vely) > stats.weight.DI_hold and !bbox_collision_function(x, y + 1){
								y -= stats.weight.DI_hold;
							}
						}
						if scaling.enemy.y < y{
							if abs(vely) > stats.weight.DI_hold and !bbox_collision_function(x, y + 1){
								y += stats.weight.DI_hold;
							}
						}
					}
					break;
				default: break;
			}
		}
	}
	else{
		if input_check(inputs.k_right, wich_player){//velx != 0 and input_check(inputs.k_right, wich_player){
			if velx != 0 {
				x += stats.weight.DI_hold;
			}
			else{
				velx = stats.weight.DI_hold;
			}
		}
		if input_check(inputs.k_left, wich_player){// velx != 0 and input_check(inputs.k_left, wich_player){
			if velx != 0 {
				x -= stats.weight.DI_hold;
			}
			else {
				velx = -1*stats.weight.DI_hold;
			}
		}
	}
}

function perfect_bloc(){
	var perfect_check = false
	
	if state == states.idle or state == states.block or state == states.run or state == states.air_dash{
		if (input_check_pressed(inputs.k_left, wich_player, 3) and image_xscale == 1)
			or (input_check_pressed(inputs.k_right, wich_player, 3) and image_xscale == -1){
			perfect_check = true;
		}
	}
	
	if perfect_check {
		if p_bloc.active != true and p_bloc.cooldown <= 0{
			p_bloc.active = true
		}
	}
	if p_bloc.active == true{
		p_bloc.duration --;
		if p_bloc.duration <= 0{
			if global.training_mode == true and wich_player == 2 
				and match_controller.training_settings[? "Block"] == 2{
				p_bloc.duration = 10;
				p_bloc.cooldown = 0;
			}
			else{
				p_bloc.active = false
				p_bloc.duration = 10;
				p_bloc.cooldown = 5;
			}
		}
	}
	if p_bloc.cooldown > 0{
		p_bloc.cooldown--
	}
}

function poison_state(){
	if (stt_effects.poison > 0){
		stt_effects.poison -= 1;
		if (stt_effects.poison mod 60 == 0){
			if sprite_index == animations.walk {//or sprite_index == animations.run {
				bars.HealthBar.actual -= 2.5;
			}
			else{
				bars.HealthBar.actual -= 1;
			}
		}
		if (stt_effects.poison mod 5 == 0){
			particle_function(
			Spr_poison_particle,
			x,y-abs(bbox_top-bbox_bottom)/2,
			abs(bbox_left-bbox_right)/2,abs(bbox_top-bbox_bottom)/2
			)
		}
	}
	else if stt_effects.poison < 0{
		stt_effects.poison = 0;
	}
}

function regenerate_state(){
	if (stt_effects.regenerate > 0){
		stt_effects.regenerate -= 1;
		if (stt_effects.regenerate mod 60 == 0){
			bars.HealthBar.actual += 1.5;
		}
		if (stt_effects.regenerate mod 5 == 0){
			particle_function(
			Spr_regenerate_particle,
			x,y-abs(bbox_top-bbox_bottom)/2,
			abs(bbox_left-bbox_right)/2,abs(bbox_top-bbox_bottom)/2
			)
		}
	}
	else if stt_effects.regenerate < 0{
		stt_effects.regenerate = 0;
	}
}

function curse_state(){
	if (stt_effects.curse > 0){
		stt_effects.curse -= 1;
		if (stt_effects.curse mod 60 == 0){
			match_controller.modify_blodlust(-1.5, wich_player);
		}
		if (stt_effects.curse mod 5 == 0){
			particle_function(
			Spr_curse_particle,
			x,y-abs(bbox_top-bbox_bottom)/2,
			abs(bbox_left-bbox_right)/2,abs(bbox_top-bbox_bottom)/2
			)
		}
	}
	else if stt_effects.curse < 0{
		stt_effects.curse = 0;
	}
}

function passion_state(){
	if (stt_effects.passion > 0){
		stt_effects.passion -= 1;
		if (stt_effects.passion mod 60 == 0){
			match_controller.modify_blodlust(1.5, wich_player);
		}
		if (stt_effects.passion mod 10 == 0){
			particle_function(
			Spr_passion_particle,
			x,y-abs(bbox_top-bbox_bottom)/2,
			abs(bbox_left-bbox_right)/2,abs(bbox_top-bbox_bottom)/2
			)
		}
	}
	else if stt_effects.passion < 0{
		stt_effects.curse = 0;
	}
}

function cold_state(){
	if (stt_effects.cold > 0){
		stt_effects.cold -= 1;
		if (state == states.normal_atack or state == states.special_atack or state == states.super_atack){
			if image_index mod 2 != 0{
				image_speed = 0.5;
			}
			else{
					image_speed = 1;
			}
		}
		else if state != states.grab or state != states.round_finish {
			image_speed = 1;
		}
		if (stt_effects.cold mod 5 == 0){
			particle_function(
			Spr_cold_particle,
			x,y-abs(bbox_top-bbox_bottom)/2,
			abs(bbox_left-bbox_right)/2,abs(bbox_top-bbox_bottom)/2
			)
		}
	}
	else if stt_effects.cold <= 0{
		stt_effects.cold = 0;
		if state != states.grab{
			image_speed = 1;
		}
	}
}

function burn_state(){
	if (stt_effects.burn > 0){
		stt_effects.burn -= 1;
		if (stt_effects.burn mod 5 == 0){
			particle_function(
			Spr_burn_particle,
			x,y-abs(bbox_top-bbox_bottom)/2,
			abs(bbox_left-bbox_right)/2,abs(bbox_top-bbox_bottom)/2
			)
		}
	}
	else if stt_effects.burn < 0 {
		stt_effects.burn = 0;
	}
}

function berserker_state(){
	if (stt_effects.berserker > 0){
		stt_effects.berserker -= 1;
		if (stt_effects.berserker mod 5 == 0){
			particle_function(
			Spr_berserker_particle,
			x,y-abs(bbox_top-bbox_bottom)/2,
			abs(bbox_left-bbox_right)/2,abs(bbox_top-bbox_bottom)/2
			)
		}
	}
	else if stt_effects.berserker < 0 {
		stt_effects.berserker = 0;
	}
}

function blocking_function() {
	if !(input_check(inputs.k_right, wich_player) and input_check(inputs.k_left, wich_player)){
		if state == states.idle or state == states.block or state == states.run or state == states.air_dash{
			if (input_check(inputs.k_left, wich_player, 3) and image_xscale == 1)
				or (input_check(inputs.k_right, wich_player, 3) and image_xscale == -1){
				return true;
			}
		}
	}
	return false;
}

function block_near(){
	var _enemy_hit = instance_place(x + 24*image_xscale, y, hitbox_obj )
	if !(input_check(inputs.k_right, wich_player) and input_check(inputs.k_left, wich_player)){
		if blocking_function() and _enemy_hit!= noone and _enemy_hit.master != self{
			return true;
		}
	}
	return false;
}

#region attack functions

	function light_attack(){
		if cancel == true {
			if bbox_collision_function(x, y + 1){
				if input_check_pressed(inputs.k_L, wich_player, 3) and !input_check(inputs.k_up, wich_player){
					if state != states.run{
						run_framedata = 0;
					}
					if input_check(inputs.k_down, wich_player){
						functionAttackStart(attacks.d_L, states.l_attack)
					}
					else if input_check(inputs.k_left, wich_player) and image_xscale == -1{
						functionAttackStart(attacks.f_L, states.l_attack)
					}
					else if input_check(inputs.k_right, wich_player) and image_xscale == 1{
						functionAttackStart(attacks.f_L, states.l_attack)
					}
					else{
						functionAttackStart(attacks.n_L, states.l_attack)
					}
				}
			}
			else{
				if input_check_pressed(inputs.k_L, wich_player, 3){
					if state != states.run{
						run_framedata = 0;
					}
					functionAttackStart(attacks.j_L, states.l_attack)
				}
			}
		}
	}

	function medium_attack(){
		if cancel == true {
			if bbox_collision_function(x, y + 1){
				if input_check_pressed(inputs.k_M, wich_player, 3) and !input_check(inputs.k_up, wich_player){
					if state != states.run{
						run_framedata = 0;
					}
					if input_check(inputs.k_down, wich_player){
						
						functionAttackStart(attacks.d_M, states.m_attack)
					}
					else{
						functionAttackStart(attacks.n_M, states.m_attack)
					}
				}
			}
			else{
				if input_check_pressed(inputs.k_M, wich_player, 3){
						functionAttackStart(attacks.j_M, states.m_attack)
				}
			}
		}
	}

	function heavy_attack(){
		if cancel == true {
			if bbox_collision_function(x, y + 1){
				if input_check_pressed(inputs.k_H, wich_player, 3) and !input_check(inputs.k_up, wich_player){
					if state != states.run{
						run_framedata = 0;
					}
					if input_check(inputs.k_left, wich_player) and image_xscale == 1{
						functionAttackStart(attacks.b_H, states.h_attack)
					}
					else if input_check(inputs.k_right, wich_player) and image_xscale == -1{
						functionAttackStart(attacks.b_H, states.h_attack)
					}
					else if input_check(inputs.k_down, wich_player){
						functionAttackStart(attacks.d_H, states.h_attack)
					}
					else{
						functionAttackStart(attacks.n_H, states.h_attack)
					}
				}
			}
			else{
				if input_check_pressed(inputs.k_H, wich_player, 3){
					if state != states.run{
						run_framedata = 0;
					}
					functionAttackStart(attacks.j_H, states.h_attack);
				}
			}
		}
	}

	function special_attack(){
		if cancel == true {
			if bbox_collision_function(x, y + 1, false){
				if input_check_pressed(inputs.k_S1, wich_player, 3){
					functionAttackStart(attacks.n_S_one, states.special_atack);
				}
				else if input_check_pressed(inputs.k_S2, wich_player, 3){
					functionAttackStart(attacks.n_S_two, states.special_atack);
				}
				else if input_check_pressed(inputs.k_S3, wich_player, 3){
					functionAttackStart(attacks.n_S_three, states.special_atack);
				}
			}
			else{
				if input_check_pressed(inputs.k_S1, wich_player, 3){
					functionAttackStart(attacks.a_S_one, states.special_atack);
				}
				else if input_check_pressed(inputs.k_S2, wich_player, 3){
					functionAttackStart(attacks.a_S_two, states.special_atack);
				}
				else if input_check_pressed(inputs.k_S3, wich_player, 3){
					functionAttackStart(attacks.a_S_three, states.special_atack);
				}
			}
		}
	}

	function grab_attack(){
		if input_check_pressed(inputs.k_L, wich_player, 3) and input_check_pressed(inputs.k_M, wich_player, 3) {
			if bbox_collision_function(x, y + 1){
				functionAttackStart(attacks.grab, states.m_attack);
			}
			else{
				functionAttackStart(attacks.a_grab, states.m_attack);
			}
		}
	}

	function parry_function(){
		if input_check_pressed(inputs.k_M, wich_player, 3) and input_check_pressed(inputs.k_H, wich_player, 3) {
			if bbox_collision_function(x, y + 1){
				if input_check(inputs.k_down, wich_player){
					sprite_index = extras.parry.animations.low;
					image_index = 0;
				}
				else{
					sprite_index = extras.parry.animations.high;
					image_index = 0;
				}
				state = states.parry;
			}
		}
	}
/*

function special_attack(){
	if cancel == true{
		//actual_startup = 0;
		if bbox_collision_function(x, y + 1){
			//specials
			if input_check_pressed(inputs.k_spe, wich_player,3){
				if input_check(inputs.k_right, wich_player){
					image_xscale = 1;
					if input_check(inputs.k_down, wich_player){
						functionAttackStart(attacks.n_fd_spe, states.special_atack);
					}
					else if input_check(inputs.k_up, wich_player){
						functionAttackStart(attacks.n_fu_spe, states.special_atack);
					}
					else{
						functionAttackStart(attacks.n_f_spe, states.special_atack);
					}
				}
				else if input_check(inputs.k_left, wich_player){
					image_xscale = -1;
					if input_check(inputs.k_down, wich_player){
						functionAttackStart(attacks.n_fd_spe, states.special_atack);
					}
					else if input_check(inputs.k_up, wich_player){
						functionAttackStart(attacks.n_fu_spe, states.special_atack);
					}
					else{
						functionAttackStart(attacks.n_f_spe, states.special_atack);
					}
				}
				else if input_check(inputs.k_down, wich_player){
					functionAttackStart(attacks.n_d_spe, states.special_atack);
				}
				else if input_check(inputs.k_up, wich_player){
					functionAttackStart(attacks.n_u_spe, states.special_atack);
				}
				else{
					functionAttackStart(attacks.n_n_spe, states.special_atack)
				}
			}
		}
		else{
			if input_check_pressed(inputs.k_spe, wich_player,3){	
				if input_check(inputs.k_right, wich_player){
					image_xscale = 1;
					if input_check(inputs.k_down, wich_player){
						functionAttackStart(attacks.a_fd_spe, states.special_atack);
					}
					else if input_check(inputs.k_up, wich_player){
						functionAttackStart(attacks.a_fu_spe, states.special_atack);
					}
					else{
						functionAttackStart(attacks.a_f_spe, states.special_atack);
					}
				}
				else if input_check(inputs.k_left, wich_player){
					image_xscale = -1;
					if input_check(inputs.k_down, wich_player){
						functionAttackStart(attacks.a_fd_spe, states.special_atack);
					}
					else if input_check(inputs.k_up, wich_player){
						functionAttackStart(attacks.a_fu_spe, states.special_atack);
					}
					else{
						functionAttackStart(attacks.a_f_spe, states.special_atack);
					}
				}
				else if input_check(inputs.k_down, wich_player){
					functionAttackStart(attacks.a_d_spe, states.special_atack);
				}
				else if input_check(inputs.k_up, wich_player){
					functionAttackStart(attacks.a_u_spe, states.special_atack);
				}
				else{
					functionAttackStart(attacks.a_n_spe, states.special_atack)
				}
			}
		}
		cancel = false;
	}
}

*/
#endregion

function floating(){
	
	if extras.float.time > 120{
		extras.float.time = 120
	}
	if extras.float.time < 0{
		extras.float.time = 0
	}
	if !bbox_collision_function(self.x, self.y+1, true){
		if extras.float.can and extras.float.time > 0 and vely >= 0 {
			if (input_check(inputs.k_up, wich_player) 
				and !input_check(inputs.k_up, wich_player, 3))
				or (input_check(inputs.k_up, wich_player) 
				and input_check(inputs.k_down, wich_player)){
				extras.float.time--;
				vely = 0;
				image_speed = 1;
				sprite_index = extras.float.animation;
			}
		}
	}
}

function dodge_function(){
	if input_check_double_pressed(inputs.k_right, wich_player, 3) and image_xscale == -1{
		image_index = 0;
		cancel = false;
		sprite_index = dodge_properties.animation;
		state = states.dodge;
	}
	else if input_check_double_pressed(inputs.k_left, wich_player, 3) and image_xscale == 1 {
		image_index = 0;
		cancel = false;
		sprite_index = dodge_properties.animation;
		state = states.dodge;
	}
}

function run_function(){
	
	/*
	if image_xscale == 1 {
					if input_check(inputs.k_right, wich_player) and abs(velx) > 0 {
						if (velx <  extras.run.velx){
							velx +=  extras.run.velx - velx;
						}
						else{
							velx += gnd_fric_1;
						}
					}
					else{
						image_index = 0;
						sprite_index = extras.run.stop;
						dodge_function();
					}
				}
				else if image_xscale == -1 {
					if input_check(inputs.k_left, wich_player) and abs(velx) > 0{
						if (velx > -extras.run.velx){
							velx += -extras.run.velx - velx;
						}
						else{
							velx -= gnd_fric_1;
						}
					}
					else{
						image_index = 0;
						sprite_index = extras.run.stop;
					}
				}
			
	*/
	
	if (extras.run.can == true){
		if input_check_double_pressed(inputs.k_right, wich_player, 3) and image_xscale == 1{
			/*if (velx <  extras.run.velx){
				velx +=  extras.run.velx - velx;
			}
			else{
				velx += gnd_fric_1;
			}*/
			sprite_index = extras.run.animation;
			image_xscale = 1
			run_framedata++;
			state = states.run;
		}
		else if input_check_double_pressed(inputs.k_left, wich_player, 3) and image_xscale == -1 {
			/*if (velx > -extras.run.velx){
				velx += -extras.run.velx - velx;
			}
			else{
				velx -= gnd_fric_1;
			}*/
			
			sprite_index = extras.run.animation;
			image_xscale = -1
			run_framedata++;
			state = states.run;
		}
	}
}

function redeye_activation(){
	if input_check_pressed(inputs.k_L, wich_player, 3)
		and input_check_pressed(inputs.k_M, wich_player, 3)
		and input_check_pressed(inputs.k_H, wich_player, 3) {
		if (25 <= match_controller.get_bloodlust(wich_player)){
			match_controller.modify_blodlust(-25, wich_player);
			image_index = 0;
			state = states.curse_eye;
			sprite_index = animations.redeye.redpause;
			}
		}
}

function dying(){
	if bars.HealthBar.actual == 0 and global.training_mode == false{
		bars.HealthBar.actual = -1
		if state != states.knockdown and bbox_collision_function(x, y + 1) {
			image_index = -1
			sprite_index = animations.death
		}
		match_controller.round_end(wich_player)
		match_controller.timer_activ = false;
	}
	
}

function Health_Show(){
	if bars.HealthBar.actual != bars.HealthBar.show and  bars.HitstunBar.actual == 0 {
		if global.training_mode == true{
			 bars.HealthBar.actual =  bars.HealthBar.maximum;
		}
		else{
			bars.HealthBar.show = (( bars.HealthBar.actual + 9 * bars.HealthBar.show) / 10) + ((stt_effects.regenerate/60) * 1.5);
		}
	}
}

Health_Show();

#endregion

#region state machine

perfect_bloc();

switch(state){
	case states.idle:
		#region idle
		//Remeber: Allways hittable in idle
		prot = protections.nothing
		techable = true;
		//resetting scaling
		scaling.dmg = 1;
		scaling.kbck = 1;
		scaling.combo = 0;
		scaling.enemy = noone;
		scaling.attack = noone;
		run_framedata = 0;
		//scaling.cum_dmg = 0;
		InspirationGain()
		bars.Charge.actual += 1
		cancel = true;
		//Infinite in training mode
		if global.training_mode == true{
			match_controller.modify_blodlust(50 - match_controller.get_bloodlust(wich_player), wich_player);
		}
		
		///Horizontal movement
		//right
		if !(input_check(inputs.k_right, wich_player) and input_check(inputs.k_left, wich_player)){
			if input_check(inputs.k_right, wich_player){
				movimientoHorizontal(1)
			}
			//left
			if input_check(inputs.k_left, wich_player){
				movimientoHorizontal(-1)
			}
		}
		//On ground
		if bbox_collision_function(self.x, self.y+1) {
			jump_cancel = true;
			extras.air_dash.able = true;
			extras.float.time++;
			//crouch
			if input_check(inputs.k_down, wich_player){
				sprite_index = animations.crouch;
			}
			else {
				//full stop
				if input_check_released(inputs.k_right, wich_player)
					or input_check_released(inputs.k_left, wich_player)
					or input_check_released(inputs.k_down, wich_player){
					velx = 0
					sprite_index=animations.idle;
				}
			}
			//jump
			if input_check(inputs.k_up, wich_player, 3){
				jumpFunction(stats.jump.j_heigh);
			}
			
			//revert to idle when landing
			if sprite_index == animations.air.rising or sprite_index = animations.air.falling
				//or sprite_index == extras.float.animation{
				{
				sprite_index=animations.idle;
			}
			run_function();
			
			//ground o special normals
			if !input_check(inputs.k_up, wich_player){
				light_attack();
				medium_attack();
				heavy_attack();
				parry_function();
				dodge_function();
				special_attack();
				grab_attack();
			}
			
			extras.d_jmp.can = true;
			
		}
		else{
			//animations
			if (vely < 0) {
				sprite_index = animations.air.rising;
			}
			else{
				sprite_index = animations.air.falling;
				floating();
			}
			//jump
			if input_check_pressed(inputs.k_up, wich_player, 3){
				if (extras.d_jmp.has == true and extras.d_jmp.can == true and vely > 0){
					jumpFunction(stats.jump.j_heigh);
					extras.d_jmp.can = false;						
				}
			}
			
			//AIR DASHING
			if extras.air_dash.able == true and vely > (stats.jump.j_heigh *-1)*3/4 {
				if input_check_double_pressed(inputs.k_right, wich_player, 3) {
					sprite_index = extras.air_dash.animation;
					image_index = 0;
					image_xscale = 1;
					state = states.air_dash;
				}
				else if input_check_double_pressed(inputs.k_left, wich_player, 3) {
					sprite_index = extras.air_dash.animation;
					image_index = 0;
					image_xscale = -1;
					state = states.air_dash;
				}
			}
			
			//aerial normals
				light_attack();
				medium_attack();
				heavy_attack();
				special_attack();
				grab_attack();
		}
		
		auto_turn();
		//blocking
		if block_near(){
			state = states.block
		}
		redeye_activation();
		break;
		#endregion
	case states.h_attack:
		#region normal attack
		functionCurrentAttack();
		InspirationGain();
		if image_index < 2 {
			parry_function();
		}
		if (bbox_collision_function(self.x, self.y+1, pass)) {
			if  input_check(inputs.k_up, wich_player, 3) and cancel == true{
				jumpFunction(stats.jump.j_heigh);
				state = states.idle;
			}
		
			
			switch(current_attack.lnd_strng){
				case 1:
					sprite_index = animations.landing.light;
					image_index = 0;
					state = states.landing;
					break;
				case 2:
					sprite_index = animations.landing.medium;
					image_index = 0;
					state = states.landing;
					break;
				case 3:
					sprite_index = animations.landing.heavy;
					image_index = 0;
					state = states.landing;
					break;
				case 4:
					var n_movement = array_length(current_attack.movements)
					if n_movement>0{
						var movement_i = current_attack.movements[0];
						if image_index > (movement_i.start){
							sprite_index = animations.landing.heavy;
							image_index = 0;
							state = states.landing;
						}
					}
					else{
						sprite_index = animations.landing.heavy;
						image_index = 0;
						state = states.landing;					
					}
					break;
				case 5:
					var n_movement = array_length(current_attack.movements)
					if n_movement>0{
						var movement_i = current_attack.movements[0];
						if image_index > (movement_i.start){
							sprite_index = animations.landing.medium;
							image_index = 0;
							state = states.landing;
						}
					}
					else{
						sprite_index = animations.landing.medium;
						image_index = 0;
						state = states.landing;					
					}
					break;
				default:
					break;
			}
		}
		else{
			//jump
			if input_check(inputs.k_up, wich_player, 3)  and cancel == true{
				if (extras.d_jmp.has == true and extras.d_jmp.can == true and vely > 0){
					jumpFunction(stats.jump.j_heigh);
					extras.d_jmp.can = false;
					state = states.idle;						
				}
			}
		}
		
		if (image_index == image_number - 1){
			state = states.idle;
	
			if bbox_collision_function(self.x, self.y+1){
				if input_check(inputs.k_down, wich_player){
					sprite_index = animations.crouch;
				}
				else{sprite_index = animations.idle;}
			}
			else{
				if (vely < 0) {
					sprite_index = animations.air.rising
				}
				else{
					sprite_index = animations.air.falling
				}
			}
		}
		special_attack();
		redeye_activation();
		break;
		#endregion	
	case states.m_attack:
		#region normal attack
		functionCurrentAttack();
		InspirationGain();
		
		if (bbox_collision_function(self.x, self.y+1, pass)) {
			if cancel == true and run_framedata < 4{
				run_function();
			}
			switch(current_attack.lnd_strng){
				case 1:
					sprite_index = animations.landing.light;
					image_index = 0;
					state = states.landing;
					break;
				case 2:
					sprite_index = animations.landing.medium;
					image_index = 0;
					state = states.landing;
					break;
				case 3:
					sprite_index = animations.landing.heavy;
					image_index = 0;
					state = states.landing;
					break;
				case 4:
					var n_movement = array_length(current_attack.movements)
					if n_movement>0{
						var movement_i = current_attack.movements[0];
						if image_index > (movement_i.start){
							sprite_index = animations.landing.heavy;
							image_index = 0;
							state = states.landing;
						}
					}
					else{
						sprite_index = animations.landing.heavy;
						image_index = 0;
						state = states.landing;					
					}
					break;
				case 5:
					var n_movement = array_length(current_attack.movements)
					if n_movement>0{
						var movement_i = current_attack.movements[0];
						if image_index > (movement_i.start){
							sprite_index = animations.landing.medium;
							image_index = 0;
							state = states.landing;
						}
					}
					else{
						sprite_index = animations.landing.medium;
						image_index = 0;
						state = states.landing;					
					}
					break;
				default:
					break;
			}
		}
		else if cancel == true{
			//AIR DASHING
			if extras.air_dash.able == true and vely > (stats.jump.j_heigh *-1)*3/4 {
				if input_check_double(inputs.k_right, wich_player, 3) {
					sprite_index = extras.air_dash.animation;
					image_index = 0;
					image_xscale = 1;
					state = states.air_dash;
				}
				else if input_check_double(inputs.k_left, wich_player, 3) {
					sprite_index = extras.air_dash.animation;
					image_index = 0;
					image_xscale = -1;
					state = states.air_dash;
				}
			}
			
		}
		
		if (image_index == image_number - 1){
			state = states.idle;
	
			if bbox_collision_function(self.x, self.y+1){
				if input_check(inputs.k_down, wich_player){
					sprite_index = animations.crouch;
				}
				else{sprite_index = animations.idle;}
			}
			else{
				if (vely < 0) {
					sprite_index = animations.air.rising
				}
				else{
					sprite_index = animations.air.falling
				}
			}
		}
		heavy_attack();
		special_attack();
		redeye_activation();
		if image_index < 2 {
			grab_attack();
			parry_function();
		}
		break;
		#endregion	
	case states.l_attack:
		#region normal attack
		functionCurrentAttack();
		InspirationGain();
		
		if (bbox_collision_function(self.x, self.y+1, pass)) {
			switch(current_attack.lnd_strng){
				case 1:
					sprite_index = animations.landing.light;
					image_index = 0;
					state = states.landing;
					break;
				case 2:
					sprite_index = animations.landing.medium;
					image_index = 0;
					state = states.landing;
					break;
				case 3:
					sprite_index = animations.landing.heavy;
					image_index = 0;
					state = states.landing;
					break;
				case 4:
					var n_movement = array_length(current_attack.movements)
					if n_movement>0{
						var movement_i = current_attack.movements[0];
						if image_index > (movement_i.start){
							sprite_index = animations.landing.heavy;
							image_index = 0;
							state = states.landing;
						}
					}
					else{
						sprite_index = animations.landing.heavy;
						image_index = 0;
						state = states.landing;					
					}
					break;
				case 5:
					var n_movement = array_length(current_attack.movements)
					if n_movement>0{
						var movement_i = current_attack.movements[0];
						if image_index > (movement_i.start){
							sprite_index = animations.landing.medium;
							image_index = 0;
							state = states.landing;
						}
					}
					else{
						sprite_index = animations.landing.medium;
						image_index = 0;
						state = states.landing;					
					}
					break;
				default:
					break;
			}
		}
		
		if (image_index == image_number - 1){
			state = states.idle;
	
			if bbox_collision_function(self.x, self.y+1){
				if input_check(inputs.k_down, wich_player){
					sprite_index = animations.crouch;
				}
				else{sprite_index = animations.idle;}
			}
			else{
				if (vely < 0) {
					sprite_index = animations.air.rising
				}
				else{
					sprite_index = animations.air.falling
				}
			}
		}
		heavy_attack();
		medium_attack();
		light_attack();
		special_attack();
		redeye_activation();
		if image_index < 2 {
			grab_attack();
		}
		break;
		#endregion
	case states.landing:
		#region landing state
		pass = false;
		redeye_activation();
		var duration = image_number;
		if !bbox_collision_function(self.x, self.y+1, pass){
			state = states.idle;
	
			if bbox_collision_function(self.x, self.y+1, pass){
				sprite_index = animations.idle;
			}
			else{
				if (vely < 0) {
					sprite_index = animations.air.rising
				}
				else{
					sprite_index = animations.air.falling
				}
			}
		}
		break;
		#endregion
	case states.hitstun:
		#region hitstun
		redeye_activation();
		run_framedata = 0;
		pass = false;
		techable = false;
		image_speed=1;
		prot = protections.nothing;
		
		if scaling.enemy!= noone{
			if scaling.enemy.state == states.idle{
				scaling.attack = noone;
			}
		}
		
		if (bars.HitstunBar.actual<=0 and stt_effects.paralysis <= 0){
			bars.HitstunBar.actual = 0;
			stt_effects.paralysis = 0;
			
			if sprite_index == animations.thumble{
				jumpFunction(6)
				prot = protections.full;
				image_index = -1
				state = states.kdown_recovery
				bars.HitstunBar.kdwn = 0
				bars.HitstunBar.actual = 0
			}
			else{
			
				state = states.idle;
				if bbox_collision_function(self.x, self.y+1, pass){
					sprite_index = animations.idle;
				}
				else{
					if (vely < 0) {
						sprite_index = animations.air.rising
					}
					else{
						sprite_index = animations.air.falling
					}
				}
			}
			
			
		}
		else if (stt_effects.paralysis <= 0) {
			reduceVelocity()
			velocityInfluence()
			bars.HitstunBar.actual --;
			if (sprite_index == animations.paralyze) {
				sprite_index = animations.hitstun;
			}
			if (sprite_index == animations.hitstun) {
				image_index = bars.HitstunBar.actual;
				if (!bbox_collision_function(self.x, self.y + 1, pass)){
					sprite_index = animations.thumble;
					scaling.kbck = scaling.kbck*1.2
					bars.HitstunBar.kdwn = 1;
				}
				else{
					bars.HitstunBar.kdwn = 0;
				}
			}
			if (sprite_index == animations.thumble
				and bbox_collision_function(self.x, self.y + 1, pass)
				and vely >= 0){
					image_index = -1
					state = states.knockdown
					scaling.dmg = scaling.dmg*1.5
					if (scaling.enemy.current_attack != scaling.enemy.attacks.empty){
						scaling.enemy = noone
					}
			}
		}
		else {
			sprite_index = animations.paralyze;
			stt_effects.paralysis--;
			alarm[0] = 1
			velx = 0;
			vely = 0;
		}
				
		// Bouncing
		if bbox_collision_function(self.x, self.y + 1, pass) and (vely) >= 20{
			vely = vely * -0.5;
		}
		dying();
		
		break;
		#endregion
	case states.knockdown:
		#region knockdown
		redeye_activation();
		run_framedata = 0;
		pass = false;
		
		if scaling.enemy!= noone{
			if scaling.enemy.state == states.idle{
				scaling.attack = noone;
			}
		}
		reduceVelocity()
		
		if (image_index > 15) {
			prot = protections.full;	
		}
		else{
			prot = protections.grab_invul;	
		}
		if (bars.HitstunBar.kdwn == 1){
			sprite_index = animations.kdown.light
			if (image_index <= 6
				and input_check_pressed(inputs.k_L, wich_player, 6)
				and  bars.HealthBar.actual > 0){
				prot = protections.full;
				image_index = -1
				state = states.kdown_recovery
				bars.HitstunBar.kdwn = 0
				bars.HitstunBar.actual = 0
			}
		}
		else{
			sprite_index = animations.kdown.heavy
		}
		
		//
		if (scaling.enemy != noone and (scaling.enemy.state == states.idle)){
			if scaling.enemy.current_attack != scaling.enemy.attacks.empty or (no_infinte == true){
				prot = protections.full;
				state = states.kdown_recovery
				bars.HitstunBar.kdwn = 0
				image_index = -1
				bars.HitstunBar.actual = 0
			}
		}
		
		
		// Bouncing
		if bbox_collision_function(self.x, self.y + 1, pass) and (vely) > 16{
			vely = vely * -0.8;
		}
		
		dying();
		
		break;
		#endregion
	case states.kdown_recovery:
		#region techs and kdown
		redeye_activation();
		run_framedata = 0;
		pass = false;
		prot = protections.full;
		sprite_index = animations.landing.heavy;
		no_infinte = false;
		break;
		#endregion
	case states.block:
		#region blocking
		redeye_activation();
		run_framedata = 0;
		//blocking
		if (bars.HitstunBar.actual<=0) {
			bars.HitstunBar.actual = 0;
			if bbox_collision_function(self.x, self.y+1, pass){
				if input_check(inputs.k_down, wich_player){
					sprite_index = animations.bloc.low
				}
				else{
					sprite_index = animations.bloc.high
				}
				parry_function();
			}
			else{				
				sprite_index = animations.bloc.air
			}
			//blocking
			if !block_near(){
				//show_debug_message("Fin del bloqueo - " + string(wich_player));
				state = states.idle
			}
		}
		else{
			reduceVelocity()
			bars.HitstunBar.actual--;
			if bbox_collision_function(self.x, self.y+1){
				if input_check(inputs.k_down, wich_player){
					sprite_index = animations.blocstun.low
				}
				else{
					sprite_index = animations.blocstun.high
				}
			}
			else{
				sprite_index = animations.blocstun.air
			}
		}
		break;
		techable = true;
		#endregion
	case states.grab:
		pass = false;
		grabing.grb_script(grabing._graber,grabing._victim);
		break;
	case states.dodge:
		#region doji
		redeye_activation();
		pass = false;
		stt_effects.burn-=0.5;
		techable = false;
		if image_index < dodge_properties.inv_length{
			prot = protections.full;
			if bbox_place_meeting(x,y, hitbox_obj){
				cancel = true;
			}
		}
		else{
			prot = protections.nothing;
		}
		if image_index == dodge_properties.startup {
			velx = dodge_properties.velx * image_xscale * -1;
			vely = dodge_properties.vely;
		}
		
		light_attack();
		medium_attack();
		heavy_attack();
		
		break;
		#endregion
	case states.special_atack:
		#region special attacks
		pass = false;
		functionCurrentAttack();
		if state != states.run{
			run_framedata = 0;
		}
		if (bbox_collision_function(self.x, self.y+1, pass) and vely > 0) {
			switch(current_attack.lnd_strng){
				case 1:
					sprite_index = animations.landing.light;
					image_index = 0;
					state = states.landing;
					break;
				case 2:
					sprite_index = animations.landing.medium;
					image_index = 0;
					state = states.landing;
					break;
				case 3:
					sprite_index = animations.landing.heavy;
					image_index = 0;
					state = states.landing;
					break;
				case 4:
					var n_movement = array_length(current_attack.movements)
					if n_movement>0{
						var movement_i = current_attack.movements[0];
						if image_index > (movement_i.start){
							sprite_index = animations.landing.heavy;
							image_index = 0;
							state = states.landing;
						}
					}
					else{
						sprite_index = animations.landing.heavy;
						image_index = 0;
						state = states.landing;					
					}
					break;
				case 5:
					var n_movement = array_length(current_attack.movements)
					if n_movement>0{
						var movement_i = current_attack.movements[0];
						if image_index > (movement_i.start){
							sprite_index = animations.landing.medium;
							image_index = 0;
							state = states.landing;
						}
					}
					else{
						sprite_index = animations.landing.medium;
						image_index = 0;
						state = states.landing;					
					}
					break;
				default:
					break;
			}
		}
		
		if (image_index == image_number - 1) {
			state = states.idle;
	
		if bbox_collision_function(self.x, self.y+1){
			if input_check(inputs.k_down, wich_player){
				sprite_index = animations.crouch;
			}
			else{sprite_index = animations.idle;}
		}
		else{
			if (vely < 0) {
				sprite_index = animations.air.rising
			}
			else{
				sprite_index = animations.air.falling
			}
		}
		}
		
		if array_length(current_attack.prots) > 0{
			if !current_attack.prots[0].start == 1 {
				redeye_activation();
			}
		}
		else{
			redeye_activation();
		}
		break;
		#endregion
	case states.parry:
		techable = false;
		if image_index <= 8 {
			cancel = true;
			redeye_activation();
		}
		break;
	case states.air_dash:
		#region air dashing
		redeye_activation();
		cancel = true;
		extras.air_dash.able = false;
		current_attack = {
			animation: extras.air_dash.animation,
			lnd_strng: 1,
			hboxs: [],
			prots : [],
			movements: [],
			cost : 0,
			scrpt : function(_self){}
		};
		if (bbox_collision_function(self.x, self.y+1)) {
			velx = velx * 1/2;
			sprite_index = animations.landing.light;
			image_index = 0;
			state = states.landing;
		}
		else{
			sprite_index = extras.air_dash.animation;
		}
		
		if image_index <= 3{
			vely = 0;
		}
		else{
			velx = extras.air_dash.velx * image_xscale;
			vely = 0;
			light_attack();
			medium_attack();
			heavy_attack();
			special_attack();
		}
		break;
		#endregion
	case states.run:
		#region running
		redeye_activation();	
		if (bbox_collision_function(self.x, self.y+1, pass)) {
		
			if sprite_index == extras.run.animation {
				if image_xscale == 1 {
					if input_check(inputs.k_right, wich_player) and abs(velx) > 0 {
						if (velx <  extras.run.velx){
							velx +=  extras.run.velx - velx;
						}
						else{
							velx += gnd_fric_1;
						}
					}
					else{
						image_index = 0;
						sprite_index = extras.run.stop;
						dodge_function();
					}
				}
				else if image_xscale == -1 {
					if input_check(inputs.k_left, wich_player) and abs(velx) > 0{
						if (velx > -extras.run.velx){
							velx += -extras.run.velx - velx;
						}
						else{
							velx -= gnd_fric_1;
						}
					}
					else{
						image_index = 0;
						sprite_index = extras.run.stop;
					}
				}
			
				//RUNNING ACTIONS!! WOOO!!!
				//jump
				if  input_check(inputs.k_up, wich_player, 3){
					jumpFunction(stats.jump.j_heigh);
					state = states.idle;
				}
				medium_attack();
				heavy_attack();
				grab_attack();
				special_attack();
			}
		}
		else{
			state = states.idle;
			velx = velx * 0.8
			if (vely < 0) {
				sprite_index = animations.air.rising
			}
			else{
				sprite_index = animations.air.falling
			}
		}
		break;
		#endregion
	case states.curse_eye:
		techable = false;
		#region RED EYE
			if sprite_index = animations.redeye.redpause {
				if image_index < 15 {
					velx = 0;
					vely = 0;
					match_controller.slowdown();
					prot = protections.full;
					if input_check_pressed(inputs.k_up, wich_player, 3){
						image_index = 0;
						if input_check_pressed(inputs.k_left, wich_player, 3){
							image_xscale = -1;
							velx = -10;
							vely = -10;
						}
						else if input_check_pressed(inputs.k_right, wich_player, 3){
							image_xscale = 1;
							velx = 10;
							vely = -10;
						}
						else{
							velx = 0;
							vely = -15;
						}
						sprite_index = animations.redeye.dash;
					}
					else if input_check_pressed(inputs.k_down, wich_player, 3){
						image_index = 0;
						if input_check_pressed(inputs.k_left, wich_player, 3){
							image_xscale = -1;
							velx = -10;
							vely = 10;
						}
						else if input_check_pressed(inputs.k_right, wich_player, 3){
							image_xscale = 1;
							velx = 10;
							vely = 10;
						}
						else{
							velx = 0;
							vely = 15;
						}
						sprite_index = animations.redeye.dash;
					}
					else if input_check_pressed(inputs.k_left, wich_player, 3){
						image_xscale = -1;
						image_index = 0;
						velx = -15;
						vely = 0;
						y-= 4;
						sprite_index = animations.redeye.dash;
					}
					else if input_check_pressed(inputs.k_right, wich_player, 3){
						image_xscale = 1;
						image_index = 0;
						velx = 15;
						vely = 0;
						y-= 4;
						sprite_index = animations.redeye.dash;
					}
					else if cancel == true and image_index >= 8{
						light_attack();
						medium_attack();
						heavy_attack();
						special_attack();
					}
					
					
				}
				else{
					prot = protections.nothing;
				}
			}
			else {				
				current_attack = {
					animation: animations.redeye.dash,
					lnd_strng: 1,
					hboxs: [],
					prots : [],
					movements: [],
					cost : 0,
					scrpt : function(_self){}
				};
				if image_index < 9 {
					if (!bbox_collision_function(self.x, self.y+1, false)) {
						vely -= stats.jump.grav;
						if velx > 0{
							velx += air_fric_1;
						}
						if velx < 0{
							vely -= air_fric_1;
						}
					}
					else{
						if velx > 0{
							velx += gnd_fric_1;
						}
						if velx < 0{
							vely -= gnd_fric_1;
						}
					}
					
					if image_index < 4 {
						if cancel == true{
							prot = protections.full;
						}
						else{
							prot = protections.nothing;
						}
					}
					else {
						prot = protections.nothing;
						if cancel == true {
							light_attack();
							medium_attack();
							heavy_attack();
							special_attack();
						}
					}
				}
				else {
					if cancel == true {
						light_attack();
						medium_attack();
						heavy_attack();
						special_attack();
					}
					prot = protections.nothing;
					if (bbox_collision_function(self.x, self.y+1)) {
						velx = velx * 1/2;
						sprite_index = animations.landing.light;
						image_index = 0;
						state = states.landing;
					}
				}
			}
		#endregion
	case states.enter_match:
		//if (instance_exists(match_controller)) {
		//    match_controller.start_match();
		//}
		pass = false;
		break;
	case states.round_finish:
		#region round finish
		pass = false;
		prot = protections.full;
		if bars.HealthBar.actual> 0 {
			if current_attack != noone {
				if current_attack.lnd_strng != -1 and bbox_collision_function(self.x, self.y + 1){
					sprite_index = animations.idle;
				}
			}
		}
		else if image_index + 1 == image_number and bbox_collision_function(self.x, self.y+1){
			image_index = image_number - 1;
		}
		
		if (sprite_index == animations.thumble and
			bbox_collision_function(self.x, self.y+1) and vely >= 0){
				image_index = 0;
				sprite_index = animations.kdown.light;
		}
		
		instance_destroy(hitbox_obj);
		#endregion
		break;
	default:
		pass = false;
		state = states.idle;
		break;
		
		
}

#endregion




avoidClip_function(self);
movement_function(self);
friction_function(self);
avoid_offstage(self);
poison_state();
curse_state();
cold_state();
burn_state();
berserker_state();
passion_state();
regenerate_state();


