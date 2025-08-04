/// @description Insert description here
// You can write your code in this editor


function calc_damage(_dmg){
	var actual_dmg = _dmg * scaling.dmg;
	if stt_effects.burn > 0 {
		actual_dmg = actual_dmg * 1.2;
	}
	if other.master.stt_effects.berserker > 0 {
		actual_dmg = actual_dmg * 1.2;
	}
	return actual_dmg;
}

function calc_hitstun(_hts){
	hitstun = _hts - stats.weight.hit_red;
	if hitstun > 0 {
		return hitstun;
	}
	else{
		return 0;
	}
}

function cleanhit_function(){
	//hit stop
	match_controller.hit_pause(calc_damage(other.dmg), other.hts + other.stt_effects.paralysis, other.kback.strength)
	//hitstun
	bars.HitstunBar.actual += calc_hitstun(other.hts);
	//if state!= states.hitstun{
		if state == states.knockdown{
			image_index = 0
		}
		else{
			other.master.bars.InspirationBar.actual += 4;
			if other.stt_effects.paralysis <= 0{
				sprite_index = animations.hitstun;
			}
			else{
				if stt_effects.paralysis <= 0{
					stt_effects.paralysis = other.stt_effects.paralysis * scaling.dmg;
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
		other.hitspark,
		other.x,
		other.y,
		self.x,
		self.y
	)
	//kckback
	delay_kback.angle = other.kback.angle;
	delay_kback.strength = other.kback.strength;
	delay_kback.other_dir = other.master.image_xscale;
	alarm[0] = 1;
	//damage
	bars.HealthBar.actual -= calc_damage(other.dmg)
	//status effects
	stt_effects.poison += other.stt_effects.poison * 60
	stt_effects.curse += other.stt_effects.curse * 60
	stt_effects.cold += other.stt_effects.cold * 60
	stt_effects.burn += other.stt_effects.burn * 60
	//scaling
	if (scaling.attack == noone or scaling.attack != other.master.current_attack){
		scaling.dmg = scaling.dmg*0.99
		scaling.kbck = scaling.kbck*1.05
	}
	scaling.attack = other.master.current_attack;
	scaling.enemy = other.master
	//combo
	scaling.combo ++;
	//cancel
	other.master.cancel = true;
}


function grab_function(){
	other.master.velx = 0
	other.master.vely = 0
	//grabing.
	//script
	other.master.grabing.grb_script = other.grb_script;
	grabing.grb_script = other.grb_script
	//master
	other.master.grabing._graber = other.master;
	grabing._graber = other.master
	//victim
	if (state = states.knockdown){
		no_infinte = true
	}
	other.master.grabing._victim = self;
	grabing._victim = self;
	match_controller.hit_pause(10, 10, 10);
	//estado grab
	other.master.state = states.grab;
	state = states.grab;
	//cancel
	other.master.cancel = true;
	// hitspark
	match_controller.hitspark_create(
		other.hitspark,
		other.x,
		other.y - (24* other.image_yscale),
		self.x,
		self.y
	)
}

function hasStats(){
	if other.dmg > 0 or other.hts > 0 or
	other.kback.strength > 0 or other.stt_effects.paralysis > 0 
	or other.stt_effects.burn > 0 or other.stt_effects.cold > 0
	or other.stt_effects.poison > 0 or other.stt_effects.curse > 0{
		return true
	}
	else {
		return false
	}
}


if (other.master.wich_player != wich_player and state != states.grab){
	
	switch(prot){
		case protections.nothing:
			if (other.bloc != blc_types.grb){
				if hasStats() {
				cleanhit_function()
				}
			}
			else{
				if state == states.block {
					bars.InspirationBar.actual -= 10;
				}
				grab_function()
			}
			
			break;
		case protections.armor:
			if (other.bloc != blc_types.grb){
				if hasStats() {
					bars.InspirationBar.actual += 10;
					//damage
					bars.HealthBar.actual -= calc_damage(other.dmg*0.8)
					//hit stop
					match_controller.hit_pause(calc_damage(other.dmg), other.hts + other.stt_effects.paralysis, other.kback.strength);
				}
			}
			else{
				grab_function()
				
			}
			break;
		case protections.hit_invul:
			if (other.bloc == blc_types.grb){
				grab_function()
				
			}
			break;
		case protections.proy_invul:
			if (other.bloc != blc_types.grb){
				if other.bloc != blc_types.pry{
					if hasStats() {
						cleanhit_function()
					}					
				}
			}
			else{
				grab_function()
				
			}
			break;
		case protections.grab_invul:
			if (other.bloc != blc_types.grb){
				if hasStats() {
					cleanhit_function()
				}				
			}
			break;
	}
	
}

