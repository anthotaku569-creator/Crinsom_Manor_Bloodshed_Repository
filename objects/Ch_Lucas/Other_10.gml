
stats  = StatFunctions(10, 10, 10, 10);
pallete = {
	sprite: Crinsom_color_palette,
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
		animation : Crinsom_adash,
		velx : 14,
	},
	run : {
		can : true,
		animation : Crinsom_run,
		stop : Crinsom_stop,
		velx : stats.ground.ground_speed + 12,
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
			high : Crinsom_parry_high,
			low : Crinsom_parry_low,
		},
	},
	special_defense : true,
}

animations = {
	enter: Crinsom_entrance,
	idle: Crinsom_idle,
	walk: Crinsom_f_walk,
	walkback: Crinsom_b_walk,
	step: Crinsom_f_walk,
	crouch: Crinsom_crouch,
	air: {
		rising: Crinsom_jmp_rising,
		falling: Crinsom_jmp_falling
	},
	landing: {
		light: Crinsom_landing_1,
		medium: Crinsom_landing_2,
		heavy: Crinsom_landing_3,
	},
	hitstun: Crinsom_hitstun,
	paralyze: Crinsom_paralizis,
	thumble: Crinsom_thumble,
	kdown: {
		light: Crinsom_light_kdown,
		heavy: Crinsom_hard_kdown,
	},
	bloc: {
		high: Crinsom_blc_high,
		low: Crinsom_blc_low,
		air: Crinsom_blc_air,
	},
	blocstun: {
		high: Crinsom_blcstn_high,
		low: Crinsom_blcstn_low,
		air: Crinsom_blcstn_air,
	},
	redeye:{
		dash: Crinsom_curseeye_dash,
		redpause: Crinsom_curseeye
	},
	entrance : Crinsom_entrance,
	death : Crinsom_hard_kdown,
	/*
	run : Father_walk,
	d_jmp : Father_walk,
	d_roll : Father_walk,*/
};

dodge_properties = {
	animation : Crinsom_bdash,
	startup : 3,
	velx : 27.7,
	vely : 0,
	inv_length: 12,
}

active_prys = ds_map_create();

explosion_s1 = {
	hitspark: hitspark_fire,
	spr : Crinsom_s1_pry2,
	scale_x : 1,
	scale_y : 1,
	duration : 26,
	dmg : 50,
	kdwn: false,
	hts : 20,
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
		strength : 10, // +1 pnts
		angle : 90, //counter-clock
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

attacks = {
	n_L:{
		animation: Crinsom_5L,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 4,
				hbox: {
					hitspark: hitspark_fire,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 4,
					dmg : 20,
					kdwn: false,
					hts : 11,
					bls : 11,
					bloc : blc_types.mid,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -48,
					},
					kback : {
						strength : 6,
						angle : 0, //counter-clock
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
		animation: Crinsom_2L,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 5,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 4, // -2 pnts
					dmg : 20, // -6 pnts
					kdwn: false,
					hts : 12,
					bls : 10,
					bloc : blc_types.low,
					reflect : false,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
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
	
	f_L:{
		animation: Crinsom_6L,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 7,
				hbox: {
					hitspark: hitspark_fire,
					spr : hitbox_spr,
					scale_x : 0.5,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : 30, // -6 pnts
					kdwn: false,
					hts : 20,
					bls : 10,
					bloc : blc_types.mid,
					reflect : false,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +36,
						posy : -48,
					},
					kback : {
						strength : 10,
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
		animation: Crinsom_8L,
		lnd_strng: 1,
		hboxs: [
			//hit 1
			{
				create : 4,
				hbox: {
					hitspark: hitspark_fire,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 4,
					dmg : 20,
					kdwn: false,
					hts : 12,
					bls : 4,
					bloc : blc_types.ovh,
					strg: 1, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : 0,
					},
					kback : {
						strength :  6,
						angle : 0, //counter-clock
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
		animation: Crinsom_5M,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 6,
				hbox: {
					hitspark: hitspark_fire,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 4,
					dmg : 40,
					kdwn: false,
					hts : 16,
					bls : 16,
					bloc : blc_types.mid,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +36,
						posy : -48,
					},
					kback : {
						strength : 6,
						angle : -20, //counter-clock
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
		animation: Crinsom_2M,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 0.5,
					duration : 4, // -2 pnts
					dmg : 40, // -6 pnts
					kdwn: false,
					hts : 15,
					bls : 12,
					bloc : blc_types.low,
					reflect : false,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +36,
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
		animation: Crinsom_8M,
		lnd_strng: 2,
		hboxs: [//hit 1
			{
				create : 5,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 1,
					duration : 12, // -2 pnts
					dmg : 40, // -6 pnts
					kdwn: false,
					hts : 24,
					bls : 12,
					bloc : blc_types.ovh,
					reflect : false,
					strg: 2, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : 0,
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
	
	n_H:{
		animation: Crinsom_5H,
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 9,
				hbox: {
					hitspark: hitspark_fire,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 4,
					dmg : 80,
					kdwn: false,
					hts : 21,
					bls : 21,
					bloc : blc_types.mid,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +44,
						posy : -24,
					},
					kback : {
						strength : 8, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 3,
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
		animation: Crinsom_2H,
		lnd_strng: -1,
		hboxs: [//hit 1
			{
				create : 11,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 0.5,
					duration : 4, // -2 pnts
					dmg : 80, // -6 pnts
					kdwn: true,
					hts : 34,
					bls : 12,
					bloc : blc_types.low,
					reflect : false,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +36,
						posy : 0,
					},
					kback : {
						strength : 10,
						angle : 15, //counter-clock
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
		animation: Crinsom_4H,
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
					duration : 4,
					dmg : 120,
					kdwn: true,
					hts : 60,
					bls : 14,
					bloc : blc_types.mid,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : 0,
					},
					kback : {
						strength : 15, // +1 pnts
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
	
	j_H:{
		animation: Crinsom_8H,
		lnd_strng: 3,
		hboxs: [//hit 1
			{
				create : 6,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 2.5,
					duration : 4, // -2 pnts
					dmg : 80, // -6 pnts
					kdwn: true,
					hts : 60,
					bls : 10,
					bloc : blc_types.ovh,
					reflect : false,
					strg: 3, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +48,
						posy : +24,
					},
					kback : {
						strength : 25, // +1 pnts
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
									match_controller.hit_pause(dmg, hts, kbck)
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
									match_controller.hit_pause(dmg, hts, kbck)
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
		cost : 0,
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
					dmg : 80, // -6 pnts
					kdwn: true,
					hts : 80, // -6 pnts
					bls : 18,
					bloc : blc_types.mid,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : true,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +72,
						posy : -24,
					},
					kback : {
						strength : 25, // +3 pnts
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
				x_speed: 35.8,
				y_speed: 0,
			}
		],
		cost : 10,
		scrpt : function(_self){
			if input_check(_self.inputs.k_S2, _self.wich_player)
				and _self.image_index > 6
				and _self.image_index < 16 {
				_self.velx += _self.image_xscale*gnd_fric_1/2;
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
					scale_y : 2,
					duration : 4, // -2 pnts
					dmg : 40, // -6 pnts
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
						strength : 10, // +1 pnts
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
					dmg : 40, // -6 pnts
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
						strength : 10, // +1 pnts
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
					dmg : 40, // -6 pnts
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
						_self.functionAttackStart(_self.attacks.a_S_two, states.special_atack);
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
		cost : 0,
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
					dmg : 80, // -6 pnts
					kdwn: true,
					hts : 80, // -6 pnts
					bls : 20,
					bloc : blc_types.ovh,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +32,
						posy : +24,
					},
					kback : {
						strength : 25, // +3 pnts
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
					scale_y : 2,
					duration : 4, // -2 pnts
					dmg : 40, // -6 pnts
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
						strength : 10, // +1 pnts
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
					dmg : 40, // -6 pnts
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
						strength : 10, // +1 pnts
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
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : 40, // -6 pnts
					kdwn: true,
					hts : 80, // -6 pnts
					bls : 10,
					bloc : blc_types.mid,
					strg: 4, //1 = Light/ Pry, 2= Mid, 3= Heavy, 4 = Special
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +40,
						posy : -64,
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
						_self.functionAttackStart(_self.attacks.a_S_two, states.special_atack);
					}
			}
		}
	},
	
}


