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
			air: Father_parry_high,
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

input_checkers = {
			tap: {
				left: false,
				right: false,
				up: false,
				down: false,
				l: false,
				m: false,
				h: false,
				s1: false,
				s2: false,
				s3: false,
				_pause: false
			},
			hold: {
				left: false,
				right: false,
				up: false,
				down: false,
				l: false,
				m: false,
				h: false,
				s1: false,
				s2: false,
				s3: false,
				_pause: false
			},
			release: {
				left: false,
				right: false,
				up: false,
				down: false,
				l: false,
				m: false,
				h: false,
				s1: false,
				s2: false,
				s3: false,
				_pause: false
			},
			double: {
				left: false,
				right: false,
				up: false,
				down: false,
				l: false,
				m: false,
				h: false,
				s1: false,
				s2: false,
				s3: false,
				_pause: false
			}
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
	Humanity: {
		actual : 100,
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


check_floor = bbox_place_meeting(self.x,self.y,Collision_normal);
check_collision = bbox_collision_function(self.x, self.y+1, false);

press_hold_right = input_checkers.hold.right;
press_hold_left = input_checkers.hold.left;

animations = {
	enter: FatherHat_Super_I,
	idle: Father_idle,
	walk: Father_walk,
	walkback: Father_walk,
	step: Father_step,
	crouch: Father_crouch,
	burst: Father_parry_high,
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
									match_controller.hit_pause(1)
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
									match_controller.hit_pause(1)
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
									and _victim.techable == true {
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
									match_controller.hit_pause(1)
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
									match_controller.hit_pause(1)
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

/// @function					input_reader
/// @description				Reads the necesary inputs for the charater object to work, enemy or otherwise.
function input_reader() {
	if global.training_mode == true and
		wich_player == 2 and
		match_controller.training_settings[? "Control"] != 0 {
			training_settings();
	}
	else {
		//var _dt = delta_time / 20;
		var _dt = room_speed/20;
		//taps
		input_checkers.tap.left			= input_check_pressed(inputs.k_left		, wich_player, _dt);
		input_checkers.tap.right		= input_check_pressed(inputs.k_right	, wich_player, _dt);
		input_checkers.tap.up			= input_check_pressed(inputs.k_up		, wich_player, _dt);
		input_checkers.tap.down			= input_check_pressed(inputs.k_down		, wich_player, _dt);
		input_checkers.tap.l			= input_check_pressed(inputs.k_L		, wich_player, _dt);
		input_checkers.tap.m			= input_check_pressed(inputs.k_M		, wich_player, _dt);
		input_checkers.tap.h			= input_check_pressed(inputs.k_H		, wich_player, _dt);
		input_checkers.tap.s1			= input_check_pressed(inputs.k_S1		, wich_player, _dt);
		input_checkers.tap.s2			= input_check_pressed(inputs.k_S2		, wich_player, _dt);
		input_checkers.tap.s3			= input_check_pressed(inputs.k_S3		, wich_player, _dt);
		input_checkers.tap._pause		= input_check_pressed(inputs.k_pause	, wich_player);
		//holds
		input_checkers.hold.left		= input_check(inputs.k_left		, wich_player);
		input_checkers.hold.right		= input_check(inputs.k_right	, wich_player);
		input_checkers.hold.up			= input_check(inputs.k_up		, wich_player);
		input_checkers.hold.down		= input_check(inputs.k_down		, wich_player);
		input_checkers.hold.l			= input_check(inputs.k_L		, wich_player);
		input_checkers.hold.m			= input_check(inputs.k_M		, wich_player);
		input_checkers.hold.h			= input_check(inputs.k_H		, wich_player);
		input_checkers.hold.s1			= input_check(inputs.k_S1		, wich_player);
		input_checkers.hold.s2			= input_check(inputs.k_S2		, wich_player);
		input_checkers.hold.s3			= input_check(inputs.k_S3		, wich_player);
		input_checkers.hold._pause		= input_check(inputs.k_pause	, wich_player);
		//release
		input_checkers.release.left			= input_check_released(inputs.k_left	, wich_player);
		input_checkers.release.right		= input_check_released(inputs.k_right	, wich_player);
		input_checkers.release.up			= input_check_released(inputs.k_up		, wich_player);
		input_checkers.release.down			= input_check_released(inputs.k_down	, wich_player);
		input_checkers.release.l			= input_check_released(inputs.k_L		, wich_player);
		input_checkers.release.m			= input_check_released(inputs.k_M		, wich_player);
		input_checkers.release.h			= input_check_released(inputs.k_H		, wich_player);
		input_checkers.release.s1			= input_check_released(inputs.k_S1		, wich_player);
		input_checkers.release.s2			= input_check_released(inputs.k_S2		, wich_player);
		input_checkers.release.s3			= input_check_released(inputs.k_S3		, wich_player);
		input_checkers.release._pause		= input_check_released(inputs.k_pause	, wich_player);
		//double
		input_checkers.double.left			= input_check_double_pressed(inputs.k_left		, wich_player, _dt + 1);
		input_checkers.double.right			= input_check_double_pressed(inputs.k_right		, wich_player, _dt + 1);
		input_checkers.double.up			= input_check_double_pressed(inputs.k_up		, wich_player, _dt + 1);
		input_checkers.double.down			= input_check_double_pressed(inputs.k_down		, wich_player, _dt + 1);
		input_checkers.double.l				= input_check_double_pressed(inputs.k_L			, wich_player, _dt + 1);
		input_checkers.double.m				= input_check_double_pressed(inputs.k_M			, wich_player, _dt + 1);
		input_checkers.double.h				= input_check_double_pressed(inputs.k_H			, wich_player, _dt + 1);
		input_checkers.double.s1			= input_check_double_pressed(inputs.k_S1		, wich_player, _dt + 1);
		input_checkers.double.s2			= input_check_double_pressed(inputs.k_S2		, wich_player, _dt + 1);
		input_checkers.double.s3			= input_check_double_pressed(inputs.k_S3		, wich_player, _dt + 1);
		input_checkers.double._pause		= input_check_double_pressed(inputs.k_pause		, wich_player);	
	}
}

//create bounding box

function assign_boundingbox(){
	if (bounding_box==noone){
		bounding_box=instance_create_depth(x,y, -100, Obj_collision);
		bounding_box.char_bounded = self;
	}
	else{
		bounding_box.char_bounded = self;
	}
}

function bbox_place_meeting(posx, posy, obj_col){
	with(bounding_box){
		return place_meeting(posx,posy,obj_col);
	}
}

function bbox_collision_function(posx, posy, _pass = false){
	with(bounding_box){
		return collision_function(posx,posy, _pass);
	}
}

function bbox_instance_place(posx, posy, obj_col){
	var inst = noone;
	with(bounding_box){
		inst =  instance_place(posx,posy, obj_col);
	}
	return inst;
}

#region Functions indeed

#region training mode

	function switch_stance(){
		switch(match_controller.training_settings[? "Block Stance"]){
			case 0:
				if (input_checkers.hold.down == true){
					input_checkers.hold.down = false;
				}
				break;
			case 1:
				if (input_checkers.hold.down == false){
					input_checkers.hold.down = true;
				}
				break;
			case 2:
				if place_meeting(x, y, hitbox_obj) {
					var frame_block = choose(0, 1);
					if frame_block == 0 {
						if (input_checkers.hold.down == true){
							input_checkers.hold.down = false;
						}
					}
					else{
						if (input_checkers.hold.down == false){
							input_checkers.hold.down = true;
						}
					}
				}
				break;
			case 3:
				if !variable_instance_exists(self, "hitbox_bloc"){
					hitbox_bloc = blc_types.mid;
				}
				if enemy_current != noone {
					//hboxs
					var boxes = array_length(enemy_current.hboxs);
					for (var i = 0; i < boxes; i += 1){
						if (
						match_controller.player_one.image_index < enemy_current.hboxs[i].create + enemy_current.hboxs[i].hbox.duration
						and match_controller.player_one.image_index > enemy_current.hboxs[i].create - 5
						){
							hitbox_bloc = enemy_current.hboxs[i].hbox.bloc;
							break;
						}
					}
				}
				//
				if hitbox_bloc == blc_types.ovh {
					if (input_checkers.hold.down == true){
						input_checkers.hold.down = false;
					}
				}
				else{
					if (input_checkers.hold.down == false){
						input_checkers.hold.down = true;
					}
				}
				break;
			default:
				if (input_checkers.hold.down == true and should_reverse != true){
					input_checkers.hold.down = false;
				}
				break;
		}
	}

	function training_settings(){
	    var ts = match_controller.training_settings;
	    var p1 = match_controller.player_one;

		var blc = "left";
		
		if match_controller.x < x {
			blc = "right";
		}

	    var control  = ts[? "Control"];
	    var block    = ts[? "Block"];
	    var grabPar  = ts[? "Grab tech"];
	    var instRec  = ts[? "Kndwn recovery"];
	    var recovery = ts[? "Recovery"];
	    var burst = ts[? "Humanity Burst"];
		
		var allow_block = (recovery == 0 || !should_reverse);
		
		enemy_current = p1.current_attack;
		
	    if (enemy_current != noone &&
	        enemy_current.animation != p1.sprite_index)
	    {
	        enemy_current = noone;
	    }
		
		var boxes = 0;
		if enemy_current != noone {
			boxes = array_length(enemy_current.hboxs);
		}
		
		switch (block)
	    {
	        case 3: // shield
				input_checkers.hold.h = false;
				input_checkers.hold.m = false;
				input_checkers.tap.h = false;
				input_checkers.tap.m = false;
	            switch_stance();
				if (allow_block){
					
					for (var i = 0; i < boxes; i += 1){
						if (
						match_controller.player_one.image_index < enemy_current.hboxs[i].create + enemy_current.hboxs[i].hbox.duration
						and match_controller.player_one.image_index > enemy_current.hboxs[i].create - 5
						){
						input_checkers.hold.h = true;
						input_checkers.hold.m = true;
						input_checkers.tap.h = true;
						input_checkers.tap.m = true;
						input_checkers.tap.l = false;
						}
					}
					if distance_to_object(hitbox_obj) < 16 {
						input_checkers.hold.h = true;
						input_checkers.hold.m = true;
						input_checkers.tap.h = true;
						input_checkers.tap.m = true;
						input_checkers.tap.l = false;
					}
				}
	        break;

	        case 2: // Perfect block
	            p_bloc.active = true;
	            p_bloc.duration = 10;
	            p_bloc.cooldown = 0;
				variable_struct_set(input_checkers.hold, blc, false);
	            if (allow_block)
	            {
	                switch_stance();
					for (var i = 0; i < boxes; i += 1){
						if (
						match_controller.player_one.image_index < enemy_current.hboxs[i].create + enemy_current.hboxs[i].hbox.duration
						and match_controller.player_one.image_index > enemy_current.hboxs[i].create - 5
						){
							variable_struct_set(input_checkers.hold, blc, true);
						}
					}
					if distance_to_object(hitbox_obj) < 16 {
						variable_struct_set(input_checkers.hold, blc, true);
					}
	            }
				break;

	        case 1: // Normal block
	            p_bloc.active = false;
	            p_bloc.duration = -100;
	            p_bloc.cooldown = 10000;
				variable_struct_set(input_checkers.hold, blc, false);
	            if (allow_block)
	            {
	                switch_stance();
					for (var i = 0; i < boxes; i += 1){
						if (
						match_controller.player_one.image_index < enemy_current.hboxs[i].create + enemy_current.hboxs[i].hbox.duration
						and match_controller.player_one.image_index > enemy_current.hboxs[i].create - 5
						){
							variable_struct_set(input_checkers.hold, blc, true);
						}
					}
					if distance_to_object(hitbox_obj) < 16 {
						variable_struct_set(input_checkers.hold, blc, true);
					}
	            }
				break;
	    }
		
		switch (grabPar) {
        case 1:
            if (state == states.grab &&
                sprite_index == animations.hitstun &&
                choose(true, false))
            {
                input_checkers.tap.l = true;
                input_checkers.tap.m = true;
            }
            else
            {
                input_checkers.tap.l = false;
                input_checkers.tap.m = false;
            }
        break;
        case 2: 
            var bloc_type = 0;

            if (enemy_current != noone)
            {
                boxes = array_length(enemy_current.hboxs);
                if (boxes > 0)
                {
                    var h = enemy_current.hboxs[0];
                    if (p1.image_index < h.create + 2 &&
                        p1.image_index > h.create - 2)
                    {
                        bloc_type = h.hbox.bloc;
                    }
                }
            }

            if (bloc_type == blc_types.grb) {
                input_checkers.tap.l = true;
                input_checkers.tap.m = true;
			}
            else {
                input_checkers.tap.l = false;
                input_checkers.tap.m = false;
			}
        break;
    }
		
		var can_inst_recover =
	        (state == states.knockdown and
			bars.HitstunBar.kdwn == 1 and
	        image_index <= 6) or (state == states.hitstun and bars.HitstunBar.kdwn == 1)

	    switch (instRec)
	    {
	        case 2:
	            input_checkers.tap.l = can_inst_recover;
	        break;

	        case 1:
	            if (choose(false, true)){
	                input_checkers.tap.l = can_inst_recover;
				}
	            else {
	                input_checkers.tap.l = false;
				} 
	        break;
	    }
	
		switch (recovery) {
	        case 1: // Attack reversal
	            if (should_reverse)
	            {
	                input_checkers.tap.l = true;
	            }
	            else
	            {
	                 input_checkers.tap.l = false;
	            }
	        break;

	        case 2: // Special 1 reversal
	            if (should_reverse)
	            {
	                input_checkers.tap.s1 = true;
	            }
	            else
	            {
	                input_checkers.tap.special = false;
	            }
	        break;

	        case 3: // Special 2 reversal
	            if (should_reverse)
	            {
	                input_checkers.tap.s2 = true;
	            }
	            else
	            {
	                input_checkers.tap.s2 = false;
	            }
	        break;

	        case 4: // Special 2 reversal
	            if (should_reverse)
	            {
	                input_checkers.tap.s3 = true;
	            }
	            else
	            {
	                input_checkers.tap.s3 = false;
	            }
	        break;
			
	        default:
	            should_reverse = false;
	        break;
			}
	
		var can_burst = (state == states.hitstun) 
		switch (burst)
	    {
	        case 2:
	            input_checkers.tap.m = can_burst;
	            input_checkers.tap.h = can_burst;
	        break;

	        case 1:
	            if (choose(false, true)){
		            input_checkers.tap.m = can_burst;
		            input_checkers.tap.h = can_burst;
				}
	            else {
	                input_checkers.tap.m = false;
		            input_checkers.tap.h = false;
				} 
	        break;
	    }
	}

	function GetFrameData(){
		if (wich_player == 1) {
			var _enemy = match_controller.player_two;
			if state == states.l_attack or state == states.special_atack
					or state == states.m_attack or state == states.h_attack
					or state == states.super_atack or state == states.landing {
				if _enemy.bars.HitstunBar.actual > 0 or _enemy.stt_effects.paralysis > 0
					or _enemy.state == states.knockdown
					or _enemy.state == states.kdown_recovery {
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
#endregion

function InspirationGain(){
	if sign(velx) == sign(match_controller.x - x){
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
	if input_checkers.hold.right and velx < stats.ground.ground_speed{
		velx = stats.ground.ground_speed;
	}
	//left
	if input_checkers.hold.left and velx > -stats.ground.ground_speed{
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
					if scaling.enemy!= noone {//velx != 0 and input_checkers.hold.right{
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
					if scaling.enemy!= noone{//velx != 0 and input_checkers.hold.right{
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
		if input_checkers.hold.right{//velx != 0 and input_checkers.hold.right{
			if velx != 0 {
				x += stats.weight.DI_hold;
			}
			else{
				velx = stats.weight.DI_hold;
			}
		}
		if input_checkers.hold.left{// velx != 0 and input_checkers.hold.left{
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
		if (state == states.l_attack or
			state == states.m_attack or
			state == states.h_attack or
			state == states.special_atack
			or state == states.super_atack){
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
	if !(input_checkers.hold.right and input_checkers.hold.left){
		if state == states.idle or state == states.block or state == states.run or state == states.air_dash{
			if (input_checkers.hold.left and image_xscale == 1)
				or (input_checkers.hold.right and image_xscale == -1){
				return true;
			}
		}
	}
	return false;
}

function block_near(){
	var _enemy_hit = instance_place(x + 24*image_xscale, y, hitbox_obj )
	if !(input_checkers.hold.right and input_checkers.hold.left){
		if blocking_function() and _enemy_hit!= noone and _enemy_hit.master != self {
			return true;
		}
	}
	return false;
}

#region attack functions

	function light_attack(){
		if cancel == true {
			prot = protections.nothing;
			if bbox_collision_function(x, y + 1) and vely >= 0{
				if input_checkers.tap.l and !input_checkers.hold.up{
					if state != states.run{
						run_framedata = 0;
					}
					if input_checkers.hold.down{
						functionAttackStart(attacks.d_L, states.l_attack)
					}
					else if input_checkers.hold.left and image_xscale == -1{
						functionAttackStart(attacks.f_L, states.l_attack)
					}
					else if input_checkers.hold.right and image_xscale == 1{
						functionAttackStart(attacks.f_L, states.l_attack)
					}
					else{
						functionAttackStart(attacks.n_L, states.l_attack)
					}
				}
			}
			else{
				if input_checkers.tap.l{
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
			prot = protections.nothing;
			if bbox_collision_function(x, y + 1) and vely >= 0{
				if input_checkers.tap.m and !input_checkers.hold.up{
					if state != states.run{
						run_framedata = 0;
					}
					if input_checkers.hold.down{
						
						functionAttackStart(attacks.d_M, states.m_attack)
					}
					else{
						functionAttackStart(attacks.n_M, states.m_attack)
					}
				}
			}
			else{
				if input_checkers.tap.m{
						functionAttackStart(attacks.j_M, states.m_attack)
				}
			}
		}
	}

	function heavy_attack(){
		if cancel == true {
			prot = protections.nothing;
			if bbox_collision_function(x, y + 1) and vely >= 0{
				if input_checkers.tap.h and !input_checkers.hold.up{
					if state != states.run{
						run_framedata = 0;
					}
					if input_checkers.hold.down {
						functionAttackStart(attacks.d_H, states.h_attack)
					}
					else if input_checkers.hold.left and image_xscale == 1{
						functionAttackStart(attacks.b_H, states.h_attack)
					}
					else if input_checkers.hold.right and image_xscale == -1{
						functionAttackStart(attacks.b_H, states.h_attack)
					}
					else{
						functionAttackStart(attacks.n_H, states.h_attack)
					}
				}
			}
			else{
				if input_checkers.tap.h{
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
			prot = protections.nothing;
			if bbox_collision_function(x, y + 1, false) and vely >= 0{
				if input_checkers.tap.s1{
					functionAttackStart(attacks.n_S_one, states.special_atack);
				}
				else if input_checkers.tap.s2{
					functionAttackStart(attacks.n_S_two, states.special_atack);
				}
				else if input_checkers.tap.s3{
					functionAttackStart(attacks.n_S_three, states.special_atack);
				}
			}
			else{
				if input_checkers.tap.s1{
					functionAttackStart(attacks.a_S_one, states.special_atack);
				}
				else if input_checkers.tap.s2{
					functionAttackStart(attacks.a_S_two, states.special_atack);
				}
				else if input_checkers.tap.s3{
					functionAttackStart(attacks.a_S_three, states.special_atack);
				}
			}
		}
	}

	function grab_attack(){
		if input_checkers.tap.l and input_checkers.tap.m
			and !input_checkers.tap.h {
			if bbox_collision_function(x, y + 1) and vely >= 0{
				functionAttackStart(attacks.grab, states.m_attack);
			}
			else{
				functionAttackStart(attacks.a_grab, states.m_attack);
			}
		}
	}

	function parry_function(){
		if input_checkers.tap.m
			and input_checkers.tap.h 
			and !input_checkers.tap.l
			and bars.Humanity.actual > 0 {
						
			if bbox_collision_function(self.x, self.y+1, false) and vely >= 0 {
				if input_checkers.hold.down {
					sprite_index = extras.parry.animations.low;
					image_index = 0;
				}
				else{
					sprite_index = extras.parry.animations.high;
					image_index = 0;
				}
			}
			else{
				sprite_index = extras.parry.animations.air;
				image_index = 0;
			}
			state = states.parry;
			bars.Humanity.actual--;
		}
	}

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
			if (input_checkers.hold.up 
				and !input_check(inputs.k_up, wich_player, 3))
				or (input_checkers.hold.up 
				and input_checkers.hold.down){
				extras.float.time--;
				vely = 0;
				image_speed = 1;
				sprite_index = extras.float.animation;
			}
		}
	}
}

function dodge_function(){
	if input_checkers.double.right and image_xscale == -1{
		image_index = 0;
		cancel = false;
		sprite_index = dodge_properties.animation;
		state = states.dodge;
	}
	else if input_checkers.double.left and image_xscale == 1 {
		image_index = 0;
		cancel = false;
		sprite_index = dodge_properties.animation;
		state = states.dodge;
	}
}

function run_function(){
	if (extras.run.can == true){
		if input_checkers.double.right and image_xscale == 1{
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
		else if input_checkers.double.left and image_xscale == -1 {
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
	if (input_checkers.tap.l
		and input_checkers.tap.m
		and input_checkers.tap.h) or (
		input_checkers.release.l
		and input_checkers.release.m
		and input_checkers.release.h
		) {
		if (25 <= match_controller.get_bloodlust(wich_player)){
			input_checkers.tap.l = false;
			input_checkers.tap.m = false;
			input_checkers.tap.h = false;
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

#endregion

event_user(0);

