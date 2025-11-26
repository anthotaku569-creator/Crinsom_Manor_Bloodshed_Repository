
stats  = StatFunctions(1, 15, 15, 10);

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


pallete = {
	sprite: Perfection_color_palette,
	i : 0,
};

extras = {
	float : {
		can : true,
		time : 120,
		animation : Father_walk,		
	},
	air_dash : {
		can : true,
		able : true,
		animation : Perfection_adash,
		velx : 14,
	},
	run : {
		can : true,
		animation : Perfection_run,
		stop : Perfection_stop,
		velx : stats.ground.ground_speed + 14,
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
			high : Perfection_parry_high,
			low : Perfection_parry_low,
			air : Perfection_parry_air,
		},
	},
	special_defense : true,
}

animations = {
	enter: Crinsom_entrance,
	idle: Perfection_idle,
	walk: Perfection_f_walk,
	walkback: Perfection_b_walk,
	step: Perfection_f_walk,
	crouch: Perfection_crouch,
	air: {
		rising: Perfection_jmp_rising,
		falling: Perfection_jmp_falling
	},
	landing: {
		light: Perfection_landing_1,
		medium: Perfection_landing_2,
		heavy: Perfection_landing_3,
	},
	hitstun: Perfection_hitstun,
	paralyze: Perfection_paralizis,
	thumble: Perfection_thumble,
	kdown: {
		light: Perfection_light_kdown,
		heavy: Perfection_hard_kdown,
	},
	bloc: {
		high: Perfection_blc_high,
		low: Perfection_blc_low,
		air: Perfection_blc_air,
	},
	blocstun: {
		high: Perfection_blcstn_high,
		low: Perfection_blcstn_low,
		air: Perfection_blcstn_air,
	},
	redeye:{
		dash: Crinsom_curseeye_dash,
		redpause: Crinsom_curseeye
	},
	entrance : Crinsom_entrance,
	death : Perfection_hard_kdown,
	/*
	run : Father_walk,
	d_jmp : Father_walk,
	d_roll : Father_walk,*/
};

dodge_properties = {
	animation : Perfection_bdash,
	startup : 2,
	velx : 6.9,
	vely : 0,
	inv_length: 6,
}

active_prys = ds_map_create();

explosion_s1 = {
	hitspark: hitspark_fire,
	spr : Crinsom_s1_pry2,
	scale_x : 1,
	scale_y : 1,
	duration : 26,
	dmg : 30,
	kdwn: false,
	hts : 24,
	bls : 12 ,
	bloc : blc_types.pry,
	strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
	reflect : false,
	grb_script : function (_graber,_victim){},
	rel_pos : {
		posx : +48,
		posy : 0,
	},
	kback : {
		strength : 18, // +1 pnts
		angle : 70, //counter-clock
	},
	stt_effects : {
		burn : 5,
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
			bounce : false,
			collision : false,
			magnet : false,
			grnd_frict : 0,
		},
	},
};

S_three_followup = {
		animation: Crinsom_s2_2, //18 frames total
		lnd_strng: 3,
		hboxs: [
			//Pushback 1
			{
				create : 1,
				hbox: {
					hitspark: noone,
					spr : hitbox_spr,
					scale_x : 4,
					scale_y : 1,
					duration : 6, // -2 pnts
					dmg : 0, // -6 pnts
					kdwn: false,
					hts : 0, // -6 pnts
					bls : 0,
					bloc : blc_types.push,
					strg: 0, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +32,
						posy : -96,
					},
					kback : {
						strength : 10, // +3 pnts
						angle : -90, //counter-clock
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
			//hit 1
			{
				create : 6,
				hbox: {
					hitspark: hitspark_fire,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 2,
					duration : 58, // -2 pnts
					dmg : 45, // -6 pnts
					kdwn: false,
					hts : 80, // -6 pnts
					bls : 2,
					bloc : blc_types.mid,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +32,
						posy : +24,
					},
					kback : {
						strength : 12,//5, // +3 pnts
						angle : -90, //counter-clock
					},
					stt_effects : {
						burn : 5,
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
		prots : [],
		movements: [
			{
				start: 7,
				x_speed: 8,
				y_speed: 12,
			},
		],
		cost : 10,
		scrpt : function(_self){
			if _self.image_index < 7 {
				_self.velx = 0;
				_self.vely = 0;
			}
		}
}

attacks = {
	n_L:{
		animation: Perfection_5L,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 5,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 0.5,
					scale_y : 1,
					duration : 4,
					dmg : 15,
					kdwn: false,
					hts : 9+1,
					bls : 9+3,
					bloc : blc_types.low,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -0,
					},
					kback : {
						strength : 4,
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
		animation: Perfection_2L,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 5,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 0.75,
					scale_y : 0.5,
					duration : 4, // -2 pnts
					dmg : 15, // -6 pnts
					kdwn: false,
					hts : 11+0,
					bls : 11+1,
					bloc : blc_types.low,
					reflect : false,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +30,
						posy : 0,
					},
					kback : {
						strength : 4,
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
		animation: Perfection_6L,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 6,
				hbox: {
					hitspark: hitspark_slash,
					spr : hitbox_spr,
					scale_x : 0.5,
					scale_y : 64/48,
					duration : 4, // -2 pnts
					dmg : 25, // -6 pnts
					kdwn: false,
					hts : 13+10,
					bls : 13-5,
					bloc : blc_types.mid,
					reflect : false,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +12,
						posy : -36,
					},
					kback : {
						strength : 12,
						angle : 60, //counter-clock
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
				finish: 11,
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
		animation: Perfection_8L,
		lnd_strng: 1,
		hboxs: [
			//hit 1
			{
				create : 4,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 0.5,
					scale_y : 0.25,
					duration : 4,
					dmg : 15,
					kdwn: false,
					hts : 9,
					bls : 9-3,
					bloc : blc_types.ovh,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +36,
						posy : -36,
					},
					kback : {
						strength :  6,
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
		animation: Perfection_5M,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 6,
				hbox: {
					hitspark: hitspark_slash,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 2/3,
					duration : 4,
					dmg : 32,
					kdwn: false,
					hts : 13+3,
					bls : 13+3,
					bloc : blc_types.mid,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +44,
						posy : -44,
					},
					kback : {
						strength : 6,
						angle : -20, //counter-clock
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
			}
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
		scrpt : function(_self) {}
		
	},
	
	d_M:{
		animation: Perfection_2M,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 7,
				hbox: { 
					hitspark: hitspark_slash,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : 30, // -6 pnts
					kdwn: false,
					hts : 15+2,
					bls : 15+3,
					bloc : blc_types.low,
					reflect : false,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +56,
						posy : 0,
					},
					kback : {
						strength : 6,
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
		animation: Perfection_8M,
		lnd_strng: 2,
		hboxs: [//hit 1
			{
				create : 6,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 5/3,
					scale_y : 0.5,
					duration : 12, // -2 pnts
					dmg : 35, // -6 pnts
					kdwn: false,
					hts : 19+3,
					bls : 19-3,
					bloc : blc_types.ovh,
					reflect : false,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : 0,
						posy : -16,
					},
					kback : {
						strength : 6,
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
		animation: Perfection_5H,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 23,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1.5,
					duration : 4,
					dmg : 50,
					kdwn: false,
					hts : 26+12,
					bls : 26+12,
					bloc : blc_types.ovh,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : 22, // +1 pnts
						angle : -60, //counter-clock
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
				start: 10,
				type: protections.low_invul,
				finish: 27,
			}
		],
		movements: [
			{
				start: 19,
				x_speed: 10,
				y_speed: 0,
			}
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	d_H:{
		animation: Perfection_2H,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 11,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 4, // -2 pnts
					dmg : 45, // -6 pnts
					kdwn: true,
					hts : 19+12,
					bls : 19-8,
					bloc : blc_types.low,
					reflect : false,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +44,
						posy : 0,
					},
					kback : {
						strength : 12,
						angle : 30, //counter-clock
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
				start: 11,
				x_speed: 4,
				y_speed: 0,
			}
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	b_H:{
		animation: Perfection_4H,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 15,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 1,
					duration : 6,
					dmg : 45,
					kdwn: true,
					hts : 27+24,
					bls : 27-20,
					bloc : blc_types.mid,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : 0,
						posy : -48,
					},
					kback : {
						strength : 20, // +1 pnts
						angle : 60, //counter-clock
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
				start: 15,
				x_speed: 4,
				y_speed: 0,
			}
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	j_H:{
		animation: Perfection_8H,
		lnd_strng: 3,
		hboxs: [//hit 1
			{
				create : 6,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 1,
					duration : 6,
					dmg : 60, // -6 pnts
					kdwn: true,
					hts : 20+22,
					bls : 20-18,
					bloc : blc_types.ovh,
					reflect : false,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : -45,
					},
					kback : {
						strength : 20, // +1 pnts
						angle : 60, //counter-clock
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
		animation: Crinsom_ngrab,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 3,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 0.5,
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
							case Crinsom_ngrab:
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
									_graber.image_xscale = 1;
								}
								else if input_check(_graber.inputs.k_left, _graber.wich_player) and _graber.image_xscale == 1{
									_graber.image_xscale = -1;
								}
								
								_graber.sprite_index = Crinsom_nthrow;
								
								break;
							case Crinsom_nthrow:
								var dmg = _victim.calc_damage(40);
								var hts = 60 - _victim.stats.weight.hit_red;
								var kbck = 18;
								var angle = 45;
								var kdwn = true;
								if (_graber.image_index >= 0 and _graber.image_index <= 12){
									//move
									_victim.depth = 1;
									_victim.sprite_index = _victim.animations.hitstun
									_victim.x = _graber.x + 32 * _graber.image_xscale
									_victim.y = _graber.y - 24;
								}
								if (_graber.image_index >= 13){
									particle_function(hitspark_fire,
										_graber.x + (32 * _graber.image_xscale),
										_graber.y - 48,
										0, 0,
										)
									//current_attack = attacks.empty
									match_controller.hit_pause(2)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.x = _graber.x + 32 * _graber.image_xscale
									_victim.y = _graber.y - 24;
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
									_graber.attacks.empty.animation = Crinsom_nthrow;
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
		animation: Crinsom_agrab,
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
							case Crinsom_agrab:
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
									_graber.image_xscale = 1;
								}
								else if input_check(_graber.inputs.k_left, _graber.wich_player) and _graber.image_xscale == 1{
									_graber.image_xscale = -1;
								}
								
								_graber.sprite_index = Crinsom_athrow;
								
								break;
							case Crinsom_athrow:
								var dmg = 40*_victim.scaling.dmg;
								var hts = 45 - _victim.stats.weight.hit_red;
								var kbck = 18; var angle = -45;
								var kdwn = true;
								if (_graber.image_index >= 0 and _graber.image_index <= 10){
									//move
									_victim.sprite_index = _victim.animations.crouch
									_victim.x = _graber.x - 48 * _graber.image_xscale;
									_victim.y = _graber.y - 48;
									_graber.velx = 0;
									_graber.vely = 0;									
								}
								if (_graber.image_index == 11){
									_graber.velx = -8 * _graber.image_xscale;
									_graber.vely = -8;	
									//current_attack = attacks.empty
									match_controller.hit_pause(2)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.x = _graber.x + 48 * _graber.image_xscale
									_victim.y = _graber.y + 48
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
									_graber.attacks.empty.animation = Crinsom_athrow;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.m_attack;
								}
								break;
							default:
								
								_graber.sprite_index = Crinsom_athrow;
								_graber.y -= 48;
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
		animation: Crinsom_s1,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 7,
				hbox: {
					hitspark: hitspark_fire,
					spr : Crinsom_s1_pry1,
					scale_x : 1,
					scale_y : 1,
					duration : 120,
					dmg : 0,
					kdwn: false,
					hts : 0,
					bls : 0 ,
					bloc : blc_types.pry,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : 0,
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
						velx : 4,
						vely : 0,
						bmrng : false,
						activation : {
							delay: 2,
							contact: true,
							summon: explosion_s1
						},
						physics : {
							grav : 0,
							air_frict : 0,
							bounce : false,
							collision : false,
							magnet : true,
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
		cost : 10,
		scrpt : function(_self){}
		
	},
	
	n_S_two:{
		animation: Crinsom_s2_1, //18 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 13,
				hbox: {
					hitspark: hitspark_fire,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : 45, // -6 pnts
					kdwn: true,
					hts : 82, // -6 pnts
					bls : 20,
					bloc : blc_types.mid,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : true,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +72,
						posy : -24,
					},
					kback : {
						strength : 20, // +3 pnts
						angle : 20, //counter-clock
					},
					stt_effects : {
						burn : 4,
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
				start: 4,
				type: protections.proy_invul,
				finish: 16,
			}
		],
		movements: [
			{
				start: 6,
				x_speed: 20,
				y_speed: 0,
			},
			{
				start: 7,
				x_speed: 20,
				y_speed: 0,
			},
			{
				start: 8,
				x_speed: 20,
				y_speed: 0,
			},
			{
				start: 9,
				x_speed: 20,
				y_speed: 0,
			},
			{
				start: 10,
				x_speed: 20,
				y_speed: 0,
			},
			{
				start: 11,
				x_speed: 20,
				y_speed: 0,
			},
		],
		cost : 10,
		scrpt : function(_self){
			if _self.image_index > 7
				and _self.image_index < 12 {					
					if !input_check(_self.inputs.k_S2, _self.wich_player){
						_self.image_index = 12
					}
					else if _self.image_index == 11 {
						_self.image_index = 8
					}
			}
		}
	},
	
	n_S_three:{
		animation: Crinsom_s3, //18 frames total
		lnd_strng: 4,
		hboxs: [
			//hit 1
			{
				create : 9,
				hbox: {
					hitspark: hitspark_fire,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : 30, // -6 pnts
					kdwn: true,
					hts : 80, // -6 pnts
					bls : 10,
					bloc : blc_types.mid,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +40,
						posy : -32,
					},
					kback : {
						strength : 20, // +1 pnts
						angle : 60, //counter-clock
					},
					stt_effects : {
						burn : 2,
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
							bounce : false,
							collision : false,
							magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
			//hit 2
			{
				create : 13,
				hbox: {
					hitspark: hitspark_fire,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 2,
					duration : 4, // -2 pnts
					dmg : 15, // -6 pnts
					kdwn: true,
					hts : 80, // -6 pnts
					bls : 10,
					bloc : blc_types.mid,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +40,
						posy : 0,
					},
					kback : {
						strength : 20, // +1 pnts
						angle : 60, //counter-clock
					},
					stt_effects : {
						burn : 2,
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
							bounce : false,
							collision : false,
							magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
			//hit 3
			{
				create : 17,
				hbox: {
					hitspark: hitspark_fire,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 2,
					duration : 4, // -2 pnts
					dmg : 15, // -6 pnts
					kdwn: true,
					hts : 80, // -6 pnts
					bls : 10,
					bloc : blc_types.mid,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +40,
						posy : -16,
					},
					kback : {
						strength : 20, // +1 pnts
						angle : 30, //counter-clock
					},
					stt_effects : {
						burn : 2,
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
		prots : [
			{
				start: 0,
				type: protections.full,
				finish: 12,
			}
		],
		movements: [
			{
				start: 9,
				x_speed: 6.9,
				y_speed: -15.2,
			}
		],
		cost : 10,
		scrpt : function(_self){
			if _self.image_index > 13
				and _self.image_index < 16
				and _self.cancel == true
				and !_self.bbox_collision_function(_self.x, _self.y +1, false) {
					if input_check_pressed(_self.inputs.k_S2, _self.wich_player, 5){
						_self.velx = 0;
						_self.vely = 0;
						_self.functionAttackStart(_self.S_three_followup, states.special_atack);
					}
			}
		}
	},
	
	a_S_one:{
		animation: Crinsom_s1,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 7,
				hbox: {
					hitspark: hitspark_fire,
					spr : Crinsom_s1_pry1,
					scale_x : 1,
					scale_y : 1,
					duration : 120,
					dmg : 0,
					kdwn: false,
					hts : 0,
					bls : 0 ,
					bloc : blc_types.pry,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : 0,
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
						velx : 4,
						vely : 0,
						bmrng : false,
						activation : {
							delay: 2,
							contact: true,
							summon: explosion_s1
						},
						physics : {
							grav : 0,
							air_frict : 0,
							bounce : false,
							collision : false,
							magnet : true,
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
		cost : 10,
		scrpt : function(_self){}
		
	},
	
	a_S_two:{
		animation: Crinsom_s2_2, //18 frames total
		lnd_strng: 3,
		hboxs: [
			//hit 1
			{
				create : 6,
				hbox: {
					hitspark: hitspark_fire,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 2,
					duration : 58, // -2 pnts
					dmg : 45, // -6 pnts
					kdwn: false,
					hts : 80, // -6 pnts
					bls : 14,
					bloc : blc_types.ovh,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +32,
						posy : +24,
					},
					kback : {
						strength : 20,//5, // +3 pnts
						angle : 20, //counter-clock
					},
					stt_effects : {
						burn : 5,
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
		prots : [],
		movements: [
			{
				start: 7,
				x_speed: 8,
				y_speed: 12,
			},
		],
		cost : 10,
		scrpt : function(_self){
			if _self.image_index < 7 {
				_self.velx = 0;
				_self.vely = 0;
			}
		}
	},
	
	a_S_three:{
		animation: Crinsom_s3, //18 frames total
		lnd_strng: 4,
		hboxs: [
			//hit 1
			{
				create : 9,
				hbox: {
					hitspark: hitspark_fire,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : 30, // -6 pnts
					kdwn: true,
					hts : 80, // -6 pnts
					bls : 10,
					bloc : blc_types.mid,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +40,
						posy : -32,
					},
					kback : {
						strength : 20, // +1 pnts
						angle : 60, //counter-clock
					},
					stt_effects : {
						burn : 2,
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
							bounce : false,
							collision : false,
							magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
			//hit 2
			{
				create : 13,
				hbox: {
					hitspark: hitspark_fire,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 2,
					duration : 4, // -2 pnts
					dmg : 15, // -6 pnts
					kdwn: true,
					hts : 80, // -6 pnts
					bls : 10,
					bloc : blc_types.mid,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +40,
						posy : 0,
					},
					kback : {
						strength : 20, // +1 pnts
						angle : 60, //counter-clock
					},
					stt_effects : {
						burn : 2,
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
							bounce : false,
							collision : false,
							magnet : false,
							grnd_frict : 0,
						},
					},
				},
			},
			//hit 3
			{
				create : 17,
				hbox: {
					hitspark: hitspark_fire,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 2,
					duration : 4, // -2 pnts
					dmg : 15, // -6 pnts
					kdwn: true,
					hts : 80, // -6 pnts
					bls : 10,
					bloc : blc_types.mid,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +40,
						posy : -16,
					},
					kback : {
						strength : 20, // +1 pnts
						angle : 30, //counter-clock
					},
					stt_effects : {
						burn : 2,
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
		prots : [
			{
				start: 0,
				type: protections.full,
				finish: 12,
			}
		],
		movements: [
			{
				start: 9,
				x_speed: 6.9,
				y_speed: -15.2,
			}
		],
		cost : 10,
		scrpt : function(_self){
			if _self.image_index > 13
				and _self.image_index < 16
				and _self.cancel == true
				and !_self.bbox_collision_function(_self.x, _self.y +1, false){
					if input_check_pressed(_self.inputs.k_S2, _self.wich_player, 5){
						_self.velx = 0;
						_self.vely = 0;
						_self.functionAttackStart(_self.S_three_followup, states.special_atack);
					}
			}
		}
	},
	
}


