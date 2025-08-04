/// @description Insert description here
// You can write your code in this editor

stats  = StatFunctions_inv(10, 10);

active_prys = ds_map_create();

velx = 0;
vely = 0;

//pj creator and pj enemy
master = noone; enemy = noone;
//orders
follow = enemy; do_actions = true;

wich_player = 1

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
	enemy : enemy,
}

delay_kback = {
	angle: 0,
	strength: 0,
	other_dir: 0,
}

inputs = {
	k_right: "right_p1",
	k_left : "left_p1",
	k_up: "up_p1",
	k_down: "down_p1",
	k_jmp: "jmp_p1",
	k_atk: "atk_p1",
	k_spe: "spe_p1",
	k_blc: "blc_p1",
	k_grb: "grb_p1",
	k_pause: "pause_p1"
}

buffer = {
	time : 0,
	horizontal : hor_buffer.no,
	vertical : ver_buffer.no,
	key : k_buffer.no
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
		actual : 25, //porque xd
	},
}

state = states.idle; prot = protections.nothing;

current_attack = noone; //de allí cambia a un ataque, como neutral tilt

animations = {
	idle: FatherSummon_Idle,
	walk: FatherSummon_Walk,
	step: FatherSummon_Walk,
	crouch: FatherSummon_Tech,
	air: {
		rising: FatherSummon_Walk,
		falling: FatherSummon_Walk
	},
	landing: {
		light: FatherSummon_Tech,
		medium: FatherSummon_Tech,
		heavy: FatherSummon_Tech,
	},
	hitstun: FatherSummon_Hitstun,
	paralyze: FatherSummon_Thumble,
	thumble: FatherSummon_Thumble,
	kdown: {
		light: FatherSummon_LKdown,
		heavy: FatherSummon_HKdown,
	},
	bloc: {
		high: FatherSummon_Idle,
		low: FatherSummon_Idle,
		air: FatherSummon_Idle,
	},
	blocstun: {
		high: FatherSummon_Idle,
		low: FatherSummon_Idle,
		air: FatherSummon_Idle,
	},
	entrance : FatherSummon_Idle,
	death : FatherSummon_LKdown,
};

attacks = {
	
	n_tilt : {
		animation: FatherSummon_ntilt, //23 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 5,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 2, // -2 pnts
					dmg : (6*4/3), // - pnts
					hts : 11 + (6*4/3), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +12,
						posy : -12,
					},
					kback : {
						strength : (4*4)*4/3, // +3 pnts
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
	},
	
	f_tilt : {
		animation: FatherSummon_ftilt, //23 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 2, // -2 pnts
					dmg : (6*4/3), // - pnts
					hts : 2 + 10, // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +12,
						posy : -12,
					},
					kback : {
						strength : 8, // +3 pnts
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
			//hit 2 -> 13 pnts
			{
				create : 13,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (8*4/3), // - pnts
					hts : 11 + (8*4/3), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : (3*4)*4/3, // +3 pnts
						angle : 10, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0, water : false,
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
	},
	
	u_tilt : {
		animation: FatherSummon_utilt, //23 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 0.5,
					scale_y : 0.5,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (10*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : -36,
					},
					kback : {
						strength : (2*4)*2, // +1 pnts
						angle : 90, //counter-clock
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
	},
	
	d_tilt : {
		animation: FatherSummon_dtilt, //23 frames total
		lnd_strng: 3,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 9,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 0.5,
					scale_y : 0.5,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (8*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : +6,
					},
					kback : {
						strength : (4*4)*2, // +1 pnts
						angle : -90, //counter-clock
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
		helper: {
			frame: -1,
			object: noone
		},
		install: noone,
		prots : [
		],
		movements: [
			{
				start: 9,
				x_speed: 0,
				y_speed: -grav_1,
			}
		],
		follow_ups: [
		],
		effects : [
		],
		cost :{
			inspiration: 0,
			charge: false,
		}
	},
	
}

event_user(0);
