// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hitbox_function(creator, hitbox_properties){
	hbox = instance_create_depth(
		creator.x + (hitbox_properties.rel_pos.posx * creator.image_xscale),
		creator.y + hitbox_properties.rel_pos.posy,
		-100,
		hitbox_obj);
	//sprite
	hbox.pallete = creator.pallete;
	//general
	hbox.master = creator;
	hbox.master_atk = creator.sprite_index;
	hbox.hitspark = hitbox_properties.hitspark;
	hbox.image_xscale = hitbox_properties.scale_x * creator.image_xscale;
	hbox.image_yscale = hitbox_properties.scale_y;
	hbox.sprite_index = hitbox_properties.spr;
	hbox.rel_pos.posx = hitbox_properties.rel_pos.posx;
	hbox.rel_pos.posy = hitbox_properties.rel_pos.posy;
	hbox.grb_script = hitbox_properties.grb_script;
	hbox.dmg = (hitbox_properties.dmg);
	hbox.kdwn = (hitbox_properties.kdwn);
	//some changes on the framedata
	
	if variable_instance_exists(creator, "run_framedata"){
		hbox.hts = (hitbox_properties.hts - creator.run_framedata);
		hbox.bls = (hitbox_properties.bls - creator.run_framedata);
	}
	else{
		hbox.hts = (hitbox_properties.hts);
		hbox.bls = (hitbox_properties.bls);
	}
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
	hbox.pry_properties.velx = hitbox_properties.pry_properties.velx * creator.image_xscale;
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
	return hbox;
}
