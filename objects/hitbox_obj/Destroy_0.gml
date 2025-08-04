/// @description Insert description here
// You can write your code in this editor
function personal_hitbox_function(creator, hitbox_properties){
	hbox = instance_create_depth(
		x + (hitbox_properties.rel_pos.posx * image_xscale),
		y + hitbox_properties.rel_pos.posy,
		-100,
		hitbox_obj);
	//general
	hbox.pallete = creator.pallete;
	hbox.master = creator;
	hbox.master_atk = self.master_atk;
	hbox.image_xscale = hitbox_properties.scale_x * image_xscale;
	hbox.image_yscale = hitbox_properties.scale_y;
	hbox.sprite_index = hitbox_properties.spr;
	hbox.rel_pos.posx = hitbox_properties.rel_pos.posx;
	hbox.rel_pos.posy = hitbox_properties.rel_pos.posy;
	hbox.grb_script = hitbox_properties.grb_script;
	hbox.dmg = (hitbox_properties.dmg);
	hbox.kdwn = (hitbox_properties.kdwn);
	hbox.hts = (hitbox_properties.hts);
	hbox.bls = (hitbox_properties.bls);
	hbox.bloc = (hitbox_properties.bloc);
	hbox.strg = (hitbox_properties.strg);
	hbox.kback.strength = hitbox_properties.kback.strength;
	hbox.kback.angle = hitbox_properties.kback.angle;
	hbox.duration = hitbox_properties.duration;
	//grab
	hbox.grb_script = hitbox_properties.grb_script;
	
	//hbox.stt_effects = hitbox_properties.stt_effects;
	hbox.reflect = hitbox_properties.reflect;
	hbox.stt_effects.burn = hitbox_properties.stt_effects.burn;
	hbox.stt_effects.paralysis = hitbox_properties.stt_effects.paralysis;
	hbox.stt_effects.cold = hitbox_properties.stt_effects.cold;
	hbox.stt_effects.poison = hitbox_properties.stt_effects.poison;
	hbox.stt_effects.curse = hitbox_properties.stt_effects.curse;
	hbox.stt_effects.water = hitbox_properties.stt_effects.water;
	
	
	//hbox.pry_properties = hitbox_properties.pry_properties;
	hbox.pry_properties.velx = hitbox_properties.pry_properties.velx * image_xscale;
	hbox.pry_properties.vely = hitbox_properties.pry_properties.vely;
	hbox.pry_properties.bmrng = hitbox_properties.pry_properties.bmrng;
	hbox.pry_properties.activation.delay = hitbox_properties.pry_properties.activation.delay;
	hbox.pry_properties.activation.contact = hitbox_properties.pry_properties.activation.contact;
	hbox.pry_properties.activation.summon = hitbox_properties.pry_properties.activation.summon;
	hbox.pry_properties.physics.grav = hitbox_properties.pry_properties.physics.grav;
	hbox.pry_properties.physics.air_frict = hitbox_properties.pry_properties.physics.air_frict;
	hbox.pry_properties.physics.bounce = hitbox_properties.pry_properties.physics.bounce;
	hbox.pry_properties.physics.magnet = hitbox_properties.pry_properties.physics.magnet;
	hbox.pry_properties.physics.grnd_frict = hitbox_properties.pry_properties.physics.grnd_frict;
	hbox.pry_properties.physics.collision = hitbox_properties.pry_properties.physics.collision;
	hbox.boom_duration = hitbox_properties.duration/2;
	hbox.og_fullspeed = sqrt(sqr(hbox.pry_properties.vely) + sqr(hbox.pry_properties.velx));
	
	if (ds_map_exists(hbox.master.active_prys, string(hbox.master_atk))){
		hbox.master.active_prys[? string(hbox.master_atk)] += 1
	}
	else{
		hbox.master.active_prys[? string(hbox.master_atk)] = 1
	}
	return hbox;
}


if (bloc = blc_types.pry and pry_properties.activation.summon != noone){
	personal_hitbox_function(master, pry_properties.activation.summon);
}

if (ds_map_exists(master.active_prys, string(master_atk))){
	master.active_prys[? string(master_atk)] -= 1
}