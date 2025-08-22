/// @description Insert description here
// You can write your code in this editor

function magnet_to_enemy(){
	var _enemy = match_controller.player_two;
	
	if master.wich_player == 2{
		_enemy = match_controller.player_one;
	}
	
	
	
	if _enemy.xprevious < x and (pry_properties.velx) > -og_fullspeed {
		pry_properties.velx -= og_fullspeed/16
	}
	if _enemy.xprevious > x and (pry_properties.velx) < og_fullspeed {
		pry_properties.velx += og_fullspeed/16
	}
	if _enemy.yprevious < y and (pry_properties.vely) > -og_fullspeed {
		pry_properties.vely -= og_fullspeed/16
	}
	if _enemy.yprevious > y and (pry_properties.vely) < og_fullspeed {
		pry_properties.vely += og_fullspeed/16
	}
}

function attach_hitbox(){
	switch(bloc){
	case blc_types.pry:
		if pry_properties.velx != 0{
			image_xscale = sign(self.pry_properties.velx)
		}
		//boomerang
		if duration == boom_duration and pry_properties.bmrng == true {
			image_xscale = image_xscale * -1
			pry_properties.velx = pry_properties.velx * -1;
			pry_properties.bmrng = false
		}
		//friction and gravity
		if place_meeting(self.x, self.y + 1, Collision_normal){
			if pry_properties.physics.grnd_frict > 0{
				var vecx=sign(pry_properties.velx);
				if abs(pry_properties.velx) > pry_properties.physics.grnd_frict{
					pry_properties.velx = pry_properties.velx - (vecx * pry_properties.physics.grnd_frict);
				}
				else{
					pry_properties.velx = 0
				}
				
				if pry_properties.physics.grav > 0{
					pry_properties.vely = 0;
				}
			}
		}
		else{
			//gravity
			if pry_properties.physics.grav > 0{
				pry_properties.vely += pry_properties.physics.grav;
			}
			if pry_properties.physics.air_frict > 0{
				var vecx=sign(pry_properties.velx);
				var vecy=sign(pry_properties.vely);
				if abs(pry_properties.velx) > pry_properties.physics.air_frict{
					pry_properties.velx = pry_properties.velx - (vecx * pry_properties.physics.air_frict);
				}
				else{
					pry_properties.velx = 0
				}
				if abs(pry_properties.vely) > pry_properties.physics.air_frict{
					pry_properties.vely = pry_properties.vely - (vecy * pry_properties.physics.air_frict);
				}
				else{
					pry_properties.vely = 0
				}
			}
		}
		//Proyectile magneting
		if pry_properties.physics.magnet == true{
			magnet_to_enemy();
		}
		
		//collision horizontal
		var vecx=sign(pry_properties.velx)*0.01
		repeat(abs(pry_properties.velx)*100){
			if !place_meeting(x + vecx, y , Collision_normal){
				x = x + vecx;
			}
			else{
				var slope = instance_place(x + vecx, y , Collision_slope);
				if slope != noone {
					x = x + vecx;
					y = y - abs(vecx)*abs(slope.image_yscale/slope.image_xscale)
				}
				else{
					if pry_properties.physics.bounce == true{
						x = x - (vecx*400);
						pry_properties.velx = pry_properties.velx * -0.75
					}
					else{
						if abs(pry_properties.velx) > 0 {
							instance_destroy();
						}
						pry_properties.velx = 0;
					}
				}
			}
		}
		//collision vertical
		var vecy=sign(pry_properties.vely)*0.01
		repeat(abs(pry_properties.vely)*100){
			if !place_meeting(x, y + vecy , Collision_normal){
				y = y + vecy;
			}
			else{
				if pry_properties.physics.bounce == true{
					y = y - (vecy*400);
					pry_properties.vely = pry_properties.vely * -0.75
				}
				else{
					if abs(pry_properties.vely) > 0 {
						instance_destroy();
					}
					pry_properties.vely = 0;
				}
			}
		}
				
		break;
	default:
		//delete if atack finishes
		if (master_atk != master.sprite_index){
			instance_destroy();
		}
		//follow up master
		x = master.x + (rel_pos.posx * master.image_xscale);
		y = master.y + rel_pos.posy;
		
		break;
	}
}

attach_hitbox()

