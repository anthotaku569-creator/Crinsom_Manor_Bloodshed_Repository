
stats  = StatFunctions(6, 12, 8, 14);

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
	sprite: Painkiller_color_palette,
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
		animation : Painkiller_adash,
		velx : 10,
	},
	run : {
		can : true,
		animation : Painkiller_run,
		stop : Painkiller_stop,
		velx : stats.ground.ground_speed + 8,
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
			high : Painkiller_parry_high,
			low : Painkiller_parry_low,
			air : Painkiller_parry_air,
		},
	},
	special_defense : true,
}

animations = {
	enter: Painkiller_entrance,
	idle: Painkiller_idle,
	walk: Painkiller_f_walk,
	walkback: Painkiller_b_walk,
	step: Painkiller_f_walk,
	crouch: Painkiller_crouch,
	air: {
		rising: Painkiller_jmp_rising,
		falling: Painkiller_jmp_falling
	},
	landing: {
		light: Painkiller_landing_1,
		medium: Painkiller_landing_2,
		heavy: Painkiller_landing_3,
	},
	hitstun: Painkiller_hitstun,
	paralyze: Painkiller_paralizis,
	thumble: Painkiller_thumble,
	kdown: {
		light: Painkiller_light_kdown,
		heavy: Painkiller_hard_kdown,
	},
	bloc: {
		high: Painkiller_blc_high,
		low: Painkiller_blc_low,
		air: Painkiller_blc_air,
	},
	blocstun: {
		high: Painkiller_blcstn_high,
		low: Painkiller_blcstn_low,
		air: Painkiller_blcstn_air,
	},
	redeye:{
		dash: Painkiller_curseeye_dash,
		redpause: Painkiller_curse_eye
	},
	entrance : Crinsom_entrance,
	death : Painkiller_hard_kdown,
	/*
	run : Father_walk,
	d_jmp : Father_walk,
	d_roll : Father_walk,*/
};

dodge_properties = {
	animation : Painkiller_bdash,
	startup : 5,
	velx : 32,
	vely : 0,
	inv_length: 8,
}

active_prys = ds_map_create();

hitextra_3_s2 = {
	hitspark: hitspark_slash,
	spr : Painkiller_s2_pry2,
	scale_x : 1,
	scale_y : 1,
	duration : 10,
	dmg : 15,
	kdwn: false,
	hts : 30,
	bls : 12 ,
	bloc : blc_types.pry,
	strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
	reflect : false,
	grb_script : function (_graber,_victim){},
	rel_pos : {
		posx : 0,
		posy : +0,
	},
	kback : {
		strength : 8, // +1 pnts
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
			delay: 10,
			contact: true,
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

hitextra_2_s2 = {
	hitspark: hitspark_slash,
	spr : Painkiller_s2_pry2,
	scale_x : 1,
	scale_y : 1,
	duration : 10,
	dmg : 15,
	kdwn: false,
	hts : 30,
	bls : 8 ,
	bloc : blc_types.pry,
	strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
	reflect : false,
	grb_script : function (_graber,_victim){},
	rel_pos : {
		posx : 0,
		posy : +0,
	},
	kback : {
		strength : 8, // +1 pnts
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
			delay: 10,
			contact: true,
			summon: hitextra_3_s2
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

hitextra_1_s2 = {
	hitspark: hitspark_slash,
	spr : Painkiller_s2_pry2,
	scale_x : 1,
	scale_y : 1,
	duration : 10,
	dmg : 15,
	kdwn: false,
	hts : 30,
	bls : 8 ,
	bloc : blc_types.pry,
	strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
	reflect : false,
	grb_script : function (_graber,_victim){},
	rel_pos : {
		posx : 0,
		posy : +16,
	},
	kback : {
		strength : 8, // +1 pnts
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
			delay: 10,
			contact: false,
			summon: hitextra_2_s2
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

explosion_s1 = {
	hitspark: hitspark_normal,
	spr : Painkiller_s1_pry3,
	scale_x : 1,
	scale_y : 1,
	duration : 15,
	dmg : 30,
	kdwn: false,
	hts : 30,
	bls : 24 ,
	bloc : blc_types.pry,
	strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
	reflect : false,
	grb_script : function (_graber,_victim){},
	rel_pos : {
		posx : 0,
		posy : +24,
	},
	kback : {
		strength : 18, // +1 pnts
		angle : 70, //counter-clock
	},
	stt_effects : {
		burn : 0,
		paralysis : 0,
		cold : 0,
		poison : 0,
		curse : 4,
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

jump_s1 = {
	hitspark: hitspark_normal,
	spr : Painkiller_s1_pry2,
	scale_x : 1,
	scale_y : 1,
	duration : 34,
	dmg : 0,
	kdwn: false,
	hts : 0,
	bls : 0 ,
	bloc : blc_types.pry,
	strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
	reflect : false,
	grb_script : function (_graber,_victim){},
	rel_pos : {
		posx : +0,
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
		vely : -8,
		bmrng : false,
		activation : {
			delay: 1,
			contact: true,
			summon: explosion_s1
		},
		physics : {
			grav : 0.5,
			air_frict : 0,
			bounce : false,
			collision : false,
			magnet : false,
			grnd_frict : 0,
		},
	},
};

attacks = {
	n_L:{
		animation: Painkiller_5L,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 5,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 4,
					dmg : 15,
					kdwn: false,
					hts : 11+0,
					bls : 11+2,
					bloc : blc_types.mid,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -48,
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
		animation: Painkiller_2L,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 6,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 4, // -2 pnts
					dmg : 15, // -6 pnts
					kdwn: false,
					hts : 13+0,
					bls : 13+1,
					bloc : blc_types.low,
					reflect : false,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
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
		animation: Painkiller_6L,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 8,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 4,
					dmg : 15,
					kdwn: false,
					hts : 18+12,
					bls : 18-10,
					bloc : blc_types.mid,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +32,
						posy : -48,
					},
					kback : {
						strength : 14,
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
		animation: Painkiller_8L,
		lnd_strng: 1,
		hboxs: [
			//hit 1
			{
				create : 5,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 12,
					dmg : 15,
					kdwn: false,
					hts : 17,
					bls : 17-3,
					bloc : blc_types.ovh,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : -24,
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
		animation: Painkiller_5M,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 7,
				hbox: {
					hitspark: hitspark_slash,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 0.5,
					duration : 4,
					dmg : 30,
					kdwn: false,
					hts : 15+3,
					bls : 15+3,
					bloc : blc_types.mid,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +32,
						posy : -48,
					},
					kback : {
						strength : 6,
						angle : -20, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 2,
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
		scrpt : function(_self){}
		
	},
	
	d_M:{
		animation: Painkiller_2M,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 8,
				hbox: {
					hitspark: hitspark_slash,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 4, // -2 pnts
					dmg : 30, // -6 pnts
					kdwn: true,
					hts : 17+12,
					bls : 17-8,
					bloc : blc_types.low,
					reflect : false,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +48,
						posy : 0,
					},
					kback : {
						strength : 6,
						angle : 30, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 2,
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
		animation: Painkiller_8M,
		lnd_strng: 2,
		hboxs: [//hit 1
			//hit 1
			{
				create : 7,
				hbox: {
					hitspark: hitspark_slash,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : 25, // -6 pnts
					kdwn: false,
					hts : 31,
					bls : 10,
					bloc : blc_types.ovh,
					reflect : false,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +48,
						posy : -48,
					},
					kback : {
						strength : 8,
						angle : 10, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 1,
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
		//hit 2
			{
				create : 11,
				hbox: {
					hitspark: hitspark_slash,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : 25, // -6 pnts
					kdwn: false,
					hts : 15+3,
					bls : 15-3,
					bloc : blc_types.ovh,
					reflect : false,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +72,
						posy : -48,
					},
					kback : {
						strength : 8,
						angle : 10, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 1,
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
				}
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
		scrpt : function(_self){}
		
	},
	
	n_H:{
		animation: Painkiller_5H,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 9,
				hbox: {
					hitspark: hitspark_slash,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 4,
					dmg : 45,
					kdwn: false,
					hts : 18+4,
					bls : 18-0,
					bloc : blc_types.mid,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +60,
						posy : -16,
					},
					kback : {
						strength : 12, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 2,
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
		animation: Painkiller_2H,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 8,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 6, // -2 pnts
					dmg : 45, // -6 pnts
					kdwn: true,
					hts : 17+12,
					bls : 17-8,
					bloc : blc_types.low,
					reflect : false,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : 0,
					},
					kback : {
						strength : 10,
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
			{
				start: 3,
				type: protections.mid_invul,
				finish: 16,
			}
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
		animation: Painkiller_4H,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 20,
				hbox: {
					hitspark: hitspark_slash,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 2,
					duration : 4,
					dmg : 45,
					kdwn: true,
					hts : 27+24,
					bls : 27-20,
					bloc : blc_types.ovh,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +48,
						posy : -16,
					},
					kback : {
						strength : 12, // +1 pnts
						angle : -60, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 2,
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
		animation: Painkiller_8H,
		lnd_strng: 3,
		hboxs: [//hit 1
			{
				create : 8,
				hbox: {
					hitspark: hitspark_slash,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : 70, // -6 pnts
					kdwn: true,
					hts : 21+20,
					bls : 21-18,
					bloc : blc_types.ovh,
					reflect : false,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : +0,
					},
					kback : {
						strength : 25, // +1 pnts
						angle : -60, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 2,
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
		animation: Painkiller_ngrab,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 4,
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
							case Painkiller_ngrab:
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
								
								_graber.sprite_index = Painkiller_nthrow;
								
								break;
							case Painkiller_nthrow:
								var dmg = _victim.calc_damage(20);
								var hts = 60 - _victim.stats.weight.hit_red;
								var kbck = 2;
								var angle = 90;
								var kdwn = true;
								if (_graber.image_index >= 0 and _graber.image_index <= 10){
									//move
									_victim.depth = 1;
									_victim.sprite_index = _victim.animations.hitstun
									_victim.x = _graber.x + 32 * _graber.image_xscale
									_victim.y = _graber.y;
								}
								if (_graber.image_index >= 11){
									particle_function(hitspark_normal,
										_graber.x + (32 * _graber.image_xscale),
										_graber.y - 4,
										0, 0,
										)
									//current_attack = attacks.empty
									match_controller.hit_pause(2)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.x = _graber.x + 32 * _graber.image_xscale
									_victim.y = _graber.y;
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.8
									_victim.scaling.kbck = _victim.scaling.kbck*1.2
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									_victim.bars.HitstunBar.kdwn = 2;
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = Painkiller_nthrow;
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
		animation: Painkiller_agrab,
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
							case Painkiller_agrab:
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
								
								_graber.vely = 1;
								_graber.sprite_index = Painkiller_athrow_1;
								
								break;
							case Painkiller_athrow_1:
									_victim.sprite_index = _victim.animations.kdown.heavy
									_victim.x = _graber.x;
									_victim.y = _graber.y - 24;
									
									if _graber.vely == 0 {
										_graber.sprite_index = Painkiller_athrow_2;
									}
									
								break;
							case Painkiller_athrow_2:
								var dmg = 40*_victim.scaling.dmg;
								var hts = 45 - _victim.stats.weight.hit_red;
								var kbck = 0; var angle = -90;
								var kdwn = true;
								if (_graber.image_index == 2){
									//current_attack = attacks.empty
									match_controller.hit_pause(2)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.x = _graber.x + 48 * _graber.image_xscale
									_victim.y = _graber.y - 8
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.8
									_victim.scaling.kbck = _victim.scaling.kbck*1.2
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									_victim.bars.HitstunBar.kdwn = 2;
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = Painkiller_athrow_2;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.m_attack;
								}
								break;
							default:
								_graber.sprite_index = Painkiller_athrow_2;
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
	
	n_S_one: {
		animation: Painkiller_s1,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 26,
				hbox: {
					hitspark: hitspark_purplefire,
					spr : Painkiller_s1_pry1,
					scale_x : 1,
					scale_y : 1,
					duration : 30,
					dmg : 0,
					kdwn: false,
					hts : 0,
					bls : 0 ,
					bloc : blc_types.pry,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +42,
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
						velx : 0,
						vely : 0,
						bmrng : false,
						activation : {
							delay: 2,
							contact: false,
							summon: jump_s1
						},
						physics : {
							grav : 0.5,
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
	
	n_S_two: {
		animation: Painkiller_s2,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 15,
				hbox: {
					hitspark: hitspark_normal,
					spr : Painkiller_s2_pry1,
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
						posx : +48,
						posy : -64,
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
						vely : -6,
						bmrng : false,
						activation : {
							delay: 0,
							contact: true,
							summon: hitextra_1_s2
						},
						physics : {
							grav : 0.2,
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
	
	n_S_three: {
		animation: Painkiller_s3,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 6,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
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
							case Painkiller_s3:
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
								
								_graber.sprite_index = Painkiller_s3_1;
								
								break;
							case Painkiller_s3_1:
								var dmg = _victim.calc_damage(15);
								var hts = 120 - _victim.stats.weight.hit_red;
								var kbck = 12;
								var angle = 30;
								var kdwn = true;
								if (_graber.image_index >= 0 and _graber.image_index <= 10){
									//move
									_victim.depth = 1;
									_victim.sprite_index = _victim.animations.hitstun
									_victim.x = _graber.x + 48 * _graber.image_xscale
									_victim.y = _graber.y - 16;
									
									if (_graber.image_index == 6) or
									(_graber.image_index == 8)
									{
										_victim.bars.HealthBar.actual -= dmg;
										_victim.scaling.cum_dmg += dmg;
										_victim.scaling.combo ++;
										match_controller.hit_pause(3);
										particle_function(hitspark_slash,
										_graber.x + (48 * _graber.image_xscale),
										_graber.y - 48,
										0, 0,
										);
									}
								}
								if (_graber.image_index >= 11){
									particle_function(hitspark_slash,
										_graber.x + (48 * _graber.image_xscale),
										_graber.y - 48,
										0, 0,
										)
									//current_attack = attacks.empty
									match_controller.hit_pause(2)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.scaling.cum_dmg += dmg;
									_victim.x = _graber.x + 48 * _graber.image_xscale
									_victim.y = _graber.y - 16;
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.8
									_victim.scaling.kbck = _victim.scaling.kbck*1.2
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									_victim.bars.HitstunBar.kdwn = 2;
									_victim.stt_effects.poison = 4;
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = Painkiller_s3_1;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.special_atack;
								}
								
								break;
							default:
								break;
						}
					},
					rel_pos : {
						posx : +32,
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
		cost : 15,
		scrpt : function(_self){
			if _self.image_index < 11 {
				_self.vely = 0;
			}
		}
	},
	
	a_S_one:{
		animation: Painkiller_s1,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 26,
				hbox: {
					hitspark: hitspark_purplefire,
					spr : Painkiller_s1_pry1,
					scale_x : 1,
					scale_y : 1,
					duration : 30,
					dmg : 0,
					kdwn: false,
					hts : 0,
					bls : 0 ,
					bloc : blc_types.pry,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +42,
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
						velx : 0,
						vely : 0,
						bmrng : false,
						activation : {
							delay: 2,
							contact: false,
							summon: jump_s1
						},
						physics : {
							grav : 0.5,
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
	
	a_S_two: {
		animation: Painkiller_s2,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 15,
				hbox: {
					hitspark: hitspark_normal,
					spr : Painkiller_s2_pry1,
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
						posx : +48,
						posy : -64,
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
						vely : -6,
						bmrng : false,
						activation : {
							delay: 0,
							contact: true,
							summon: hitextra_1_s2
						},
						physics : {
							grav : 0.2,
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
	
	a_S_three: {
		animation: Painkiller_s3,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 6,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
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
							case Painkiller_s3:
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
								
								_graber.sprite_index = Painkiller_s3_1;
								
								break;
							case Painkiller_s3_1:
								var dmg = _victim.calc_damage(15);
								var hts = 120 - _victim.stats.weight.hit_red;
								var kbck = 12;
								var angle = 30;
								var kdwn = true;
								if (_graber.image_index >= 0 and _graber.image_index <= 10){
									//move
									_victim.depth = 1;
									_victim.sprite_index = _victim.animations.hitstun
									_victim.x = _graber.x + 48 * _graber.image_xscale
									_victim.y = _graber.y - 16;
									
									if (_graber.image_index == 6) or
									(_graber.image_index == 8)
									{
										_victim.bars.HealthBar.actual -= dmg;
										_victim.scaling.cum_dmg += dmg;
										_victim.scaling.combo ++;
										match_controller.hit_pause(3);
										particle_function(hitspark_slash,
										_graber.x + (48 * _graber.image_xscale),
										_graber.y - 48,
										0, 0,
										);
									}
								}
								if (_graber.image_index >= 11){
									particle_function(hitspark_slash,
										_graber.x + (48 * _graber.image_xscale),
										_graber.y - 48,
										0, 0,
										)
									//current_attack = attacks.empty
									match_controller.hit_pause(2)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.scaling.cum_dmg += dmg;
									_victim.x = _graber.x + 48 * _graber.image_xscale
									_victim.y = _graber.y - 16;
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.8
									_victim.scaling.kbck = _victim.scaling.kbck*1.2
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									_victim.bars.HitstunBar.kdwn = 2;
									_victim.stt_effects.poison = 4;
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = Painkiller_s3_1;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.special_atack;
								}
								
								break;
							default:
								break;
						}
					},
					rel_pos : {
						posx : +32,
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
		cost : 15,
		scrpt : function(_self){
			if _self.image_index < 11 {
				_self.vely = 0;
			}
		}
	},
}


