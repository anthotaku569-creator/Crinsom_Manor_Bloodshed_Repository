/// @description Insert description here
// You can write your code in this editor

_hbox = other;

function calc_damage(_dmg){
	var actual_dmg = _dmg
	if (guts) > 0 {
		var actual_dmg = _dmg * scaling.dmg * sqrt(guts);
	}
	
	if state != states.grab {
		if stt_effects.burn > 0 {
			/*if stt_effects.burn > 90*60 {
				actual_dmg = actual_dmg * 1.4;
			}
			if stt_effects.burn > 60*60 {
				actual_dmg = actual_dmg * 1.3;
			}
			else if stt_effects.burn > 30*60 {
				actual_dmg = actual_dmg * 1.2;
			} else {
				actual_dmg = actual_dmg * 1.1;
			}*/
			actual_dmg = actual_dmg * 1.2;
		}
		if _hbox.master.stt_effects.berserker > 0 {
			/*if _hbox.master.stt_effects.berserker > 60*60 {
				actual_dmg = actual_dmg * 1.4;
			}
			if _hbox.master.stt_effects.berserker > 40*60 {
				actual_dmg = actual_dmg * 1.3;
			}
			else if _hbox.master.stt_effects.berserker > 20*60 {
				actual_dmg = actual_dmg * 1.2;
			} else {
				actual_dmg = actual_dmg * 1.1;
			}*/
			actual_dmg = actual_dmg * 1.2;
		}
	}
	
	if actual_dmg < 0.2 {
		actual_dmg = 0.2
	}
	
	return actual_dmg;
}

function calc_hitstun(_hts){
	hitstun = _hts - stats.weight.hit_red;
	
	if _hts > 0 and hitstun <= 0{
		hitstun = 1
	}
	
	if sprite_index == animations.thumble{
		hitstun = hitstun * scaling.dmg;
	}
	
	if hitstun > 0 {
		return hitstun;
	}
	else{
		return 0;
	}
}

function cleanhit_function(){
	if state == states.special_atack or state == states.h_attack or state == states.m_attack or state == states.parry or state == states.dodge{
		scaling.dmg = scaling.dmg*(1 + (0.1*_hbox.strg))
		scaling.kbck = scaling.kbck*(0.8 + (0.01*_hbox.strg))
	}
	//Restart cummulative damage
	if state != states.hitstun and state != states.knockdown{
		scaling.cum_dmg = 0;
	}
	
	//hit stop
	match_controller.hit_pause(_hbox.strg);
	
	//Check if peration/stalling/scaling is necesary
	if scaling.combo > 0{
		scaling.dmg = scaling.dmg*(0.9 + (0.01*_hbox.strg))
		scaling.kbck = scaling.kbck*(1.05 + (0.01*_hbox.strg))
		match_controller.hit_pause(_hbox.strg*2);
	}
	scaling.enemy = _hbox.master
	
	//hitstun
	bars.HitstunBar.actual = calc_hitstun(_hbox.hts);
	
	//FRAME DATA
	if _hbox.bloc ==  blc_types.pry and _hbox.master.state = states.idle{
		_hbox.master.frame_data = bars.HitstunBar.actual;
		frame_data = _hbox.master.frame_data * -1;
	}
	//!!!!
	stun_data = ceil(bars.HitstunBar.actual);
	should_reverse = true;
	
	//if state!= states.hitstun{
	
		if _hbox.kdwn == true {
			bars.HitstunBar.kdwn = 2;
			sprite_index = animations.thumble;
		}
	
		if state == states.knockdown{
			image_index = 0
		}
		else{
			//match_controller.modify_blodlust(-1, wich_player);
			if _hbox.stt_effects.paralysis <= 0{
				if sprite_index != animations.thumble {
					sprite_index = animations.hitstun;
				}
			}
			else{
				if stt_effects.paralysis <= 0{
					stt_effects.paralysis = _hbox.stt_effects.paralysis * scaling.dmg;
					sprite_index = animations.paralyze;
				}
				else{
					stt_effects.paralysis = 0;
					sprite_index = animations.hitstun;
				}
			}
			state = states.hitstun
		}
	//}
	// hitspark
	match_controller.hitspark_create(
		_hbox.hitspark,
		_hbox.x,
		_hbox.y,
		self.x,
		self.y
	)
	//kckback
	
	delay_kback.angle = _hbox.kback.angle;
	delay_kback.strength = _hbox.kback.strength;
	delay_kback.other_dir = _hbox.master.image_xscale;
	
	alarm[0] = 1;
	if (!bbox_collision_function(self.x, self.y+1, pass)){
		delay_kback.angle += 30
		alarm[0] = 1;
	}
	//damage
	if state == states.l_attack 
		or state == states.m_attack 
		or state == states.h_attack 
		or state == states.dodge {
		scaling.dmg = scaling.dmg*1.1
		//match_controller.sophie_dialoge_action(sophie_states.counter, wich_player);
	}
	if state == states.special_atack{
		scaling.dmg = scaling.dmg*1.15
		//match_controller.sophie_dialoge_action(sophie_states.counter, wich_player);
	}
	if state == states.super_atack{
		scaling.dmg = scaling.dmg*1.2
		//match_controller.sophie_dialoge_action(sophie_states.counter, wich_player);
	}
	
	bars.HealthBar.actual -= calc_damage(_hbox.dmg)
	scaling.cum_dmg += calc_damage(_hbox.dmg)
	if match_controller.get_bloodlust(wich_player) > 50{
		match_controller.modify_blodlust(-2, wich_player);
	}
	//status effects
	stt_effects.poison += _hbox.stt_effects.poison * 60
	stt_effects.curse += _hbox.stt_effects.curse * 60
	stt_effects.cold += _hbox.stt_effects.cold * 60
	stt_effects.burn += _hbox.stt_effects.burn * 60
	
	//cancel
	_hbox.master.cancel = true;
	scaling.attack = _hbox.master.current_attack;
	scaling.combo ++;
	
}

function blockedhit_function(){
	
	//hit stop
	match_controller.hit_pause(_hbox.strg)
	//blocstun
//	if collision_function(self.x, self.y+1){
	var _blocstun = calc_hitstun(ceil(_hbox.bls)) + _hbox.stt_effects.paralysis;
	
	if !collision_function(self.x, self.y+1, pass){
		_blocstun += 4;
	}
	
	bars.HitstunBar.actual = _blocstun;
		
//	}
//	else {
//		bars.HitstunBar.actual += 2*(calc_hitstun((_hbox.hts)) +  _hbox.stt_effects.paralysis);
//	}
	//FRAME DATA
	if _hbox.bloc ==  blc_types.pry and _hbox.master.state = states.idle{
		_hbox.master.frame_data = bars.HitstunBar.actual;
		frame_data = _hbox.master.frame_data * -1;
	}
	//!!!!
	stun_data = ceil(bars.HitstunBar.actual/2);
	should_reverse = true;
	
	//kckback
	if !collision_function(self.x, self.y+1, pass){
		delay_kback.angle = _hbox.kback.angle;
		delay_kback.strength = _hbox.kback.strength;//*3/4;
	}
	else{
		if _hbox.kback.angle <= 90{
			delay_kback.angle = 0;
		}
		else{
			delay_kback.angle = 180;
		}
		delay_kback.strength = _hbox.kback.strength/2;
	}
	delay_kback.other_dir = _hbox.master.image_xscale;
	alarm[0] = 1;
	//damage
	bars.HealthBar.actual -= calc_damage(_hbox.dmg/10)
	// hitspark
	match_controller.hitspark_create(
		hitspark_block,
		_hbox.x,
		_hbox.y - (24* _hbox.image_yscale),
		self.x,
		self.y
	)
	//status effects
	stt_effects.poison += _hbox.stt_effects.poison * 30
	stt_effects.curse += _hbox.stt_effects.curse * 30
	stt_effects.cold += _hbox.stt_effects.cold * 30
	stt_effects.burn += _hbox.stt_effects.burn * 30
	//scaling
	scaling.attack = _hbox.master.current_attack;
	scaling.enemy = _hbox.master
	//cancel
	_hbox.master.cancel = true;
}

function perfectbloc_function(){
	//match_controller.sophie_dialoge_action(sophie_states.inst_blc, wich_player);
	//hit stop
	match_controller.hit_pause(_hbox.strg)
	//blocstun
		var _blocstun = calc_hitstun(ceil(_hbox.bls - 2)) + _hbox.stt_effects.paralysis;
		bars.HitstunBar.actual = _blocstun;
	//kckback
	//delay_kback.other_dir = _hbox.master.image_xscale;
	//var hor_kb = sign(cos(_hbox.kback.angle*pi/180)*_hbox.kback.strength);
	//_hbox.master.velx = (hor_kb*(_hbox.kback.strength + 12)*_hbox.master.image_xscale)*-1;
	//scaling
	scaling.attack = _hbox.master.current_attack;
	scaling.enemy = _hbox.master
	p_bloc.cooldown = 0;
	p_bloc.active = false
	//cancel
	_hbox.master.cancel = true;
	//FRAME DATA
	if _hbox.bloc ==  blc_types.pry and _hbox.master.state = states.idle{
		_hbox.master.frame_data = bars.HitstunBar.actual;
		frame_data = _hbox.master.frame_data * -1;
	}
	//!!!!
	stun_data = _blocstun;
	should_reverse = true;
}

function did_he_blocked(){
	
	//Restart frame advantage
	frame_data = 0;
	// Finally, analyze blocking
	
	if blocking_function() == true {
		state = states.block;
		if collision_function(self.x, self.y+1, pass){
			switch(_hbox.bloc){
				case blc_types.low:
					 if input_check(inputs.k_down, wich_player){
						if p_bloc.active{
							match_controller.modify_blodlust(4, wich_player);
							perfectbloc_function()
						}
						else{
							match_controller.modify_blodlust(-1, wich_player);
							blockedhit_function()
						}
					 }
					 else{
						match_controller.modify_blodlust(-8, wich_player);
						bars.HitstunBar.actual = 0
						scaling.dmg = scaling.dmg*1.01
						//match_controller.sophie_dialoge_action(sophie_states.overhead, wich_player);
						cleanhit_function()
					 }
					 break;
				case blc_types.ovh:
					 if !input_check(inputs.k_down, wich_player){
						if p_bloc.active{
							match_controller.modify_blodlust(4, wich_player);
							perfectbloc_function()
						}
						else{
							match_controller.modify_blodlust(-1, wich_player);
							blockedhit_function()
						}
					 }
					 else{
						match_controller.modify_blodlust(-8, wich_player);
						bars.HitstunBar.actual = 0
						scaling.dmg = scaling.dmg*1.01
						//match_controller.sophie_dialoge_action(sophie_states.low, wich_player);
						cleanhit_function()
					 }
					 break;
				default:
					if p_bloc.active{
						match_controller.modify_blodlust(2, wich_player);
						perfectbloc_function()
					}
					else{
						match_controller.modify_blodlust(-1, wich_player);
						blockedhit_function()
					}
					break;
			}
		}
		else{
			blockedhit_function()
		}
	}
	else if state == states.parry{
		switch(_hbox.bloc){
				case blc_types.low:
					 if sprite_index == extras.parry.animations.low and image_index <= 8{
						match_controller.modify_blodlust(25, wich_player);
						match_controller.hit_pause(4);
						//kckback
						_hbox.master.velx = ((_hbox.kback.strength + 20)* image_xscale);
						prot = protections.full
						image_index = 9;
						//match_controller.sophie_dialoge_action(sophie_states.inst_blc, wich_player);
					 }
					 else{
						match_controller.modify_blodlust(-10, wich_player);
						bars.HitstunBar.actual = 0
						scaling.dmg = scaling.dmg*1.1
						cleanhit_function()
					 }
					 break;
				case blc_types.ovh:
					 if sprite_index == extras.parry.animations.high and image_index <= 8{
						match_controller.modify_blodlust(25, wich_player);
						match_controller.hit_pause(4);
						//kckback
						_hbox.master.velx = ((_hbox.kback.strength + 20)* image_xscale);
						prot = protections.full
						image_index = 9;
						//match_controller.sophie_dialoge_action(sophie_states.inst_blc, wich_player);
					 }
					 else{
						match_controller.modify_blodlust(-10, wich_player);
						bars.HitstunBar.actual = 0
						scaling.dmg = scaling.dmg*1.01
						cleanhit_function()
					 }
					 break;
				default:
					if image_index <= 8{
						match_controller.modify_blodlust(25, wich_player);
						match_controller.hit_pause(4);
						//kckback
						_hbox.master.velx = ((_hbox.kback.strength + 20)* image_xscale);
						prot = protections.full
						image_index = 9;
						//match_controller.sophie_dialoge_action(sophie_states.inst_blc, wich_player);
					 }
					 else{
						match_controller.modify_blodlust(-10, wich_player);
						bars.HitstunBar.actual = 0
						scaling.dmg = scaling.dmg*1.01
						cleanhit_function()
					 }
					break;
			}
	}
	else{
		cleanhit_function()
	}
}

function grab_function(){
	if (bbox_collision_function(x, y + 1, false) == _hbox.master.bbox_collision_function(_hbox.master.x, _hbox.master.y + 1,, false)){	
		if _hbox.master.state == states.hitstun or _hbox.master.state == states.knockdown{
			//victima
			image_speed=1;
			sprite_index = _victim.animations.landing.heavy;
			bars.HitstunBar.kdwn = 0;
			bars.HitstunBar.actual = 0
			image_index = 0;
			velx = 16 * _hbox.master.image_xscale;
			//exit
			state = states.kdown_recovery;
			return;
		}
		_hbox.master.velx = 0
		_hbox.master.vely = 0
		//grabing.
		//master
		_hbox.master.grabing._graber = _hbox.master;
		grabing._graber = _hbox.master
		//victim
		if (state = states.knockdown){
			no_infinte = true
		}
		_hbox.master.grabing._victim = self.id;
		grabing._victim = self.id;
		match_controller.hit_pause(4);
		//cancel
		_hbox.master.cancel = false;
		//script
		_hbox.master.grabing.grb_script = _hbox.grb_script;
		grabing.grb_script = _hbox.grb_script
		//estado grab
		_hbox.master.state = states.grab;
		state = states.grab;
		// hitspark
		match_controller.hitspark_create( _hbox.hitspark, _hbox.x, _hbox.y*(24* _hbox.image_yscale), self.x, self.y)//, abs(bbox_bottom - bbox_top))
	}
	else {
		return;
	}
}

function hasStats(){
	if _hbox.dmg > 0 or _hbox.hts > 0 or
	_hbox.kback.strength > 0 or _hbox.stt_effects.paralysis > 0 
	or _hbox.stt_effects.burn > 0 or _hbox.stt_effects.cold > 0
	or _hbox.stt_effects.poison > 0 or _hbox.stt_effects.curse > 0{
		return true
	}
	else {
		return false
	}
}


if (_hbox.master.wich_player != wich_player and state != states.grab){
	//h_col = _hbox;
	
	if _hbox.bloc == blc_types.push {
		if state == states.hitstun or state == states.knockdown {
			var hor_kb = (cos(_hbox.kback.angle*pi/180)*_hbox.kback.strength*_hbox.master.image_xscale);
			var ver_kb = (sin(_hbox.kback.angle*pi/180)*_hbox.kback.strength*-1);
			velx = hor_kb;
			vely = ver_kb;
		}
	}
	else {
		switch(prot){
			case protections.nothing:
				if (_hbox.bloc != blc_types.grb){
					if hasStats() {
						did_he_blocked();
					}
				}
				else{
					if blocking_function() == true {
						//match_controller.sophie_dialoge_action(sophie_states.grab_block, wich_player);
						match_controller.modify_blodlust(-10, wich_player);
					}
					grab_function();
				}
				
				break;
			case protections.armor:
				if (_hbox.bloc != blc_types.grb){
					//match_controller.sophie_dialoge_action(sophie_states.armor, wich_player);
					if hasStats() {
						match_controller.modify_blodlust(-10, wich_player);
						//cancel = true; //ADD ????
						//damage
						bars.HealthBar.actual -= calc_damage(_hbox.dmg*0.8)
						//hit stop
						match_controller.hit_pause(4);
						with(_hbox){
							instance_destroy();
						};
					}
				}
				else{
					grab_function()
				
				}
				break;
			case protections.hit_invul:
				if (_hbox.bloc == blc_types.grb){
					grab_function()
				
				}
				else{
					//match_controller.sophie_dialoge_action(sophie_states.inv, wich_player);
				}
				break;
			case protections.mid_invul:
				if (_hbox.bloc != blc_types.grb){
					if _hbox.bloc != blc_types.mid{
						if hasStats() {
							did_he_blocked();
						}					
					}
					else{
						//match_controller.sophie_dialoge_action(sophie_states.pry_inv, wich_player);
					}
				}
				else{
					grab_function()
				
				}
				break;
			case protections.low_invul:
				if (_hbox.bloc != blc_types.grb){
					if _hbox.bloc != blc_types.low{
						if hasStats() {
							did_he_blocked();
						}					
					}
					else{
						//match_controller.sophie_dialoge_action(sophie_states.pry_inv, wich_player);
					}
				}
				else{
					grab_function()
				
				}
				break;
			case protections.ovh_invul:
				if (_hbox.bloc != blc_types.grb){
					if _hbox.bloc != blc_types.ovh{
						if hasStats() {
							did_he_blocked();
						}					
					}
					else{
						//match_controller.sophie_dialoge_action(sophie_states.pry_inv, wich_player);
					}
				}
				else{
					grab_function()
				
				}
				break;
			case protections.proy_invul:
				if (_hbox.bloc != blc_types.grb){
					if _hbox.bloc != blc_types.pry{
						if hasStats() {
							did_he_blocked();
						}					
					}
					else{
						//match_controller.sophie_dialoge_action(sophie_states.pry_inv, wich_player);
					}
				}
				else{
					grab_function()
				
				}
				break;
			case protections.grab_invul:
				if (_hbox.bloc != blc_types.grb){
					if hasStats() {
						did_he_blocked();
					}				
				}
				else{
					//match_controller.sophie_dialoge_action(sophie_states.grab_inv, wich_player);
				}
				break;
			case protections.full:
				//match_controller.sophie_dialoge_action(sophie_states.inv, wich_player);
				break;
		}
	}	
}

