/// @description Insert description here
// You can write your code in this editor
pallete = {
	sprite: noone,
	i : 0,
};


master = noone; //The creator of the hitbox
master_atk = noone;

hitspark = hitspark_normal;
sprite_index = hitbox_spr;
image_xscale = 1;
image_yscale = 1;
duration = 0;
boom_duration = 0;
dmg = 0;
hts = 0;
bls = 0;
strg = 0;
kdwn = false;
bloc = blc_types.mid;
reflect = false;
grb_script = function (_graber,_victim){};

rel_pos = {
	posx : 0,
	posy : 0,
};
kback = {
	strength : 0,
	angle : 0, //counter-clock
};

stt_effects = {
	burn : 0,
	paralysis : 0,
	cold : 0,
	poison : 0,
	curse : 0,
	water : false,
};

pry_properties = {
	velx : 0,
	vely : 0,
	bmrng : false,
	activation : {
		delay: -1,
		contact: false,
		summon: noone
	},
	physics : {
		grav : 0,
		air_frict : 0,
		grnd_frict : 0,
		bounce : false,
		collision : false,
		magnet : false,
	}
}

og_fullspeed = 0;