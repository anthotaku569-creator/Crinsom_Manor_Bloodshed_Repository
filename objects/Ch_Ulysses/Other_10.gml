
stats  = StatFunctions(8, 8, 12, 6);
pallete = {
	sprite: ulysses_color_palette,
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
		animation : ulysses_adash,
		velx : 10,
	},
	run : {
		can : true,
		animation : ulysses_run,
		stop : ulysses_stop,
		velx : stats.ground.ground_speed + 4,
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
			high : ulysses_parry_high,
			low : ulysses_parry_low,
			air : ulysses_parry_air,
		},
	},
	special_defense : true,
}

animations = {
	enter: ulysses_entrance,
	idle: ulysses_idle,
	walk: ulysses_f_walk,
	walkback: ulysses_b_walk,
	step: ulysses_f_walk,
	crouch: ulysses_crouch,
	air: {
		rising: ulysses_jmp_rising,
		falling: ulysses_jmp_falling
	},
	landing: {
		light: ulysses_landing_1,
		medium: ulysses_landing_2,
		heavy: ulysses_landing_3,
	},
	hitstun: ulysses_hitstun,
	paralyze: ulysses_paralizis,
	thumble: ulysses_thumble,
	kdown: {
		light: ulysses_light_kdown,
		heavy: ulysses_hard_kdown,
	},
	bloc: {
		high: ulysses_blc_high,
		low: ulysses_blc_low,
		air: ulysses_blc_air,
	},
	blocstun: {
		high: ulysses_blcstn_high,
		low: ulysses_blcstn_low,
		air: ulysses_blcstn_air,
	},
	redeye:{
		dash: ulysses_curseeye_dash,
		redpause: ulysses_curse_eye
	},
	entrance : Crinsom_entrance,
	death : ulysses_hard_kdown,
	/*
	run : Father_walk,
	d_jmp : Father_walk,
	d_roll : Father_walk,*/
};

dodge_properties = {
	animation : ulysses_bdash,
	startup : 3,
	velx : 27.7,
	vely : 0,
	inv_length: 8,
}

active_prys = ds_map_create();

attacks = {
	n_L:{
		animation: ulysses_5L,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 7,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 4,
					dmg : 15,
					kdwn: false,
					hts : 10,
					bls : 12,
					bloc : blc_types.mid,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +48,
						posy : +0,
					},
					kback : {
						strength : 8,
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
		animation: ulysses_2L,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 7,
				hbox: {
					hitspark: hitspark_water,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : 15, // -6 pnts
					kdwn: false,
					hts : 12,
					bls : 8,
					bloc : blc_types.low,
					reflect : false,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +64,
						posy : 0,
					},
					kback : {
						strength : 8,
						angle : 0, //counter-clock
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
		animation: ulysses_6L,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 11,
				hbox: {
					hitspark: hitspark_fire,
					spr : ulysses_6L_pry,
					scale_x : 1,
					scale_y : 1,
					duration : 8, // -2 pnts
					dmg : 20, // -6 pnts
					kdwn: false,
					hts : 20,
					bls : 4,
					bloc : blc_types.pry,
					reflect : false,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +48,
						posy : -0,
					},
					kback : {
						strength : 20,
						angle : 45, //counter-clock
					},
					stt_effects : {
						burn : 1,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
						velx : 0,
						vely : -8,
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
				finish: 18,
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
		animation: ulysses_8L,
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
					duration : 4,
					dmg : 15,
					kdwn: false,
					hts : 10,
					bls : 4,
					bloc : blc_types.ovh,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +48,
						posy : -24,
					},
					kback : {
						strength :  8,
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
		animation: ulysses_5M,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 9,
				hbox: {
					hitspark: hitspark_cold,
					spr : hitbox_spr,
					scale_x : 2.5,
					scale_y : 1.5,
					duration : 4,
					dmg : 30,
					kdwn: false,
					hts : 20,
					bls : 16,
					bloc : blc_types.mid,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +84,
						posy : -24,
					},
					kback : {
						strength : 10,
						angle : 180, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 1,
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
		scrpt : function(_self){}
		
	},
	
	d_M:{
		animation: ulysses_2M,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 11,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2.5,
					scale_y : 0.5,
					duration : 4, // -2 pnts
					dmg : 30, // -6 pnts
					kdwn: false,
					hts : 20,
					bls : 12,
					bloc : blc_types.low,
					reflect : false,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +84,
						posy : 0,
					},
					kback : {
						strength : 10,
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
		animation: ulysses_8M,
		lnd_strng: 2,
		hboxs: [
		//hit 1
			{
				create : 7,
				hbox: {
					hitspark: hitspark_slash,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : 10, // -6 pnts
					kdwn: false,
					hts : 12,
					bls : 10,
					bloc : blc_types.ovh,
					reflect : false,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -48,
					},
					kback : {
						strength : 8,
						angle : -10, //counter-clock
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
					scale_x : 1,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : 10, // -6 pnts
					kdwn: false,
					hts : 12,
					bls : 10,
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
						angle : -10, //counter-clock
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
				create : 15,
				hbox: {
					hitspark: hitspark_slash,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : 10, // -6 pnts
					kdwn: false,
					hts : 18,
					bls : 10,
					bloc : blc_types.ovh,
					reflect : false,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +120,
						posy : -48,
					},
					kback : {
						strength : 8,
						angle : -10, //counter-clock
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
		animation: ulysses_5H,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 14,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 3,
					duration : 4,
					dmg : 40,
					kdwn: false,
					hts : 60,
					bls : 10,
					bloc : blc_types.mid,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +72,
						posy : -0,
					},
					kback : {
						strength : 24, // +1 pnts
						angle : 20, //counter-clock
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
		animation: ulysses_2H,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 15,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 3,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : 30, // -6 pnts
					kdwn: true,
					hts : 35,
					bls : 18,
					bloc : blc_types.low,
					reflect : false,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +96,
						posy : 0,
					},
					kback : {
						strength : 0,
						angle : 25, //counter-clock
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
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	b_H:{
		animation: ulysses_4H,
		lnd_strng: 4,
		hboxs: [
			//hit 1
			{
				create : 9,
				hbox: {
					hitspark: hitspark_fire,
					spr : ulysses_4H_pry,
					scale_x : 1,
					scale_y : 1,
					duration : 16,
					dmg : 30,
					kdwn: true,
					hts : 60,
					bls : 10,
					bloc : blc_types.pry,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +32,
						posy : -64,
					},
					kback : {
						strength : 20, // +1 pnts
						angle : 90, //counter-clock
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
						velx : 8,
						vely : 8,
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
				x_speed: -9.8,
				y_speed: 9.8,
			}
		],
		cost : 0,
		scrpt : function(_self){}
		
	},
	
	j_H:{
		animation: ulysses_8H,
		lnd_strng: 3,
		hboxs: [//hit 1
			{
				create : 9,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 3,
					duration : 4,
					dmg : 40,
					kdwn: false,
					hts : 60,
					bls : 10,
					bloc : blc_types.mid,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +72,
						posy : -0,
					},
					kback : {
						strength : 24, // +1 pnts
						angle : 20, //counter-clock
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
				start: 9,
				x_speed: -10,
				y_speed: 0,
			}
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
		animation: ulysses_ngrab,
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
							case ulysses_ngrab:
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
								
								_graber.sprite_index = ulysses_5H;
								
								break;
							case ulysses_5H:
								var dmg = _victim.calc_damage(30);
								var hts = 60 - _victim.stats.weight.hit_red;
								var kbck = 18;
								var angle = 10;
								var kdwn = true;
								if (_graber.image_index >= 0 and _graber.image_index <= 13){
									//move
									_victim.depth = 1;
									_victim.sprite_index = _victim.animations.hitstun
									_victim.x = _graber.x - 48 * _graber.image_xscale
									_victim.y = _graber.y - 24;
								}
								if (_graber.image_index >= 14){
									particle_function(hitspark_normal,
										_graber.x + (24 * _graber.image_xscale),
										_graber.y - 12,
										0, 0,
										)
									//current_attack = attacks.empty
									match_controller.hit_pause(2)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.x = _graber.x + 24 * _graber.image_xscale
									_victim.y = _graber.y - 12;
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
		animation: ulysses_agrab,
		lnd_strng: 2,
		hboxs: [
			//hit 1
			{
				create : 4,
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
							case ulysses_agrab:
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
								
								_graber.sprite_index = ulysses_8H;
								
								break;
							case ulysses_8H:
								_graber.velx = 0;
								_graber.vely = 0;
								_victim.velx = 0;
								_victim.vely = 0;
								var dmg = _victim.calc_damage(30);
								var hts = 60 - _victim.stats.weight.hit_red;
								var kbck = 18;
								var angle = 10;
								var kdwn = true;
								if (_graber.image_index >= 0 and _graber.image_index <= 8){
									//move
									_victim.depth = 1;
									_victim.sprite_index = _victim.animations.hitstun
									_victim.x = _graber.x - 48 * _graber.image_xscale
									_victim.y = _graber.y - 24;
								}
								if (_graber.image_index >= 10){
									particle_function(hitspark_normal,
										_graber.x + (24 * _graber.image_xscale),
										_graber.y - 12,
										0, 0,
										)
									//current_attack = attacks.empty
									match_controller.hit_pause(2)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.x = _graber.x + 24 * _graber.image_xscale
									_victim.y = _graber.y - 12;
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
	
	n_S_one:{
		animation: ulysses_s1,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 13,
				hbox: {
					hitspark: hitspark_purplefire,
					spr : ulysses_s1_pry,
					scale_x : 1,
					scale_y : 1,
					duration : 320,
					dmg : 50,
					kdwn: true,
					hts : 60,
					bls : 10 ,
					bloc : blc_types.pry,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : 0,
					},
					kback : {
						strength : 12, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 5,
						water : false,
					},
					pry_properties : {
						velx : 2,
						vely : 0,
						bmrng : false,
						activation : {
							delay: 2,
							contact: true,
							summon: noone
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
		cost : 15,
		scrpt : function(_self){}
		
	},
	
	n_S_two:{
		animation: ulysses_s2,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 7,
				hbox: {
					hitspark: hitspark_thunder,
					spr : ulysses_s2_pry,
					scale_x : 1,
					scale_y : 1,
					duration : 40,
					dmg : 30,
					kdwn: true,
					hts : 5,
					bls : 12 ,
					bloc : blc_types.pry,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +96,
						posy : 0,
					},
					kback : {
						strength : 4, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 10,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
						velx : 12,
						vely : 0,
						bmrng : false,
						activation : {
							delay: -1,
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
	
	n_S_three:{
		animation: ulysses_s3, //18 frames total
		lnd_strng: -1,
		hboxs: [
		],
		helper: {
			frame: -1,
			object: noone
		},
		prots : [
		],
		movements: [
		],
		cost : 10,
		scrpt : function(_self){
			if _self.image_index == 31{
				var _enemy = match_controller.player_one;
				if _self.wich_player == 1 {
					_enemy = match_controller.player_two;
				}
				_self.x = _enemy.x - (_enemy.image_xscale)*160;
				_self.y = _enemy.y;
			}
		}
	},
	
	a_S_one:{
		animation: ulysses_s1,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 13,
				hbox: {
					hitspark: hitspark_purplefire,
					spr : ulysses_s1_pry,
					scale_x : 1,
					scale_y : 1,
					duration : 320,
					dmg : 50,
					kdwn: true,
					hts : 60,
					bls : 10 ,
					bloc : blc_types.pry,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : 0,
					},
					kback : {
						strength : 12, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 0,
						poison : 0,
						curse : 5,
						water : false,
					},
					pry_properties : {
						velx : 2,
						vely : 0,
						bmrng : false,
						activation : {
							delay: 2,
							contact: true,
							summon: noone
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
		cost : 15,
		scrpt : function(_self){}
		
	},
	
	a_S_two:{
		animation: ulysses_s2,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 7,
				hbox: {
					hitspark: hitspark_thunder,
					spr : ulysses_s2_pry,
					scale_x : 1,
					scale_y : 1,
					duration : 40,
					dmg : 30,
					kdwn: true,
					hts : 5,
					bls : 12 ,
					bloc : blc_types.pry,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +96,
						posy : 0,
					},
					kback : {
						strength : 4, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 10,
						cold : 0,
						poison : 0,
						curse : 0,
						water : false,
					},
					pry_properties : {
						velx : 12,
						vely : 0,
						bmrng : false,
						activation : {
							delay: 2,
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
		
	a_S_three:{
		animation: ulysses_s3, //18 frames total
		lnd_strng: -1,
		hboxs: [
		],
		helper: {
			frame: -1,
			object: noone
		},
		prots : [
		],
		movements: [
		],
		cost : 10,
		scrpt : function(_self){
			if _self.image_index == 31{
				var _enemy = match_controller.player_one;
				if _self.wich_player == 1 {
					_enemy = match_controller.player_two;
				}
				_self.x = _enemy.x - (_enemy.image_xscale)*160;
				_self.y = _enemy.y;
			}
		}
	},
	
}


