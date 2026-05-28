/// @description Insert description here
// You can write your code in this editor

input_reader();

event_user(1);

//gravity

check_floor = bbox_place_meeting(self.x,self.y,Collision_normal);
check_collision = bbox_collision_function(self.x, self.y+1, false);

press_hold_right = input_checkers.hold.right;
press_hold_left = input_checkers.hold.left;

if !check_floor{
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

if bars.Humanity.maximum > bars.Humanity.actual {
	bars.Humanity.actual +=0.02;
}

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



#region state machine

perfect_bloc();
if global.training_mode == true{
	GetFrameData();
}
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
		InspirationGain();
		bars.Charge.actual += 1
		cancel = true;
		//Infinite in training mode
		if global.training_mode == true{
			match_controller.modify_blodlust(50 - match_controller.get_bloodlust(wich_player), wich_player);
			bars.Humanity.actual = 100;
		}
		
		///Horizontal movement
		//right
		if !(press_hold_right and press_hold_left){
			if press_hold_right{
				movimientoHorizontal(1)
			}
			//left
			if press_hold_left{
				movimientoHorizontal(-1)
			}
		}
		//On ground
		if check_collision {
			jump_cancel = true;
			extras.air_dash.able = true;
			extras.float.time++;
			//crouch
			if input_checkers.hold.down{
				sprite_index = animations.crouch;
			}
			else {
				//full stop
				if input_checkers.release.right
					or input_checkers.release.left	
					or input_checkers.release.down	{
					velx = 0
					sprite_index=animations.idle;
				}
			}
			//jump
			if input_checkers.hold.up{
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
			if input_checkers.tap.up{
				if (extras.d_jmp.has == true and extras.d_jmp.can == true and vely > 0){
					jumpFunction(stats.jump.j_heigh);
					jump_cancel = false;
					extras.d_jmp.can = false;						
				}
			}
			
			// jump cancel
			if input_check_released(inputs.k_up, wich_player, 3){
				if jump_cancel == true and vely < 0 {
					vely = vely * 0.8;
					jump_cancel = false;
				}
			}
			
			
			//AIR DASHING
			if extras.air_dash.able == true and vely > (stats.jump.j_heigh *-1)*3/4 {
				if input_checkers.double.right {
					sprite_index = extras.air_dash.animation;
					image_index = 0;
					image_xscale = 1;
					state = states.air_dash;
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
				}
				else if input_checkers.double.left {
					sprite_index = extras.air_dash.animation;
					image_index = 0;
					image_xscale = -1;
					state = states.air_dash;
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
		parry_function();
		redeye_activation();
		break;
		#endregion
	case states.h_attack:
		#region normal attack
		functionCurrentAttack();
		InspirationGain();
		reduceVelocity();
		should_reverse = false;
		if (bbox_collision_function(self.x, self.y+1, pass)) {
			if  input_checkers.hold.up and cancel == true{
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
			if input_checkers.hold.up  and cancel == true{
				if (extras.d_jmp.has == true and extras.d_jmp.can == true and vely > 0){
					jumpFunction(stats.jump.j_heigh);
					extras.d_jmp.can = false;
					state = states.idle;						
				}
			}
		}
		
		if (image_index == image_number - 1){
			state = states.idle;
	
			if check_collision{
				if input_checkers.hold.down{
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
		if image_index < 2 {
			parry_function();
		}
		special_attack();
		redeye_activation();
		break;
		#endregion	
	case states.m_attack:
		#region normal attack
		functionCurrentAttack();
		InspirationGain();
		reduceVelocity();
		should_reverse = false;
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
		else {
			//AIR DASHING
			if extras.air_dash.able == true and cancel == true {
				if input_checkers.tap.right {
					sprite_index = extras.air_dash.animation;
					image_index = 0;
					image_xscale = 1;
					state = states.air_dash;
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
				}
				else if input_checkers.tap.left {
					sprite_index = extras.air_dash.animation;
					image_index = 0;
					image_xscale = -1;
					state = states.air_dash;
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
				}
			}
			
		}
		
		if (image_index == image_number - 1){
			state = states.idle;
	
			if check_collision{
				if input_checkers.hold.down{
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
		reduceVelocity();
		should_reverse = false;
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
	
			if check_collision{
				if input_checkers.hold.down{
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
		reduceVelocity();
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
		
		if bbox_collision_function(x + (velx), y, false) and scaling.enemy != noone {
			scaling.enemy.x += (velx)*-1;
			x += sign(velx)*-1;
		}
		
		run_framedata = 0;
		pass = false;
		techable = false;
		image_speed=1;
		prot = protections.nothing;
		
		if (input_checkers.tap.m
			and input_checkers.tap.h
			and bars.Humanity.actual >= 100) {
			bars.HitstunBar.actual = 30;
			image_index = 0;
			sprite_index = animations.burst;
			state = states.burst;
			vely = -0.5;
			bars.Humanity.actual -= 100
		}
		
		if scaling.enemy!= noone{
			if scaling.enemy.state == states.idle{
				scaling.attack = noone;
			}
		}
		
		if (bars.HitstunBar.actual<=0 and stt_effects.paralysis <= 0){
			bars.HitstunBar.actual = 0;
			stt_effects.paralysis = 0;
			
			if sprite_index == animations.thumble {
				jumpFunction(6)
				prot = protections.full;
				image_index = -1
				state = states.kdown_recovery;
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
				if (!check_collision) {
					sprite_index = animations.thumble;
					show_debug_message("Thumbling down ")
					scaling.kbck = scaling.kbck*1.2
					bars.HitstunBar.kdwn = 1;
				}
				else{
					bars.HitstunBar.kdwn = 0;
				}
			}
			if (sprite_index == animations.thumble
				and bbox_collision_function (self.x, self.y + 1, pass)
				and vely >= 0){
					image_index = 0;
					image_speed = 1;
					sprite_index = animations.kdown.light
					show_debug_message("Should knock down: bars.HitstunBar.kdwn: " + string(bars.HitstunBar.kdwn))
					scaling.dmg = scaling.dmg*1.5
					show_debug_message("image index " + string(image_index) +"/" + string(image_number))
					if (scaling.enemy.current_attack != scaling.enemy.attacks.empty){
						scaling.enemy = noone
					}
					state = states.knockdown
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
		if bbox_collision_function(self.x - image_xscale*sprite_width, self.y + 1, pass) and (vely) >= 18{
			vely = vely * -0.5;
		}
		if bbox_collision_function(self.x + sign(velx), self.y, pass) and abs(velx) >= 32{
			velx = velx * -0.5;
		}
		dying();
		
		break;
		#endregion
	case states.knockdown:
		#region knockdown
		run_framedata = 0;
		pass = false;
		
		if scaling.enemy!= noone {
			if scaling.enemy.state == states.idle{
				scaling.attack = noone;
			}
		}
		show_debug_message("sprite index " + sprite_get_name(sprite_index))
		show_debug_message("image index " + string(image_index))
		show_debug_message("bars.HitstunBar.kdwn " + string(bars.HitstunBar.kdwn))
		reduceVelocity()
		
		if (image_index > 15) {
			prot = protections.full;	
		}
		else{
			prot = protections.nothing;	
		}
		if (bars.HitstunBar.kdwn == 1){
			sprite_index = animations.kdown.light
			if (image_index <= 6
				and (input_checkers.tap.l
					or input_checkers.tap.m
					or input_checkers.tap.h
				)
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
		if check_collision and (vely) > 16{
			vely = vely * -0.8;
		}
		
		dying();
		
		break;
		#endregion
	case states.kdown_recovery:
		#region techs and kdown
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
		if (bars.HitstunBar.actual<=0){
			light_attack();
			medium_attack();
			heavy_attack();
			dodge_function();
			special_attack();
			grab_attack();
			bars.HitstunBar.actual = 0;
			if bbox_collision_function(self.x, self.y+1, pass){
				if input_checkers.hold.down{
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
		else {
			reduceVelocity()
			bars.HitstunBar.actual--;
			if check_collision{
				if input_checkers.hold.down{
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
		should_reverse = false;
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
	
		if check_collision{
			if input_checkers.hold.down{
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
		
		redeye_activation();
		break;
		#endregion
	case states.burst:
		techable = false;
				
		if image_index <= 16 {
			vely = -1;
			velx = 0;
			if (input_checkers.hold.m
				and input_checkers.hold.h
				and bars.HitstunBar.actual > 0) {
				image_index = 1;
				bars.HitstunBar.actual --;
			}
		}
		else {
			if image_index < 24 {
				vely = 0;
			}
			
			if (bbox_collision_function(self.x, self.y+1, pass)) {
				sprite_index = animations.landing.heavy;
				image_index = 0;
				state = states.landing;
			}
		}
		break;
	case states.parry:
		techable = false;
		if check_collision and sprite_index == extras.parry.animations.air {
			sprite_index = extras.parry.animations.high;
		}
		
		if image_index == 8 and
			input_checkers.hold.m and
			input_checkers.hold.h {
			image_index = 1;
			
		}
		
		if image_index <= 8 {
			if (bars.HitstunBar.actual <= 0) {
			bars.Humanity.actual-=0.2;
			if !input_checkers.hold.m or
				!input_checkers.hold.h  or bars.Humanity.actual <= 0{
				image_index = 9;
			}
			cancel = true;
			redeye_activation();
			}
			else{
				image_index = 1
				bars.HitstunBar.actual--;
			}
		}
		break;
	case states.air_dash:
		#region air dashing
		redeye_activation();
		InspirationGain();
		if (check_collision) {
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
		InspirationGain();
		if (bbox_collision_function(self.x, self.y+1, pass)) {
		
			if sprite_index == extras.run.animation {
				if image_xscale == 1 {
					if press_hold_right and abs(velx) > 0 {
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
					if press_hold_left and abs(velx) > 0{
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
				if  input_checkers.hold.up{
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
			cancel = true;
			if sprite_index = animations.redeye.redpause {
				if image_index < 15 {
					velx = 0;
					vely = 0;
					match_controller.slowdown();
					prot = protections.full;
					if input_checkers.tap.up {
						image_index = 0;
						if input_checkers.tap.left	{
							image_xscale = -1;
							velx = -10;
							vely = -10;
						}
						else if input_checkers.tap.right{
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
						if input_checkers.tap.left	{
							image_xscale = -1;
							velx = -10;
							vely = 10;
						}
						else if input_checkers.tap.right{
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
					else if input_checkers.tap.left	{
						image_xscale = -1;
						image_index = 0;
						velx = -15;
						vely = 0;
						y-= 4;
						sprite_index = animations.redeye.dash;
					}
					else if input_checkers.tap.right {
						image_xscale = 1;
						image_index = 0;
						velx = 15;
						vely = 0;
						y-= 4;
						sprite_index = animations.redeye.dash;
					}
					
					if image_index >= 4 {
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
					if (!check_collision) {
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
					}
					light_attack();
					medium_attack();
					heavy_attack();
					special_attack();
				}
				else {
					prot = protections.nothing;
					if (check_collision) {
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
				if current_attack.lnd_strng != -1 and check_collision{
					sprite_index = animations.idle;
				}
			}
		}
		else if image_index + 1 == image_number and check_collision{
			image_index = image_number - 1;
		}
		
		if (sprite_index == animations.thumble and
			check_collision and vely >= 0){
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

Health_Show();
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


