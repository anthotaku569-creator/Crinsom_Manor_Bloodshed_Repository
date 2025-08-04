/// @description Insert description here
// You can write your code in this editor

//extra stuff
_floormovement = noone;
should_reverse = false;
player_source = input_player_source_get(2);
xscale = image_xscale
techable = true;
bounding_box = noone;
pass = false;
run_framedata = 0;

//Frame advantage
frame_data = 0;
stun_data = 0;
actual_startup = 0;
startup_counter = true;

last_velx = 0
last_vely = 0


stats  = StatFunctions(10, 10, 10, 10);

guts = 1; //You'll see

erasing_sprite = 0

pallete = {
	sprite: spr_father_pallete,
	i : 0,
};

active_prys = ds_map_create();
cancel = false;

velx = 0;
vely = 0;
con_velx = 0;
con_vely = 0;
jump_cancel = true

grabing = {
	grb_script : function (_graber,_victim){},
	_graber : noone,
	_victim : noone,
}

no_infinte = false;

stt_effects = {
	burn : 0,
	paralysis : 0,
	cold : 0,
	poison : 0,
	curse : 0,
	regenerate : 0,
	passion: 0,
	berserker: 0,
};

scaling = {
	dmg: 1,
	combo: 0,
	kbck : 1,
	attack : noone,
	enemy : noone,
	cum_dmg: 0,
}

delay_kback = {
	angle: 0,
	strength: 0,
	other_dir: 0,
}

extras = {
	float : {
		can : true,
		time : 120,
		animation : Father_walk,		
	},
	air_dash : {
		can : true,
		able : true,
		animation : Father_airDash,
		velx : 16,
	},
	run : {
		can : true,
		animation : Father_walk,
		stop : Father_landing_3,
		velx : stats.ground.ground_speed + 10,
		inputs : {
			l : 0,
			r: 0,
		}
	},
	d_jmp : {
		has : true,
		can : true,
	},
	parry: {
		can : true,
		animations : {
			high : Father_parry_high,
			low : Father_parry_low,
		},
	},
	special_defense : true,
}

inputs = {
	k_right: "right_p1",
	k_left : "left_p1",
	k_up: "up_p1",
	k_down: "down_p1",
	k_spe: "spe_p1",
	k_pause: "pause_p1",
	k_L: "L_p1",
	k_M: "M_p1",
	k_H: "H_p1",
	k_S1: "S1_p1",
	k_S2: "S2_p1",
	k_S3: "S3_p1",
}

bars = {
	HealthBar : {
		actual : stats.weight.HealthPoint,
		show : stats.weight.HealthPoint,
		maximum :  stats.weight.HealthPoint,
	},
	HitstunBar: {
		actual : 0,
		maximum : 120,
		kdwn: 0, // 0 => no hitstun; 1 => light kdwn; 2 => heavy kdwn
	},
	InspirationBar: {
		actual : 25,
		maximum : 100,
	},
	Charge : {
		actual : 60,
		maximum: 80,
	}
}

state = states.idle;

prot = protections.nothing;

current_attack = noone; //de allí cambia a un ataque, como neutral tilt

p_bloc = {
	active : false,
	duration : 10,
	cooldown: 0,
}

animations = {
	enter: FatherHat_Super_I,
	idle: Father_idle,
	walk: Father_walk,
	walkback: Father_walk,
	step: Father_step,
	crouch: Father_crouch,
	air: {
		rising: Father_jmp_rising,
		falling: Father_jmp_falling
	},
	landing: {
		light: Father_landing_1,
		medium: Father_landing_2,
		heavy: Father_landing_3,
	},
	hitstun: Father_hitstun,
	paralyze: Father_paralyze,
	thumble: Father_thumble,
	kdown: {
		light: Father_Lkdown,
		heavy: Father_Hkdown,
	},
	bloc: {
		high: Father_bloc_high,
		low: Father_bloc_low,
		air: Father_bloc_air,
	},
	blocstun: {
		high: Father_blocstun_high,
		low: Father_blocstun_low,
		air: Father_blocstun_air,
	},
	redeye:{
		dash: Father_airDash_red,
		redpause: Father_redeye_1
	},
	entrance : Father_idle,
	death : Father_Lkdown,
	/*
	run : Father_walk,
	d_jmp : Father_walk,
	d_roll : Father_walk,*/
};

dodge_properties = {
	animation : Father_dodge,
	startup : 4,
	velx : 27.7,
	vely : 0,
	inv_length: 12,
}

summon_dspecial = {
	spr : Father_pry_dspecial3,
	scale_x : 1,
	scale_y : 1,
	duration : 4, // -2 pnts
	dmg : 20, // -6 pnts
	hts : 20, // -6 pnts
	bloc : blc_types.pry,//0
	reflect : false,
	grb_script : function (_graber,_victim){},
	rel_pos : {
		posx : 0,
		posy : 0,
	},
	kback : {
		strength : 20, // +1 pnts
		angle : 90, //counter-clock
	},
	stt_effects : {
		burn : 0,
		paralysis : 0,
		cold : 0,
		poison : 0,
		curse : 10,
		water : false,
	},
	pry_properties : {
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
			bounce : false,
			collision : false,
			magnet : false,
			grnd_frict : 0,
		},
	},
}

attacks = {
	n_L:{
		animation: Father_n_tilt,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 5,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2,
					dmg : 15,
					kdwn: false,
					hts : 7 + (4),
					bls : 7 + (2/2),
					bloc : blc_types.mid,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -48,
					},
					kback : {
						strength : (1*4), // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
			/*{
				start: 0,
				type: protections.nothing
				finish: 0,
			}*/
		],
		movements: [
			/*{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			}*/
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	d_L:{
		animation: Father_d_tilt,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 2, // -2 pnts
					dmg : 12, // -6 pnts
					kdwn: false,
					hts : 11 + (2),
					bls : 11 + (4/2),
					bloc : blc_types.low,
					reflect : false,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : 0,
					},
					kback : {
						strength : (1*2)*2, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
			/*{
				start: 0,
				type: protections.nothing
				finish: 0,
			}*/
		],
		movements: [
			/*{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			}*/
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	f_L:{
		animation: Father_u_tilt,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : 15, // -6 pnts
					kdwn: false,
					hts : 12 + (8),
					bls : 12 + (0/2),
					bloc : blc_types.mid,
					reflect : false,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -72,
					},
					kback : {
						strength : 12, // +1 pnts
						angle : 45, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
			{
				start: 2,
				type: protections.ovh_invul,
				finish: 9,
			}
		],
		movements: [
			/*{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			}*/
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	j_L:{
		animation: Father_n_tilt,
		lnd_strng: 1,
		hboxs: [
			//hit 1
			{
				create : 5,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2,
					dmg : 15,
					kdwn: false,
					hts : 7 + (4),
					bls : 7 + (2/2),
					bloc : blc_types.ovh,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -48,
					},
					kback : {
						strength : (1*4), // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
			/*{
				start: 0,
				type: protections.nothing
				finish: 0,
			}*/
		],
		movements: [
			/*{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			}*/
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
		
	n_M:{
		animation: Father_f_tilt,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 9,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2,
					dmg : 15,
					kdwn: false,
					hts : 12,
					bls : 4,
					bloc : blc_types.mid,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : (4), // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
			//hit 1
			{
				create : 11,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 2,
					dmg : 25,
					kdwn: false,
					hts : 11 + (4),
					bls : 11 + (8/2),
					bloc : blc_types.mid,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : (6), // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
			/*{
				start: 0,
				type: protections.nothing
				finish: 0,
			}*/
		],
		movements: [
			/*{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			}*/
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	d_M:{
		animation: Rafael_d_tilt,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 9,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 4, // -2 pnts
					dmg : 40, // -6 pnts
					kdwn: false,
					hts : 12 + (3),
					bls : 12 + (6/2),
					bloc : blc_types.low,
					reflect : false,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +32,
						posy : 0,
					},
					kback : {
						strength : (3)*2, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
			/*{
				start: 0,
				type: protections.nothing
				finish: 0,
			}*/
		],
		movements: [
			/*{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			}*/
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	j_M:{
		animation: Rafael_n_air,
		lnd_strng: 2,
		hboxs: [//hit 1
			{
				create : 5,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 1,
					duration : 8, // -2 pnts
					dmg : 45, // -6 pnts
					kdwn: false,
					hts : 13 + (6),
					bls : 13 + (2/2),
					bloc : blc_types.ovh,
					reflect : false,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +16,
						posy : 0,
					},
					kback : {
						strength : 6, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
			/*{
				start: 0,
				type: protections.nothing
				finish: 0,
			}*/
		],
		movements: [
			/*{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			}*/
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	n_H:{
		animation: Rafael_f_tilt,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 11,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 1,
					duration : 2,
					dmg : 68,
					kdwn: false,
					hts : 17 + 7,
					bls : 15,
					bloc : blc_types.mid,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : 10, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
			/*{
				start: 0,
				type: protections.nothing
				finish: 0,
			}*/
		],
		movements: [
			/*{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			}*/
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	d_H:{
		animation: Str4w_d_tilt,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 11,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 6, // -2 pnts
					dmg : 58, // -6 pnts
					kdwn: true,
					hts : 60,
					bls : 8,
					bloc : blc_types.low,
					reflect : false,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +32,
						posy : 0,
					},
					kback : {
						strength : 12, // +1 pnts
						angle : 12, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
			/*{
				start: 0,
				type: protections.nothing
				finish: 0,
			}*/
		],
		movements: [
			{
				start: 8,
				x_speed: 16,
				y_speed: 0,
			}
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	b_H:{
		animation: Rafael_u_air,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 11,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 1,
					duration : 4,
					dmg : 70,
					kdwn: true,
					hts : 100,
					bls : 12,
					bloc : blc_types.mid,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : 16, // +1 pnts
						angle : 50, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
			/*{
				start: 0,
				type: protections.nothing
				finish: 0,
			}*/
		],
		movements: [
			/*{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			}*/
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	j_H:{
		animation: Rafael_f_air,
		lnd_strng: 3,
		hboxs: [//hit 1
			{
				create : 8,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 2,
					duration : 4, // -2 pnts
					dmg : 80, // -6 pnts
					kdwn: true,
					hts : 24 + (60),
					bls : 12,
					bloc : blc_types.ovh,
					reflect : false,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : 0,
					},
					kback : {
						strength : 30, // +1 pnts
						angle : -75, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
			/*{
				start: 0,
				type: protections.nothing
				finish: 0,
			}*/
		],
		movements: [
			/*{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			}*/
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	empty : {
		animation: sprite_index, //18 frames total
		lnd_strng: -1,
		hboxs: [],
		helper: {
			frame: -1,
			object: noone
		},
		prots : [
			/*{
				start: 0,
				type: protections.nothing
				finish: 0,
			}*/
		],
		movements: [
			/*{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			}*/
		],
		cost : 0,
		scrpt : function(_self){}
	},
	
	grab : {
		animation: Father_grab,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 3,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2,
					dmg : 0,
					kdwn: false,
					hts : 0,
					bls : 0,
					bloc : blc_types.grb,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){
						_victim.vely = _graber.vely;
						switch(_graber.sprite_index){
							case Father_grab:
							
								//victima
								_victim.image_speed=0
								_victim.sprite_index = _victim.animations.hitstun
								_victim.bars.HitstunBar.actual += 10
								_victim.image_xscale = _graber.image_xscale*-1
								_victim.x = _graber.x + 24 * _graber.image_xscale
								_victim.y = _graber.y
								_victim.depth = 0
								_victim.image_index=0
								
								
								if input_check(_victim.inputs.k_L, _victim.wich_player , 5)
									and input_check(_victim.inputs.k_M, _victim.wich_player, 5)
									and _victim.techable == true{
									_victim.velx = 8* _graber.image_xscale;
									_graber.velx = -8* _graber.image_xscale;
									_victim.sprite_index = _victim.animations.landing.heavy;
									_graber.sprite_index = _graber.animations.landing.heavy;
									_victim.state = states.kdown_recovery;
									_graber.state = states.kdown_recovery;
								}
								
								if input_check(_graber.inputs.k_right, _graber.wich_player) and _graber.image_xscale == -1{//_graber.buffer.horizontal == hor_buffer.d_left{
									_graber.sprite_index = Father_b_trhow;
								}
								else if input_check(_graber.inputs.k_left, _graber.wich_player) and _graber.image_xscale == 1{
									_graber.sprite_index = Father_b_trhow;
								}
								else{
									_graber.sprite_index = Father_f_trhow;
								}
								
								break;
							case Father_f_trhow:
								var dmg = 40*_victim.scaling.dmg;
								var hts = 45 - _victim.stats.weight.hit_red;
								var kbck = 10; var angle = 30;
								var kdwn = true;
								if (_graber.image_index >= 0 and _graber.image_index <= 3){
									//move
									_victim.sprite_index = _victim.animations.crouch
									_victim.x = _graber.x + 12 * _graber.image_xscale
									_victim.y = _graber.y
								}
								if (_graber.image_index >= 4 and _graber.image_index <= 8){
									//move
									_victim.sprite_index = _victim.animations.crouch
									_victim.x = _graber.x + 0 * _graber.image_xscale
									_victim.y = _graber.y
								}
								//when the hit actually hits
								if (_graber.image_index == 8){
									//current_attack = attacks.empty
									match_controller.hit_pause(dmg, hts, kbck)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.x = _graber.x + 24 * _graber.image_xscale
									_victim.y = _graber.y
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.8
									_victim.scaling.kbck = _victim.scaling.kbck*1.2
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									_victim.bars.HitstunBar.kdwn = 1;
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = Father_f_trhow;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.m_attack;
								}
								break;
							case Father_b_trhow:
								var dmg = 15*_victim.scaling.dmg;
								var hts = 65 - _victim.stats.weight.hit_red;
								var kbck = 10; var angle = 150;
								if (_graber.image_index >= 3 and _graber.image_index <= 6){
									_victim.image_index=30
									//move
									_victim.sprite_index = _victim.animations.hitstun
									_victim.x = _graber.x + 36 * _graber.image_xscale
									_victim.y = _graber.y - 4
								}
								if (_graber.image_index >= 7 and _graber.image_index <= 10){
									_victim.image_index=30
									//move
									_victim.sprite_index = _victim.animations.hitstun
									if _victim.image_xscale == 1{
										_victim.image_angle = -90
									}
									else{
										_victim.image_angle = 90
									}
									_victim.x = _graber.x + 96 * _graber.image_xscale
									_victim.y = _graber.y - 48
								}
								//when the hit actually hits
								if (_graber.image_index == 11){
									//current_attack = attacks.empty
									match_controller.hit_pause(dmg, hts, kbck)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.x = _graber.x - 24 * _graber.image_xscale
									_victim.y = _graber.y
									_victim.image_angle = 0
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.8
									_victim.scaling.kbck = _victim.scaling.kbck*1.2
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = Father_b_trhow;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.m_attack;
								}
								break;
							default:
								break;
						}
					},
					rel_pos : {
						posx : +24,
						posy : -48,
					},
					kback : {
						strength : 0, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
		],
		movements: [
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	a_grab : {
		animation: Father_grab,
		lnd_strng: 2,
		hboxs: [
			//hit 1
			{
				create : 3,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2,
					dmg : 0,
					kdwn: false,
					hts : 0,
					bls : 0,
					bloc : blc_types.grb,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){
						_victim.vely = _graber.vely;
						switch(_graber.sprite_index){
							case Father_grab:
								//victima
								_victim.image_speed=0
								_victim.sprite_index = _victim.animations.hitstun
								_victim.bars.HitstunBar.actual += 10
								_victim.image_xscale = _graber.image_xscale*-1
								_victim.x = _graber.x + 24 * _graber.image_xscale
								_victim.y = _graber.y
								_victim.depth = 0
										_victim.image_index=0
								
								
								if input_check(_victim.inputs.k_L, _victim.wich_player , 5)
									and input_check(_victim.inputs.k_M, _victim.wich_player, 5)
									and _victim.techable == true{
									_victim.velx = 8* _graber.image_xscale;
									_graber.velx = -8* _graber.image_xscale;
									_victim.sprite_index = _victim.animations.landing.heavy;
									_graber.sprite_index = _graber.animations.landing.heavy;
									_victim.state = states.kdown_recovery;
									_graber.state = states.kdown_recovery;
								}
								
								if input_check(_graber.inputs.k_right, _graber.wich_player) and _graber.image_xscale == -1{//_graber.buffer.horizontal == hor_buffer.d_left{
									_graber.sprite_index = Father_b_trhow;
								}
								else if input_check(_graber.inputs.k_left, _graber.wich_player) and _graber.image_xscale == 1{
									_graber.sprite_index = Father_b_trhow;
								}
								else{
									_graber.sprite_index = Father_f_trhow;
								}
								break;
							case Father_f_trhow:
								var dmg = 40*_victim.scaling.dmg;
								var hts = 45 - _victim.stats.weight.hit_red;
								var kbck = 10; var angle = 30;
								var kdwn = true;
								if (_graber.image_index >= 0 and _graber.image_index <= 3){
									//move
									_victim.sprite_index = _victim.animations.crouch
									_victim.x = _graber.x + 12 * _graber.image_xscale
									_victim.y = _graber.y
								}
								if (_graber.image_index >= 4 and _graber.image_index <= 8){
									//move
									_victim.sprite_index = _victim.animations.crouch
									_victim.x = _graber.x + 0 * _graber.image_xscale
									_victim.y = _graber.y
								}
								//when the hit actually hits
								if (_graber.image_index == 8){
									//current_attack = attacks.empty
									match_controller.hit_pause(dmg, hts, kbck)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.x = _graber.x + 24 * _graber.image_xscale
									_victim.y = _graber.y
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.8
									_victim.scaling.kbck = _victim.scaling.kbck*1.2
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									_victim.bars.HitstunBar.kdwn = 1;
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = Father_f_trhow;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.m_attack;
								}
								break;
							case Father_b_trhow:
								var dmg = 15*_victim.scaling.dmg;
								var hts = 65 - _victim.stats.weight.hit_red;
								var kbck = 10; var angle = 150;
								if (_graber.image_index >= 3 and _graber.image_index <= 6){
									_victim.image_index=30
									//move
									_victim.sprite_index = _victim.animations.hitstun
									_victim.x = _graber.x + 36 * _graber.image_xscale
									_victim.y = _graber.y - 4
								}
								if (_graber.image_index >= 7 and _graber.image_index <= 10){
									_victim.image_index=30
									//move
									_victim.sprite_index = _victim.animations.hitstun
									if _victim.image_xscale == 1{
										_victim.image_angle = -90
									}
									else{
										_victim.image_angle = 90
									}
									_victim.x = _graber.x + 96 * _graber.image_xscale
									_victim.y = _graber.y - 48
								}
								//when the hit actually hits
								if (_graber.image_index == 11){
									//current_attack = attacks.empty
									match_controller.hit_pause(dmg, hts, kbck)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.x = _graber.x - 24 * _graber.image_xscale
									_victim.y = _graber.y
									_victim.image_angle = 0
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.8
									_victim.scaling.kbck = _victim.scaling.kbck*1.2
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = Father_b_trhow;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.m_attack;
								}
								break;
							default:
								break;
						}
						
					},
					rel_pos : {
						posx : +24,
						posy : -48,
					},
					kback : {
						strength : 0, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
		],
		movements: [
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	n_S_one:{
		animation: Father_nnspecial,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 10,
				hbox: {
					hitspark: hitspark_normal,
					spr : Father_pry_nspecial,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 60,
					dmg : 15,
					kdwn: false,
					hts : 10,
					bls : 17 ,
					bloc : blc_types.pry,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -48,
					},
					kback : {
						strength : (8), // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 10,
						curse : 0,
						water : false,
					},
					pry_properties : {
						velx : 4,
						vely : 0,
						bmrng : false,
						activation : {
							delay: -1,
							contact: false,
							summon: noone
						},
						physics : {
							grav : 0,
							air_frict : 0.1,
							bounce : true,
							collision : true,
							magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
			/*{
				start: 0,
				type: protections.nothing
				finish: 0,
			}*/
		],
		movements: [
			/*{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			}*/
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	n_S_two:{
		animation: Father_nf_special, //18 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 13,
				hbox: {
					hitspark: hitspark_thunder,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : 80, // -6 pnts
					kdwn: true,
					hts : 80, // -6 pnts
					bls : 7,
					bloc : blc_types.mid,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : true,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : 24, // +3 pnts
						angle : 30, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 20,
						cold : 0,
						poison : 0,
						curse : 0,
						water : true,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		helper: {
			frame: -1,
			object: noone
		},
		prots : [
			{
				start: 6,
				type: protections.proy_invul,
				finish: 22,
			}
		],
		movements: [
			{
				start: 13,
				x_speed: 8,
				y_speed: 0,
			},
			{
				start: 14,
				x_speed: 8,
				y_speed: 0,
			},
			{
				start: 15,
				x_speed: 8,
				y_speed: 0,
			},
			{
				start: 16,
				x_speed: 8,
				y_speed: 0,
			},
			{
				start: 17,
				x_speed: 8,
				y_speed: 0,
			},
			{
				start: 18,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 18,
				x_speed: 4.1,
				y_speed: 0,
			},
		],
		cost : 10,
		scrpt : function(_self){}
	},
	
	n_S_three:{
		animation: Father_nu_special, //18 frames total
		lnd_strng: 4,
		hboxs: [
			//hit 1
			{
				create : 5,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 1.5,
					duration : 2, // -2 pnts
					dmg : 102, // -6 pnts
					kdwn: true,
					hts : 80, // -6 pnts
					bls : 7 + (2/2),
					bloc : blc_types.mid,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : -32,
					},
					kback : {
						strength : 20, // +1 pnts
						angle : 80, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : true,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		helper: {
			frame: -1,
			object: noone
		},
		prots : [
			{
				start: 1,
				type: protections.full,
				finish: 20,
			}
		],
		movements: [
			{
				start: 2,
				x_speed: 2,
				y_speed: -20,
			}
		],
		cost : 10,
		scrpt : function(_self){}
	},
	
	a_S_one:{
		animation: Father_nnspecial,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 10,
				hbox: { hitspark: hitspark_normal,
					spr : Father_pry_nspecial,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 60,
					dmg : 15,
					kdwn: false,
					hts : 7 + (4),
					bls : 7 + (2/2),
					bloc : blc_types.pry,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -48,
					},
					kback : {
						strength : (8), // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 10,
						curse : 0,
						water : false,
					},
					pry_properties : {
						velx : 4,
						vely : 0,
						bmrng : false,
						activation : {
							delay: -1,
							contact: false,
							summon: noone
						},
						physics : {
							grav : 0,
							air_frict : 0.1,
							bounce : true,
							collision : true,
							magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		prots : [
			/*{
				start: 0,
				type: protections.nothing
				finish: 0,
			}*/
		],
		movements: [
			{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 2,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 10,
				x_speed: 0,
				y_speed: grav_1 * -1,
			},
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	a_S_two:{
		animation: Father_nf_special, //18 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 13,
				hbox: {
					hitspark: hitspark_thunder,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : 80, // -6 pnts
					kdwn: true,
					hts : 80, // -6 pnts
					bls : 7,
					bloc : blc_types.mid,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : true,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : 24, // +3 pnts
						angle : 30, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 20,
						cold : 0,
						poison : 0,
						curse : 0,
						water : true,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		helper: {
			frame: -1,
			object: noone
		},
		prots : [
			{
				start: 6,
				type: protections.proy_invul,
				finish: 22,
			}
		],
		movements: [
			{
				start: 13,
				x_speed: 8,
				y_speed: 0,
			},
			{
				start: 14,
				x_speed: 8,
				y_speed: 0,
			},
			{
				start: 15,
				x_speed: 8,
				y_speed: 0,
			},
			{
				start: 16,
				x_speed: 8,
				y_speed: 0,
			},
			{
				start: 17,
				x_speed: 8,
				y_speed: 0,
			},
			{
				start: 18,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 18,
				x_speed: 4.1,
				y_speed: 0,
			},
		],
		cost : 10,
		scrpt : function(_self){}
	},
	
	a_S_three:{
		animation: Father_nu_special, //18 frames total
		lnd_strng: 4,
		hboxs: [
			//hit 1
			{
				create : 5,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 1.5,
					duration : 2, // -2 pnts
					dmg : 102, // -6 pnts
					kdwn: true,
					hts : 80, // -6 pnts
					bls : 7 + (2/2),
					bloc : blc_types.mid,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : -32,
					},
					kback : {
						strength : 20, // +1 pnts
						angle : 80, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : true,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		helper: {
			frame: -1,
			object: noone
		},
		prots : [
			{
				start: 1,
				type: protections.full,
				finish: 20,
			}
		],
		movements: [
			{
				start: 2,
				x_speed: 2,
				y_speed: -20,
			}
		],
		cost : 10,
		scrpt : function(_self){}
	},
	
}

super_func = function (){}
/*


	n_d_spe : {
		animation: Father_ndspecial, //13 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 16,
				hbox: { hitspark: hitspark_normal,
					spr : Father_pry_dspecial1,
					scale_x : 1,
					scale_y : 1,
					duration : 120, // -2 pnts
					dmg : 0, // -6 pnts
					hts : 0, // -6 pnts
					bloc : blc_types.pry,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +48,
						posy : -48,
					},
					kback : {
						strength : 0, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
						velx : 0,
						vely : 0,
						bmrng : false,
						activation : {
							delay: 8,
							contact: true,
							summon: summon_dspecial
						},
						physics : {
							grav : 0,
							air_frict : 0,
							bounce : false,
							collision : false,
							magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		helper: {
			frame: -1, 
			object: noone
		},
		install: noone,
		prots : [
		],
		movements: [
		],
		follow_ups: [
		],
		effects : [
		],
		cost :{
			inspiration: 0,
			charge: true,
		}
	},
	
	a_d_spe : {
		animation: Father_ndspecial, //13 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 16,
				hbox: { hitspark: hitspark_normal,
					spr : Father_pry_dspecial1,
					scale_x : 1,
					scale_y : 1,
					duration : 120, // -2 pnts
					dmg : 0, // -6 pnts
					hts : 0, // -6 pnts
					bloc : blc_types.pry,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +48,
						posy : -48,
					},
					kback : {
						strength : 0, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
						velx : 0,
						vely : 0,
						bmrng : false,
						activation : {
							delay: 8,
							contact: true,
							summon: summon_dspecial
						},
						physics : {
							grav : 0,
							air_frict : 0,
							bounce : false,
							collision : false,
							magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		helper: {
			frame: -1,
			object: noone
		},
		install: noone,
		prots : [
		],
		movements: [
		],
		follow_ups: [
		],
		effects : [
		],
		cost :{
			inspiration: 0,
			charge: true,
		}
	},
	
	bloc_spe : {
		animation: Father_nfu_special, //18 frames total
		lnd_strng: 4,
		hboxs: [
			//hit 1
			{
				create : 19,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 2.5,
					duration : 4, // -2 pnts
					dmg : (7*2), // -6 pnts
					hts : 9 + (30*2), // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : 0,
					},
					kback : {
						strength : (4*4)*2, // +1 pnts
						angle : -45, //counter-clock
					},
					stt_effects : {
						burn : 10,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
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
							bounce : false, collision : false,magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		helper: {
			frame: -1,
			object: noone
		},
		install: noone,
		prots : [
			{
				start: 1,
				type: protections.armor,
				finish: 25,
			}
		],
		movements: [
			{
				start: 7,
				x_speed: 3.5,
				y_speed: -10.7,
			},
		],
		follow_ups: [
		],
		effects : [
		],
		cost :{
			inspiration: 15,
			charge: false,
		}
	},


attacks.d_spe2 = {
		animation: Father_ndspecial2, //13 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 16,
				hbox: { hitspark: hitspark_normal,
					spr : Father_pry_dspecial2,
					scale_x : 1,
					scale_y : 1,
					duration : 90, // -2 pnts
					dmg : 0, // -6 pnts
					hts : 0, // -6 pnts
					bloc : blc_types.pry,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +48,
						posy : -48,
					},
					kback : {
						strength : 0, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
						velx : 0,
						vely : 0,
						bmrng : false,
						activation : {
							delay: -1,
							contact: false,
							summon: summon_dspecial
						},
						physics : {
							grav : 0,
							air_frict : 0,
							bounce : false,
							collision : false,
							magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
		],
		helper: {
			frame: -1,
			object: noone
		},
		install: noone,
		prots : [
		],
		movements: [
		],
		follow_ups: [
		],
		effects : [
		],
		cost :{
			inspiration: 0,
			charge: false,
		}
}

attacks.u_tilt.follow_ups[0] = {
	frame : 9,
	action : inputs.k_L, // dejar presionado L
	follow: attacks.fu_tilt,
}
attacks.n_f_spe.follow_ups = [
{
	frame : 22,
	action : inputs.k_down, // dejar presionado L
	follow: attacks.n_fd_spe,
},
{
	frame : 22,
	action : inputs.k_up, // dejar presionado L
	follow: attacks.n_fu_spe,
}
]
attacks.n_d_spe.follow_ups[0] = {
	frame : 10,
	action : inputs.k_spe, // dejar presionado L
	follow: attacks.d_spe2,
}
attacks.a_d_spe.follow_ups[0] = {
	frame : 10,
	action : inputs.k_spe, // dejar presionado spe
	follow: attacks.d_spe2,
}

attacks.dash_attack = attacks.f_tilt;

attacks.dash_attack = attacks.f_tilt;
*/


event_user(0);

