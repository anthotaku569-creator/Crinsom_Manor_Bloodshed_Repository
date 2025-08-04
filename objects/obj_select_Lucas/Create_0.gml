/// @description Insert description here
// You can write your code in this editor

//characters
char = Ch_Lucas;
banner = Crinsom_Banner;
idle = Crinsom_idle;
smol = Crinsom_Portrait_small;
name = "..."
//supers

super_names = [
	"Little friend : )",
	"Virtual Insanity",
	"Hat install",
]

super_function = function (select, _obj){
	switch(select){
		case 1:
		with(_obj){
			super_func = function (){
				if (self.image_index == 3){
					match_controller.cutscene(Father_Cutscene_Super_I);
					self.image_index ++;
				}
			}
			#region SUPER I
uninstall_super = {
	stats : StatFunctions(10, 10, 10),
	extras : {
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
				high : Father_parry_high,
				low : Father_parry_low,
			},
		},
	},
	animations : {
		idle: Father_idle,
		walk: Father_walk,
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
	},
	dodge_properties : {
		animation : Father_dodge,
		startup : 1,
		velx : 27.7,
		vely : 0,
		turn_around : -1,
		auto_cancel : true,
	},
	super_func : super_func,
	attacks : {
	n_tilt : {
		animation: Father_n_tilt, //13 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 5,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (3*2), // -6 pnts
					bloc : blc_types.mid,//0
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
		animation: Father_f_tilt, //23 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 9,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (5*2), // -5 pnts
					hts : 2 + (5*2), // -5 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : (2*2)*2, // +1 pnts
						angle : 5, //counter-clock
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
				create : 11,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (8*4/3), // - pnts
					hts : 11 + (9*4/3), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : (6*2)*4/3, // +3 pnts
						angle : 0, //counter-clock
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
	
	d_tilt : {
		animation: Father_d_tilt, //18 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 2, // -2 pnts
					dmg : ((14/4)*2), // -6 pnts
					hts : 11 + (5*2), // -6 pnts
					bloc : blc_types.low,//-10/4
					reflect : false,
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
		animation: Father_u_tilt, //18 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (10*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -72,
					},
					kback : {
						strength : (4*2)*2, // +1 pnts
						angle : 75, //counter-clock
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
	
	fu_tilt : {
		animation: Father_fu_tilt, //18 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 19,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1.5,
					duration : 2, // -2 pnts
					dmg : (18*2), // -6 pnts
					hts : 26 + (4*2), // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -48,
					},
					kback : {
						strength : (4*4)*2, // +1 pnts
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
	
	fd_tilt : {
		animation: Father_fd_tilt, //18 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 9,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 12, // -2 pnts
					dmg : ((14/4)*2), // -6 pnts
					hts : 17 + (20*2), // -6 pnts
					bloc : blc_types.low,//-10/4
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +16,
						posy : 0,
					},
					kback : {
						strength : (3*4)*2, // +1 pnts
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
			{
				start: 9,
				x_speed: 27.7,
				y_speed: 0,
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
	
	n_air : {
		animation: Father_n_air, //23 frames total
		lnd_strng: 1,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 5,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*4/3), // - pnts
					hts : 11 + (6*4/3), // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
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
	
	f_air : {
		animation: Father_f_air, //23 frames total
		lnd_strng: 1,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*4/3), // - pnts
					hts : 2 + 10, // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
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
	
	u_air : {
		animation: Father_u_air, //23 frames total
		lnd_strng: 2,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (10*2), // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : -72,
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
	
	d_air : {
		animation: Father_d_air, //23 frames total
		lnd_strng: 3,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 9,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (8*2), // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : +12,
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
	
	b_air : {
		animation: Father_b_air, //23 frames total
		lnd_strng: 3,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 10,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (12*2), // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : -24,
						posy : -32,
					},
					kback : {
						strength : (10)*2, // +1 pnts
						angle : -180, //counter-clock
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
				x_speed: -air_fric_1,
				y_speed: 0,
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
	
	fu_air : {
		animation: Father_u_tilt, //18 frames total
		lnd_strng: 1,
		hboxs: [
			//hit 1
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (6*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -72,
					},
					kback : {
						strength : (4)*2, // +1 pnts
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
	
	fd_air : {
		animation: Father_fd_air, //23 frames total
		lnd_strng: 1,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (4*2), // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : +24,
					},
					kback : {
						strength : (3*4)*2, // +1 pnts
						angle : -45, //counter-clock
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
				start: 7,
				x_speed: 12,
				y_speed: 12,
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
	
	bu_air : {
		animation: Father_bu_air, //18 frames total
		lnd_strng: 3,
		hboxs: [
			//hit 1
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 2.5,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (10*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : -24,
						posy : 0,
					},
					kback : {
						strength : (4*4)*2, // +1 pnts
						angle : 135, //counter-clock
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
		helper: {frame: -1, object: noone},install: noone, prots : [
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
	
	bd_air : {
		animation: Father_bd_air, //18 frames total
		lnd_strng: 3,
		hboxs: [
			//hit 1
			{
				create : 11,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 2.5,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (30*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : -24,
						posy : 0,
					},
					kback : {
						strength : (5*4)*2, // +1 pnts
						angle : -135, //counter-clock
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
	
	empty : {
		animation: sprite_index, //18 frames total
		lnd_strng: -1,
		hboxs: [],
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
	
	n_grab : {
		animation: Father_grab, //23 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 3,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 0.5,
					scale_y : 1,
					duration : 1, // -2 pnts
					dmg : 0, // - pnts
					hts : 0, // -6 pnts
					bloc : blc_types.grb,//0
					reflect : false,
					grb_script : function (_graber,_victim){
						_victim.vely = _graber.vely;
						switch(_graber.sprite_index){
							case Father_grab:
								//victima
								_victim.image_speed=0
								_victim.image_index=30
								_victim.sprite_index = _victim.animations.hitstun
								_victim.bars.HitstunBar.actual += 10
								_victim.image_xscale = _graber.image_xscale*-1
								_victim.x = _graber.x + 24 * _graber.image_xscale
								_victim.y = _graber.y
								_victim.depth = 0
								//agarrador
								_graber.sprite_index = Father_grabin
								_graber.depth = -1
								if _victim.buffer.key == k_buffer.k_grab{
									_victim.bars.HitstunBar.actual = 0							
								}
								break;
							case Father_grabin:
								if(_victim.bars.HitstunBar.actual >=0 ){
									_victim.bars.HitstunBar.actual -= 0.2
									if _graber.buffer.horizontal == hor_buffer.d_right{
										_graber.image_index=0
										if _graber.image_xscale == 1{
											_victim.image_index=0
											_graber.sprite_index = Father_f_trhow;
										}
										else{
											_victim.image_index=0
											_graber.sprite_index = Father_b_trhow;
										}
									}
									if _graber.buffer.horizontal == hor_buffer.d_left{
										if _graber.image_xscale == -1{
											_victim.image_index=0
											_graber.sprite_index = Father_f_trhow;
										}
										else{
											_victim.image_index=0
											_graber.sprite_index = Father_b_trhow;
										}
									}
									
									if _graber.buffer.vertical == ver_buffer.d_up{
										_graber.image_index=0
										_victim.image_index=0
										_graber.sprite_index = Father_u_trhow;
									}
									if _graber.buffer.vertical == ver_buffer.d_down{
										_graber.image_index=0
										_victim.image_index=0
										_graber.sprite_index = Father_d_trhow;
									}
								}
								else{
									//agarrador
									_graber.sprite_index = _graber.animations.landing.heavy;
									_graber.bars.HitstunBar.kdwn = 0;
									_graber.bars.HitstunBar.actual = 0
									_graber.image_index = 0;
									_graber.velx = 16 * _victim.image_xscale;
									//victima
									_victim.image_speed=1;
									_victim.sprite_index = _victim.animations.landing.heavy;
									_victim.bars.HitstunBar.kdwn = 0;
									_victim.bars.HitstunBar.actual = 0
									_victim.image_index = 0;
									_victim.velx = 16 * _graber.image_xscale;
									//exit
									_victim.state = states.kdown_recovery;
									_graber.state = states.kdown_recovery;
								}
								break;
							case Father_f_trhow:
								var dmg = calc_damage(10)//10*_victim.scaling.dmg;
								var hts = 40 - _victim.stats.weight.hit_red;
								var kbck = 20; var angle = 0;
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
									_victim.scaling.dmg = _victim.scaling.dmg*0.9
									_victim.scaling.kbck = _victim.scaling.kbck*1.1
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = Father_f_trhow;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.normal_atack;
								}
								break;
							case Father_b_trhow:
								var dmg = calc_damage(15)//15*_victim.scaling.dmg;
								var hts = 65 - _victim.stats.weight.hit_red;
								var kbck = 20; var angle = 160;
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
									_victim.scaling.dmg = _victim.scaling.dmg*0.9
									_victim.scaling.kbck = _victim.scaling.kbck*1.1
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = Father_b_trhow;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.normal_atack;
								}
								break;
							case Father_u_trhow:
								var dmg = calc_damage(10)//10*_victim.scaling.dmg;
								var hts = 50 - _victim.stats.weight.hit_red;
								var kbck = 22; var angle = 80;
								if (_graber.image_index >= 0 and _graber.image_index <= 6){
									//move
									_victim.sprite_index = _victim.animations.crouch
									_victim.x = _graber.x + 12 * _graber.image_xscale
									_victim.y = _graber.y
								}
								if (_graber.image_index >= 6 and _graber.image_index <= 11){
									//move
									_victim.sprite_index = _victim.animations.crouch
									_victim.x = _graber.x + 0 * _graber.image_xscale
									_victim.y = _graber.y
								}
								if (_graber.image_index == 11){
									//current_attack = attacks.empty
									match_controller.hit_pause(dmg, hts, kbck)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.x = _graber.x + 12 * _graber.image_xscale
									_victim.y = _graber.y - 24
									_victim.image_angle = 0
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.9
									_victim.scaling.kbck = _victim.scaling.kbck*1.1
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = Father_u_trhow;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.normal_atack;
								}
								break;
							case Father_d_trhow:
								var dmg = calc_damage(5)//5*_victim.scaling.dmg;
								var hts = 40 - _victim.stats.weight.hit_red;
								var kbck = 22; var angle = -80;
								if (_graber.image_index >= 0 and _graber.image_index <= 1){
									_victim.image_index=30
									//move
									_victim.sprite_index = _victim.animations.hitstun
									_victim.x = _graber.x + 24 * _graber.image_xscale
									_victim.y = _graber.y - 24
								}
								if (_graber.image_index >= 3 and _graber.image_index <= 5){
									_victim.image_index=30
									//move
									_victim.sprite_index = _victim.animations.hitstun
									_victim.x = _graber.x + 12 * _graber.image_xscale
									_victim.y = _graber.y - 28
								}
								if (_graber.image_index == 6){
									//current_attack = attacks.empty
									match_controller.hit_pause(dmg, hts, kbck)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.x = _graber.x + 24 * _graber.image_xscale
									_victim.y = _graber.y
									_victim.image_angle = 0
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.9
									_victim.scaling.kbck = _victim.scaling.kbck*1.1
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = Father_d_trhow;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.normal_atack;
								}
								break;
						}
					},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : 0, // +3 pnts
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
			inspiration: 5,
			charge: false,
		}
	},
	
	a_grab : {
		animation: Father_grab, //23 frames total
		lnd_strng: 2,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 3,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 0.5,
					scale_y : 1,
					duration : 1, // -2 pnts
					dmg : 0, // - pnts
					hts : 0, // -6 pnts
					bloc : blc_types.grb,//0
					reflect : false,
					grb_script : function (_graber,_victim){
						_victim.vely = _graber.vely;
						switch(_graber.sprite_index){
							case Father_grab:
								//victima
								_victim.image_speed=0
								_victim.image_index=0
								_victim.sprite_index = _victim.animations.kdown.light
								_victim.image_xscale = _graber.image_xscale*-1
								_victim.x = _graber.x
								_victim.y = _graber.y + 24
								_graber.vely = 8
								_victim.depth = 0
								//agarrador
								_graber.sprite_index = Father_a_trhow_1
								_graber.depth = -1
								if _victim.buffer.key == k_buffer.k_grab{
									_graber.sprite_index = _graber.animations.hitstun;
									_victim.sprite_index = _victim.animations.hitstun;
								}
								break;
							case Father_a_trhow_1:
								var dmg = calc_damage(20)//20*_victim.scaling.dmg;
								var hts = 65 - _victim.stats.weight.hit_red;
								var kbck = 24; var angle = -45;
								//when the hit actually hits
								if (_victim.vely == 0){
									//current_attack = attacks.empty
									match_controller.hit_pause(dmg, hts, kbck)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.9
									_victim.scaling.kbck = _victim.scaling.kbck*1.1
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									//victim got out, now is grabber's turn
									_graber.sprite_index = Father_a_trhow_2;
									_graber.attacks.empty.animation = Father_a_trhow_2;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.normal_atack;
								}
								else{
									_victim.x = _graber.x
									_victim.y = _graber.y + 24
									_victim.vely = _graber.vely
									_victim.vely = _graber.vely
								}
								break;
							default:
								_victim.image_speed = 1;
								_graber.image_speed = 1;
								_graber.vely = -2;
								_victim.vely = -2;
								_graber.velx = -8*_graber.image_xscale;
								_victim.velx = -8*_victim.image_xscale;
								_victim.bars.HitstunBar.actual = 30;
								_graber.bars.HitstunBar.actual = 30;
								_graber.state = states.hitstun
								_victim.state = states.hitstun
								break;
								
						}
					},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : 0, // +3 pnts
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
			inspiration: 5,
			charge: false,
		}
	},
	
	n_n_spe : {
		animation: Father_nnspecial, //13 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 10,
				hbox: { hitspark: hitspark_normal,
					spr : Father_pry_nspecial,
					scale_x : 1,
					scale_y : 1,
					duration : 60, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (3*2), // -6 pnts
					bloc : blc_types.pry,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +48,
						posy : -48,
					},
					kback : {
						strength : (2*4), // +1 pnts
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
			inspiration: 15,
			charge: false,
		}
	},
	
	a_n_spe : {
		animation: Father_anspecial, //13 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 10,
				hbox: { hitspark: hitspark_normal,
					spr : Father_pry_nspecial,
					scale_x : 1,
					scale_y : 1,
					duration : 60, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (3*2), // -6 pnts
					bloc : blc_types.pry,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +48,
						posy : 0,
					},
					kback : {
						strength : (2*4), // +1 pnts
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
						vely : 4,
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
		helper: {
			frame: -1,
			object: noone
		},
		install: noone,
		prots : [
		],
		movements: [
			{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 10,
				x_speed: 0,
				y_speed: grav_1 * -1,
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
	
	n_u_spe : {
		animation: Father_nu_special, //18 frames total
		lnd_strng: 4,
		hboxs: [
			//hit 1
			{
				create : 4,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 1.5,
					duration : 2, // -2 pnts
					dmg : (18*2), // -6 pnts
					hts : 26 + (20*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : -32,
					},
					kback : {
						strength : (3*4)*2, // +1 pnts
						angle : 60, //counter-clock
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
		install: noone,
		prots : [
			{
				start: 1,
				type: protections.grab_invul,
				finish: 20,
			}
		],
		movements: [
			{
				start: 1,
				x_speed: 2,
				y_speed: -18.6,
			}
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
	
	a_u_spe : {
		animation: Father_nu_special, //18 frames total
		lnd_strng: 4,
		hboxs: [
			//hit 1
			{
				create : 4,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 1.5,
					duration : 2, // -2 pnts
					dmg : (18*2), // -6 pnts
					hts : 26 + (20*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : -32,
					},
					kback : {
						strength : (3*4)*2, // +1 pnts
						angle : 60, //counter-clock
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
		install: noone,
		prots : [
			{
				start: 1,
				type: protections.grab_invul,
				finish: 20,
			}
		],
		movements: [
			{
				start: 1,
				x_speed: 2,
				y_speed: -18.6,
			}
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
	
	n_f_spe : {
		animation: Father_nf_special,
		lnd_strng: -1,
		hboxs: [
			//hit 2 -> 13 pnts
			{
				create : 13,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 10, // -2 pnts
					dmg : (12*4/3), // - pnts
					hts : 11 + (4*4/3), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : true,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : (12*2)*4/3, // +3 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 45,
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
				x_speed: 23.3,
				y_speed: 0,
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
	
	a_f_spe : {
		animation: Father_nf_special,
		lnd_strng: -1,
		hboxs: [
			//hit 2 -> 13 pnts
			{
				create : 13,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 10, // -2 pnts
					dmg : (12*4/3), // - pnts
					hts : 11 + (4*4/3), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : true,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : (12*2)*4/3, // +3 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 45,
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
		follow_ups: [
		],
		effects : [
		],
		cost :{
			inspiration: 15,
			charge: false,
		}
	},
	
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
	
	n_fd_spe : {
		animation: Father_nfdspecial, //18 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 9,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 12, // -2 pnts
					dmg : ((16/4)*2), // -6 pnts
					hts : 17 + (18*2), // -6 pnts
					bloc : blc_types.low,//-10/4
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +16,
						posy : 0,
					},
					kback : {
						strength : (3*4)*2, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 10,
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
				start: 5,
				type: protections.proy_invul,
				finish: 19,
			}
		],
		movements: [
			{
				start: 9,
				x_speed: 14.4,
				y_speed: 0,
			},
			{
				start: 10,
				x_speed: 14.4,
				y_speed: 0,
			},
			{
				start: 11,
				x_speed: 14.4,
				y_speed: 0,
			},
			{
				start: 12,
				x_speed: 14.4,
				y_speed: 0,
			},
			{
				start: 13,
				x_speed: 14.4,
				y_speed: 0,
			},
			{
				start: 14,
				x_speed: 14.4,
				y_speed: 0,
			},
			{
				start: 15,
				x_speed: 14.4,
				y_speed: 0,
			},
			{
				start: 16,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 16,
				x_speed: 33.9,
				y_speed: 0,
			}
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
	
	a_fd_spe : {
		animation:	Father_afdspecial, //23 frames total
		lnd_strng: 3,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 8,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 10, // -2 pnts
					dmg : (8*2), // -6 pnts
					hts : 9 + (10*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : +24,
					},
					kback : {
						strength : (3*4)*2, // +1 pnts
						angle : -45, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 10,
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
				start: 2,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 3,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 4,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 5,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 8,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 9,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 10,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 11,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 12,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 13,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 14,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 15,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 16,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 17,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 18,
				x_speed: 14.4,
				y_speed: 14.4,
			}
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
	
	n_fu_spe : {
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
				start: 5,
				type: protections.armor,
				finish: 23,
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
	
	a_fu_spe : {
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
				start: 5,
				type: protections.armor,
				finish: 23,
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
},
}
install_super = {
	stats : StatFunctions(15, 15, 15),
	extras : {
		float : {
			can : true,
			time : 120,
			animation : FatherHat_walk,		
		},
		air_dash : {
			can : true,
			able : true,
			animation : FatherHat_airDash,
			velx : 16,
		},
		run : {
			can : true,
			animation : FatherHat_walk,
			stop : FatherHat_landing_3,
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
				high : FatherHat_parry_high,
				low : FatherHat_parry_low,
			},
		},
	},
	animations : {
		idle: FatherHat_idle,
		walk: FatherHat_walk,
		step: FatherHat_step,
		crouch: FatherHat_crouch,
		air: {
			rising: FatherHat_jmp_rising,
			falling: FatherHat_jmp_falling
		},
		landing: {
			light: FatherHat_landing_1,
			medium: FatherHat_landing_2,
			heavy: FatherHat_landing_3,
		},
		hitstun: FatherHat_hitstun,
		paralyze: FatherHat_paralyze,
		thumble: FatherHat_thumble,
		kdown: {
			light: FatherHat_Lkdown,
			heavy: FatherHat_Hkdown,
		},
		bloc: {
			high: FatherHat_bloc_high,
			low: FatherHat_bloc_low,
			air: FatherHat_bloc_air,
		},
		blocstun: {
			high: FatherHat_blocstun_high,
			low: FatherHat_blocstun_low,
			air: FatherHat_blocstun_air,
		},
	},
	dodge_properties : {
		animation : FatherHat_dodge,
		startup : 1,
		velx : 27.7,
		vely : 0,
		turn_around : -1,
		auto_cancel : true,
	},
	super_func : super_func,
	attacks : {
	n_tilt : {
		animation: FatherHat_n_tilt, //13 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 5,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (3*2), // -6 pnts
					bloc : blc_types.mid,//0
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
		animation: FatherHat_f_tilt, //23 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 9,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (5*2), // -5 pnts
					hts : 2 + (5*2), // -5 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : (2*2)*2, // +1 pnts
						angle : 5, //counter-clock
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
				create : 11,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (8*4/3), // - pnts
					hts : 11 + (9*4/3), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : (6*2)*4/3, // +3 pnts
						angle : 0, //counter-clock
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
	
	d_tilt : {
		animation: FatherHat_d_tilt, //18 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 2, // -2 pnts
					dmg : ((14/4)*2), // -6 pnts
					hts : 11 + (5*2), // -6 pnts
					bloc : blc_types.low,//-10/4
					reflect : false,
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
		animation: FatherHat_u_tilt, //18 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (10*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -72,
					},
					kback : {
						strength : (4*2)*2, // +1 pnts
						angle : 75, //counter-clock
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
	
	fu_tilt : {
		animation: FatherHat_fu_tilt, //18 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 19,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1.5,
					duration : 2, // -2 pnts
					dmg : (18*2), // -6 pnts
					hts : 26 + (4*2), // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -48,
					},
					kback : {
						strength : (4*4)*2, // +1 pnts
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
	
	fd_tilt : {
		animation: FatherHat_fd_tilt, //18 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 9,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 12, // -2 pnts
					dmg : ((14/4)*2), // -6 pnts
					hts : 17 + (20*2), // -6 pnts
					bloc : blc_types.low,//-10/4
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +16,
						posy : 0,
					},
					kback : {
						strength : (3*4)*2, // +1 pnts
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
			{
				start: 9,
				x_speed: 27.7,
				y_speed: 0,
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
	
	n_air : {
		animation: FatherHat_n_air, //23 frames total
		lnd_strng: 1,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 5,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*4/3), // - pnts
					hts : 11 + (6*4/3), // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
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
	
	f_air : {
		animation: FatherHat_f_air, //23 frames total
		lnd_strng: 1,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*4/3), // - pnts
					hts : 2 + 10, // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
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
	
	u_air : {
		animation: FatherHat_u_air, //23 frames total
		lnd_strng: 2,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (10*2), // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : -72,
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
	
	d_air : {
		animation: FatherHat_d_air, //23 frames total
		lnd_strng: 3,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 9,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (8*2), // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : +12,
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
	
	b_air : {
		animation: FatherHat_b_air, //23 frames total
		lnd_strng: 3,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 10,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 4, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (12*2), // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : -24,
						posy : -32,
					},
					kback : {
						strength : (10)*2, // +1 pnts
						angle : -180, //counter-clock
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
				x_speed: -air_fric_1,
				y_speed: 0,
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
	
	fu_air : {
		animation: FatherHat_u_tilt, //18 frames total
		lnd_strng: 1,
		hboxs: [
			//hit 1
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (6*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -72,
					},
					kback : {
						strength : (4)*2, // +1 pnts
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
	
	fd_air : {
		animation: FatherHat_fd_air, //23 frames total
		lnd_strng: 1,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (4*2), // -6 pnts
					bloc : blc_types.ovh,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : +24,
					},
					kback : {
						strength : (3*4)*2, // +1 pnts
						angle : -45, //counter-clock
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
				start: 7,
				x_speed: 12,
				y_speed: 12,
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
	
	bu_air : {
		animation: FatherHat_bu_air, //18 frames total
		lnd_strng: 3,
		hboxs: [
			//hit 1
			{
				create : 7,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 2.5,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (10*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : -24,
						posy : 0,
					},
					kback : {
						strength : (4*4)*2, // +1 pnts
						angle : 135, //counter-clock
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
		helper: {frame: -1, object: noone},install: noone, prots : [
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
	
	bd_air : {
		animation: FatherHat_bd_air, //18 frames total
		lnd_strng: 3,
		hboxs: [
			//hit 1
			{
				create : 11,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 2.5,
					duration : 2, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (30*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : -24,
						posy : 0,
					},
					kback : {
						strength : (5*4)*2, // +1 pnts
						angle : -135, //counter-clock
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
	
	empty : {
		animation: sprite_index, //18 frames total
		lnd_strng: -1,
		hboxs: [],
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
	
	n_grab : {
		animation: FatherHat_grab, //23 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 3,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 0.5,
					scale_y : 1,
					duration : 1, // -2 pnts
					dmg : 0, // - pnts
					hts : 0, // -6 pnts
					bloc : blc_types.grb,//0
					reflect : false,
					grb_script : function (_graber,_victim){
						_victim.vely = _graber.vely;
						switch(_graber.sprite_index){
							case FatherHat_grab:
								//victima
								_victim.image_speed=0
								_victim.image_index=30
								_victim.sprite_index = _victim.animations.hitstun
								_victim.bars.HitstunBar.actual += 10
								_victim.image_xscale = _graber.image_xscale*-1
								_victim.x = _graber.x + 24 * _graber.image_xscale
								_victim.y = _graber.y
								_victim.depth = 0
								//agarrador
								_graber.sprite_index = FatherHat_grabin
								_graber.depth = -1
								if _victim.buffer.key == k_buffer.k_grab{
									_victim.bars.HitstunBar.actual = 0							
								}
								break;
							case FatherHat_grabin:
								if(_victim.bars.HitstunBar.actual >=0 ){
									_victim.bars.HitstunBar.actual -= 0.2
									if _graber.buffer.horizontal == hor_buffer.d_right{
										_graber.image_index=0
										if _graber.image_xscale == 1{
											_victim.image_index=0
											_graber.sprite_index = FatherHat_f_trhow;
										}
										else{
											_victim.image_index=0
											_graber.sprite_index = FatherHat_b_trhow;
										}
									}
									if _graber.buffer.horizontal == hor_buffer.d_left{
										if _graber.image_xscale == -1{
											_victim.image_index=0
											_graber.sprite_index = FatherHat_f_trhow;
										}
										else{
											_victim.image_index=0
											_graber.sprite_index = FatherHat_b_trhow;
										}
									}
									
									if _graber.buffer.vertical == ver_buffer.d_up{
										_graber.image_index=0
										_victim.image_index=0
										_graber.sprite_index = FatherHat_u_trhow;
									}
									if _graber.buffer.vertical == ver_buffer.d_down{
										_graber.image_index=0
										_victim.image_index=0
										_graber.sprite_index =FatherHat_d_trhow;
									}
								}
								else{
									//agarrador
									_graber.sprite_index = _graber.animations.landing.heavy;
									_graber.bars.HitstunBar.kdwn = 0;
									_graber.bars.HitstunBar.actual = 0
									_graber.image_index = 0;
									_graber.velx = 16 * _victim.image_xscale;
									//victima
									_victim.image_speed=1;
									_victim.sprite_index = _victim.animations.landing.heavy;
									_victim.bars.HitstunBar.kdwn = 0;
									_victim.bars.HitstunBar.actual = 0
									_victim.image_index = 0;
									_victim.velx = 16 * _graber.image_xscale;
									//exit
									_victim.state = states.kdown_recovery;
									_graber.state = states.kdown_recovery;
								}
								break;
							case FatherHat_f_trhow:
								var dmg = calc_damage(10)//10*_victim.scaling.dmg;
								var hts = 40 - _victim.stats.weight.hit_red;
								var kbck = 20; var angle = 0;
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
									_victim.scaling.dmg = _victim.scaling.dmg*0.9
									_victim.scaling.kbck = _victim.scaling.kbck*1.1
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = FatherHat_f_trhow;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.normal_atack;
								}
								break;
							case FatherHat_b_trhow:
								var dmg = calc_damage(15)//15*_victim.scaling.dmg;
								var hts = 65 - _victim.stats.weight.hit_red;
								var kbck = 20; var angle = 160;
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
									_victim.scaling.dmg = _victim.scaling.dmg*0.9
									_victim.scaling.kbck = _victim.scaling.kbck*1.1
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = FatherHat_b_trhow;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.normal_atack;
								}
								break;
							case FatherHat_u_trhow:
								var dmg = calc_damage(10)//10*_victim.scaling.dmg;
								var hts = 50 - _victim.stats.weight.hit_red;
								var kbck = 22; var angle = 80;
								if (_graber.image_index >= 0 and _graber.image_index <= 6){
									//move
									_victim.sprite_index = _victim.animations.crouch
									_victim.x = _graber.x + 12 * _graber.image_xscale
									_victim.y = _graber.y
								}
								if (_graber.image_index >= 6 and _graber.image_index <= 11){
									//move
									_victim.sprite_index = _victim.animations.crouch
									_victim.x = _graber.x + 0 * _graber.image_xscale
									_victim.y = _graber.y
								}
								if (_graber.image_index == 11){
									//current_attack = attacks.empty
									match_controller.hit_pause(dmg, hts, kbck)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.x = _graber.x + 12 * _graber.image_xscale
									_victim.y = _graber.y - 24
									_victim.image_angle = 0
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.9
									_victim.scaling.kbck = _victim.scaling.kbck*1.1
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = Father_u_trhow;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.normal_atack;
								}
								break;
							case FatherHat_d_trhow:
								var dmg = calc_damage(5)//5*_victim.scaling.dmg;
								var hts = 40 - _victim.stats.weight.hit_red;
								var kbck = 22; var angle = -80;
								if (_graber.image_index >= 0 and _graber.image_index <= 1){
									_victim.image_index=30
									//move
									_victim.sprite_index = _victim.animations.hitstun
									_victim.x = _graber.x + 24 * _graber.image_xscale
									_victim.y = _graber.y - 24
								}
								if (_graber.image_index >= 3 and _graber.image_index <= 5){
									_victim.image_index=30
									//move
									_victim.sprite_index = _victim.animations.hitstun
									_victim.x = _graber.x + 12 * _graber.image_xscale
									_victim.y = _graber.y - 28
								}
								if (_graber.image_index == 6){
									//current_attack = attacks.empty
									match_controller.hit_pause(dmg, hts, kbck)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.x = _graber.x + 24 * _graber.image_xscale
									_victim.y = _graber.y
									_victim.image_angle = 0
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.9
									_victim.scaling.kbck = _victim.scaling.kbck*1.1
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									//victim got out, now is grabber's turn
									_graber.attacks.empty.animation = Father_d_trhow;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.normal_atack;
								}
								break;
						}
					},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : 0, // +3 pnts
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
			inspiration: 5,
			charge: false,
		}
	},
	
	a_grab : {
		animation: FatherHat_grab, //23 frames total
		lnd_strng: 2,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 3,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 0.5,
					scale_y : 1,
					duration : 1, // -2 pnts
					dmg : 0, // - pnts
					hts : 0, // -6 pnts
					bloc : blc_types.grb,//0
					reflect : false,
					grb_script : function (_graber,_victim){
						_victim.vely = _graber.vely;
						switch(_graber.sprite_index){
							case FatherHat_grab:
								//victima
								_victim.image_speed=0
								_victim.image_index=0
								_victim.sprite_index = _victim.animations.kdown.light
								_victim.image_xscale = _graber.image_xscale*-1
								_victim.x = _graber.x
								_victim.y = _graber.y + 24
								_graber.vely = 8
								_victim.depth = 0
								//agarrador
								_graber.sprite_index = FatherHat_a_trhow_1
								_graber.depth = -1
								if _victim.buffer.key == k_buffer.k_grab{
									_graber.sprite_index = _graber.animations.hitstun;
									_victim.sprite_index = _victim.animations.hitstun;
								}
								break;
							case FatherHat_a_trhow_1:
								var dmg = calc_damage(20)//20*_victim.scaling.dmg;
								var hts = 65 - _victim.stats.weight.hit_red;
								var kbck = 24; var angle = -45;
								//when the hit actually hits
								if (_victim.vely == 0){
									//current_attack = attacks.empty
									match_controller.hit_pause(dmg, hts, kbck)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.9
									_victim.scaling.kbck = _victim.scaling.kbck*1.1
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									//victim got out, now is grabber's turn
									_graber.sprite_index = FatherHat_a_trhow_2;
									_graber.attacks.empty.animation = FatherHat_a_trhow_2;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.normal_atack;
								}
								else{
									_victim.x = _graber.x
									_victim.y = _graber.y + 24
									_victim.vely = _graber.vely
									_victim.vely = _graber.vely
								}
								break;
							default:
								_victim.image_speed = 1;
								_graber.image_speed = 1;
								_graber.vely = -2;
								_victim.vely = -2;
								_graber.velx = -8*_graber.image_xscale;
								_victim.velx = -8*_victim.image_xscale;
								_victim.bars.HitstunBar.actual = 30;
								_graber.bars.HitstunBar.actual = 30;
								_graber.state = states.hitstun
								_victim.state = states.hitstun
								break;
								
						}
					},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : 0, // +3 pnts
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
			inspiration: 5,
			charge: false,
		}
	},
	
	n_n_spe : {
		animation: FatherHat_nnspecial, //13 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 10,
				hbox: { hitspark: hitspark_normal,
					spr : Father_pry_nspecial,
					scale_x : 1,
					scale_y : 1,
					duration : 60, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (3*2), // -6 pnts
					bloc : blc_types.pry,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +48,
						posy : -48,
					},
					kback : {
						strength : (2*4), // +1 pnts
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
			inspiration: 15,
			charge: false,
		}
	},
	
	a_n_spe : {
		animation: FatherHat_anspecial, //13 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 10,
				hbox: { hitspark: hitspark_normal,
					spr : Father_pry_nspecial,
					scale_x : 1,
					scale_y : 1,
					duration : 60, // -2 pnts
					dmg : (6*2), // -6 pnts
					hts : 9 + (3*2), // -6 pnts
					bloc : blc_types.pry,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +48,
						posy : 0,
					},
					kback : {
						strength : (2*4), // +1 pnts
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
						vely : 4,
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
		helper: {
			frame: -1,
			object: noone
		},
		install: noone,
		prots : [
		],
		movements: [
			{
				start: 0,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 10,
				x_speed: 0,
				y_speed: grav_1 * -1,
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
	
	n_u_spe : {
		animation: FatherHat_nu_special, //18 frames total
		lnd_strng: 4,
		hboxs: [
			//hit 1
			{
				create : 4,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 1.5,
					duration : 2, // -2 pnts
					dmg : (18*2), // -6 pnts
					hts : 26 + (20*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : -32,
					},
					kback : {
						strength : (3*4)*2, // +1 pnts
						angle : 60, //counter-clock
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
		install: noone,
		prots : [
			{
				start: 1,
				type: protections.grab_invul,
				finish: 20,
			}
		],
		movements: [
			{
				start: 1,
				x_speed: 2,
				y_speed: -18.6,
			}
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
	
	a_u_spe : {
		animation: FatherHat_nu_special, //18 frames total
		lnd_strng: 4,
		hboxs: [
			//hit 1
			{
				create : 4,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 2,
					scale_y : 1.5,
					duration : 2, // -2 pnts
					dmg : (18*2), // -6 pnts
					hts : 26 + (20*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +0,
						posy : -32,
					},
					kback : {
						strength : (3*4)*2, // +1 pnts
						angle : 60, //counter-clock
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
		install: noone,
		prots : [
			{
				start: 1,
				type: protections.grab_invul,
				finish: 20,
			}
		],
		movements: [
			{
				start: 1,
				x_speed: 2,
				y_speed: -18.6,
			}
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
	
	n_f_spe : {
		animation: FatherHat_nf_special,
		lnd_strng: -1,
		hboxs: [
			//hit 2 -> 13 pnts
			{
				create : 13,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 10, // -2 pnts
					dmg : (12*4/3), // - pnts
					hts : 11 + (4*4/3), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : true,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : (12*2)*4/3, // +3 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 45,
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
				x_speed: 23.3,
				y_speed: 0,
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
	
	a_f_spe : {
		animation: FatherHat_nf_special,
		lnd_strng: -1,
		hboxs: [
			//hit 2 -> 13 pnts
			{
				create : 13,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1.5,
					scale_y : 1,
					duration : 10, // -2 pnts
					dmg : (12*4/3), // - pnts
					hts : 11 + (4*4/3), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : true,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : (12*2)*4/3, // +3 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 45,
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
		follow_ups: [
		],
		effects : [
		],
		cost :{
			inspiration: 15,
			charge: false,
		}
	},
	
	n_d_spe : {
		animation: FatherHat_ndspecial1, //13 frames total
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
		animation: FatherHat_ndspecial1, //13 frames total
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
	
	n_fd_spe : {
		animation: FatherHat_nfdspecial, //18 frames total
		lnd_strng: -1,
		hboxs: [
			//hit 1
			{
				create : 9,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 0.5,
					duration : 12, // -2 pnts
					dmg : ((16/4)*2), // -6 pnts
					hts : 17 + (18*2), // -6 pnts
					bloc : blc_types.low,//-10/4
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +16,
						posy : 0,
					},
					kback : {
						strength : (3*4)*2, // +1 pnts
						angle : 0, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 10,
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
				start: 5,
				type: protections.proy_invul,
				finish: 19,
			}
		],
		movements: [
			{
				start: 9,
				x_speed: 14.4,
				y_speed: 0,
			},
			{
				start: 10,
				x_speed: 14.4,
				y_speed: 0,
			},
			{
				start: 11,
				x_speed: 14.4,
				y_speed: 0,
			},
			{
				start: 12,
				x_speed: 14.4,
				y_speed: 0,
			},
			{
				start: 13,
				x_speed: 14.4,
				y_speed: 0,
			},
			{
				start: 14,
				x_speed: 14.4,
				y_speed: 0,
			},
			{
				start: 15,
				x_speed: 14.4,
				y_speed: 0,
			},
			{
				start: 16,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 16,
				x_speed: 33.9,
				y_speed: 0,
			}
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
	
	a_fd_spe : {
		animation:	FatherHat_afdspecial, //23 frames total
		lnd_strng: 3,
		hboxs: [
			//hit 1 -> 10 pnts
			{
				create : 8,
				hbox: { hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 1,
					scale_y : 1,
					duration : 10, // -2 pnts
					dmg : (8*2), // -6 pnts
					hts : 9 + (10*2), // -6 pnts
					bloc : blc_types.mid,//0
					reflect : false,
					grb_script : function (_graber,_victim){},
					rel_pos : {
						posx : +24,
						posy : +24,
					},
					kback : {
						strength : (3*4)*2, // +1 pnts
						angle : -45, //counter-clock
					},
					stt_effects : {
						burn : 0,
						paralysis : 0,
						cold : 10,
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
				start: 2,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 3,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 4,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 5,
				x_speed: 0,
				y_speed: 0,
			},
			{
				start: 8,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 9,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 10,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 11,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 12,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 13,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 14,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 15,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 16,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 17,
				x_speed: 14.4,
				y_speed: 14.4,
			},
			{
				start: 18,
				x_speed: 14.4,
				y_speed: 14.4,
			}
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
	
	n_fu_spe : {
		animation: FatherHat_nfu_special, //18 frames total
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
				start: 5,
				type: protections.armor,
				finish: 23,
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
	
	a_fu_spe : {
		animation: FatherHat_nfu_special, //18 frames total
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
				start: 5,
				type: protections.armor,
				finish: 23,
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
},
}
install_super.attacks.dash_attack = install_super.attacks.f_tilt;
uninstall_super.attacks.dash_attack = uninstall_super.attacks.f_tilt;
uninstall_super.attacks.d_spe2 = {
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
uninstall_super.attacks.u_tilt.follow_ups[0] = {
	frame : 9,
	action : inputs.k_atk, // dejar presionado atk
	follow: uninstall_super.attacks.fu_tilt,
}
uninstall_super.attacks.n_f_spe.follow_ups = [
{
	frame : 22,
	action : inputs.k_down, // dejar presionado atk
	follow: uninstall_super.attacks.n_fd_spe,
},
{
	frame : 22,
	action : inputs.k_up, // dejar presionado atk
	follow: uninstall_super.attacks.n_fu_spe,
}
]
uninstall_super.attacks.n_d_spe.follow_ups[0] = {
	frame : 10,
	action : inputs.k_spe, // dejar presionado atk
	follow: uninstall_super.attacks.d_spe2,
}
uninstall_super.attacks.a_d_spe.follow_ups[0] = {
	frame : 10,
	action : inputs.k_spe, // dejar presionado spe
	follow: uninstall_super.attacks.d_spe2,
}
install_super.attacks.d_spe2 = {
		animation: FatherHat_ndspecial2, //13 frames total
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
install_super.attacks.u_tilt.follow_ups[0] = {
	frame : 9,
	action : inputs.k_atk, // dejar presionado atk
	follow: install_super.attacks.fu_tilt,
}
install_super.attacks.n_f_spe.follow_ups = [
{
	frame : 22,
	action : inputs.k_down, // dejar presionado atk
	follow: install_super.attacks.n_fd_spe,
},
{
	frame : 22,
	action : inputs.k_up, // dejar presionado atk
	follow: install_super.attacks.n_fu_spe,
}
]
uninstall_super.attacks.n_d_spe.follow_ups[0] = {
	frame : 10,
	action : inputs.k_spe, // dejar presionado atk
	follow: install_super.attacks.d_spe2,
}
uninstall_super.attacks.a_d_spe.follow_ups[0] = {
	frame : 10,
	action : inputs.k_spe, // dejar presionado spe
	follow: install_super.attacks.d_spe2,
}
uninstall_super.attacks.super_n = {
		animation: Father_Super_I, //13 frames total
		lnd_strng: -1,
		hboxs: [],
		helper: {
			frame: -1,
			object: noone
		},
		install: {
			start : 5,
			new_moveset : install_super,
		},
		prots : [],
		movements: [],
		follow_ups: [],
		effects : [
		],
		cost :{
			inspiration: 40,
			charge: false,
		}
}
uninstall_super.attacks.super_a = {
		animation: Father_Super_I, //13 frames total
		lnd_strng: -1,
		hboxs: [],
		helper: {
			frame: -1,
			object: noone
		},
		install: {
			start : 5,
			new_moveset : install_super,
		},
		prots : [],
		movements: [],
		follow_ups: [],
		effects : [
		],
		cost :{
			inspiration: 40,
			charge: false,
		}
}
install_super.attacks.super_n = {
		animation: FatherHat_Super_I, //13 frames total
		lnd_strng: -1,
		hboxs: [],
		helper: {
			frame: -1,
			object: noone
		},
		install: {
			start : 5,
			new_moveset : uninstall_super,
		},
		prots : [],
		movements: [],
		follow_ups: [],
		effects : [
			{
				frame : 5,
				regenerate : 10,
				passion: 10,
				berserker: 10,
			}
		],
		cost :{
			inspiration: 40,
			charge: false,
		}
}
install_super.attacks.super_a = {
		animation: FatherHat_Super_I, //13 frames total
		lnd_strng: -1,
		hboxs: [],
		helper: {
			frame: -1,
			object: noone
		},
		install: {
			start : 5,
			new_moveset : uninstall_super,
		},
		prots : [],
		movements: [],
		follow_ups: [],
		effects : [
			{
				frame : 5,
				regenerate : 10,
				passion: 10,
				berserker: 10,
			}
		],
		cost :{
			inspiration: 40,
			charge: false,
		}
}
attacks.super_n = {
		animation: Father_Super_I, //13 frames total
		lnd_strng: -1,
		hboxs: [],
		helper: {
			frame: -1,
			object: noone
		},
		install: {
			start : 5,
			new_moveset : install_super,
		},
		prots : [],
		movements: [],
		follow_ups: [],
		effects : [
		],
		cost :{
			inspiration: 40,
			charge: false,
		}
}
attacks.super_a = {
		animation: Father_Super_I, //13 frames total
		lnd_strng: -1,
		hboxs: [],
		helper: {
			frame: -1,
			object: noone
		},
		install: {
			start : 5,
			new_moveset : install_super,
		},
		prots : [],
		movements: [],
		follow_ups: [],
		effects : [
		],
		cost :{
			inspiration: 40,
			charge: false,
		}
}

#endregion
		}
			break;
		case 2:
		with(_obj){
			super_func = function (){
				//verificar startup super II
				if (self.sprite_index == Father_Super_II_2 and self.image_index == 1){
					match_controller.cutscene(Father_Cutscene_Super_I);
					self.image_index ++;
				}
				else{
					cancel = false;
				}
			}
			#region SUPER II
attacks.super_n = {
		animation: Father_Super_II_1, //13 frames total
		lnd_strng: -1,
		hboxs: [
		//hit 1 -> 10 pnts
			{
				create : 6,
				hbox: {
					hitspark: hitspark_normal,
					spr : hitbox_spr,
					scale_x : 0.5,
					scale_y : 1,
					duration : 54, // -2 pnts
					dmg : 0, // - pnts
					hts : 0, // -6 pnts
					bloc : blc_types.grb,//0
					reflect : false,
					grb_script : function (_graber,_victim){
						_victim.vely = _graber.vely;
						switch(_graber.sprite_index){
							case Father_Super_II_1:
								//victima
								_victim.image_index=0
								_victim.sprite_index = _victim.animations.thumble
								_victim.image_xscale = _graber.image_xscale*-1
								_victim.x = _graber.x + _graber.image_xscale * 24
								_victim.y = _graber.y
								_graber.vely = 0
								_victim.depth = 0
								//agarrador
								_graber.sprite_index = Father_Super_II_2
								_graber.depth = -1
								break;
							case Father_Super_II_2:
								_graber.super_func();
								var dmg = calc_damage(200)//200*_victim.scaling.dmg;
								var hts = 65 - _victim.stats.weight.hit_red;
								var kbck = 32; var angle = 30;
								//when the hit actually hits
								if (_graber.image_index == _graber.image_number - 2){
									//current_attack = attacks.empty
									match_controller.hit_pause(dmg, hts, kbck)
									if (hts >= 0 ){
										_victim.bars.HitstunBar.actual += hts
									}
									_victim.bars.HealthBar.actual -= dmg
									_victim.sprite_index = _victim.animations.hitstun;
									_victim.delay_kback.angle = angle;
									_victim.delay_kback.strength = kbck;
									_victim.delay_kback.other_dir = _graber.image_xscale;
									_victim.alarm[0] = 1;
									_victim.scaling.dmg = _victim.scaling.dmg*0.9
									_victim.scaling.kbck = _victim.scaling.kbck*1.1
									_victim.scaling.combo ++;
									_victim.scaling.enemy = _graber
									//victim got out, now is grabber's turn
									_graber.sprite_index = Father_Super_II_3;
									_graber.attacks.empty.animation = Father_Super_II_3;
									_graber.current_attack = _graber.attacks.empty;
									_victim.state = states.hitstun
									_graber.state = states.normal_atack;
								}
								else{
									_victim.x = _graber.x + _graber.image_xscale * 24
									_victim.y = _graber.y
									_victim.sprite_index = _victim.animations.thumble;
								}
								break;
							default:
								_victim.image_speed = 1;
								_graber.image_speed = 1;
								_graber.vely = -2;
								_victim.vely = -2;
								_graber.velx = -8*_graber.image_xscale;
								_victim.velx = -8*_victim.image_xscale;
								_victim.bars.HitstunBar.actual = 30;
								_graber.bars.HitstunBar.actual = 30;
								_graber.state = states.hitstun
								_victim.state = states.hitstun
								break;
								
						}
					},
					rel_pos : {
						posx : +24,
						posy : -24,
					},
					kback : {
						strength : 0, // +3 pnts
						angle : 0, //counter-clock
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
		prots : [],
		movements: [
		{
			start: 1,
			x_speed: 0,
			y_speed: 0,
		}
		],
		follow_ups: [],
		effects : [
		],
		cost :{
			inspiration: 40,
			charge: false,
		}
};

for (var i = 6; i < 55; i += 1){
	array_push(
	attacks.super_n.movements,
	{
		start: i,
		x_speed: 2.5,
		y_speed: 0,
	}
	);
}

attacks.super_a = attacks.super_n;

#endregion
		}
			break;
		case 3:
		with(_obj){
			super_func = function (){
				if (self.image_index == 3){
					match_controller.cutscene(Father_Cutscene_Super_I);
					self.image_index ++;
				}
			}
			#region SUPER III

attacks.super_n = {
		animation: Father_Super_I, //13 frames total
		lnd_strng: -1,
		hboxs: [],
		helper: {
			frame: 3,
			object: Smn_father,
		},
		install: noone,
		prots : [],
		movements: [],
		follow_ups: [],
		effects : [
		],
		cost :{
			inspiration: 40,
			charge: false,
		}
};

attacks.super_a = attacks.super_n;

#endregion
		}
			break;
	}
}

//the thingy of pallete

pallete = Crinsom_color_palette;



