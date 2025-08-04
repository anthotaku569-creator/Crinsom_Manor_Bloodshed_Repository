/// @description Insert description here
// You can write your code in this editor

// https://offalynne.github.io/Input/#/4.2/Quick-Start-Guide

//Inputs default player 1

randomise();

global.pause_sprite = noone;
	
global.retro_pal_swapper = {
  	shader: noone,
  	html5: false,
  	html5_sprite: noone,
  	html5_surface: noone,
  	texel_size: [0],
  	uvs: [0],
  	index: [0],
  	texture: [0],
  	layer_priority: 0,
  	layer_temp_priority: 0,
  	layer_map: 0,
	
  	cleanup: function() {
  		ds_priority_destroy(layer_priority);
  		ds_priority_destroy(layer_temp_priority);
  		ds_map_destroy(layer_map);
  	}
  };

input_default_key(ord("D"),  "right_p1");
input_default_key(ord("A"),  "left_p1");
input_default_key(ord("W"),  "up_p1");
input_default_key(ord("S"),  "down_p1");
input_default_key(ord("U"),  "L_p1");
input_default_key(ord("I"),  "M_p1");
input_default_key(ord("O"),  "H_p1");
input_default_key(ord("J"),  "S1_p1");
input_default_key(ord("K"),  "S2_p1");
input_default_key(ord("L"),  "S3_p1");
//input_default_key(ord("I"),  "spe_p1");
input_default_key(vk_enter,  "pause_p1");

input_default_gamepad_axis(gp_axislh, false, "right_p1");
input_default_gamepad_axis(gp_axislh, true, "left_p1");
input_default_gamepad_axis(gp_axislv, true, "up_p1");
input_default_gamepad_axis(gp_axislv, false, "down_p1");
input_default_gamepad_button(gp_face1,  "L_p1");
//input_default_gamepad_button(gp_face2,  "spe_p1");
input_default_gamepad_button(gp_face2,  "M_p1");
input_default_gamepad_button(gp_face3,  "H_p1");
input_default_gamepad_button(gp_face4,  "S1_p1");
input_default_gamepad_button(gp_shoulderl,  "S2_p1");
input_default_gamepad_button(gp_shoulderlb,  "S3_p1");
input_default_gamepad_button(gp_shoulderr,  "pause_p1");

//Inputs default player 2

input_default_key(vk_right,  "right_p2");
input_default_key(vk_left,  "left_p2");
input_default_key(vk_up,  "up_p2");
input_default_key(vk_down,  "down_p2");
input_default_key(vk_numpad4,  "L_p2");
//input_default_key(vk_numpad2,  "spe_p2");
input_default_key(vk_numpad5,  "M_p2");
input_default_key(vk_numpad6,  "H_p2");
input_default_key(vk_numpad1,  "S1_p2");
input_default_key(vk_numpad2,  "S2_p2");
input_default_key(vk_numpad3,  "S3_p2");
input_default_key(vk_numpad9,"pause_p2");

input_default_gamepad_axis(gp_axislh, false, "right_p2");
input_default_gamepad_axis(gp_axislh, true, "left_p2");
input_default_gamepad_axis(gp_axislv, true, "up_p2");
input_default_gamepad_axis(gp_axislv, false, "down_p2");
input_default_gamepad_button(gp_face1,  "L_p2");
//input_default_gamepad_button(gp_face2,  "spe_p2");
input_default_gamepad_button(gp_face2,  "M_p2");
input_default_gamepad_button(gp_face3,  "H_p2");
input_default_gamepad_button(gp_face4,  "S1_p2");
input_default_gamepad_button(gp_shoulderl,  "S2_p2");
input_default_gamepad_button(gp_shoulderlb,  "S3_p2");
input_default_gamepad_button(gp_shoulderr,  "pause_p2");

//input_player_gamepad_set(0, 1);
//input_player_gamepad_set(0, 2);
input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE, 1);
input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE, 2);

//input definition
/*
global.inputs_p1 = {
	k_right: def_right_p1,
	k_left : def_left_p1,
	k_up: def_up_p1,
	k_down: def_down_p1,
	k_jmp: def_jmp_p1,
	k_L: def_L_p1,
	k_spe: def_spe_p1,
	k_blc: def_blc_p1,
	k_grb: def_grb_p1,
	k_pause: def_pause_p1
}
global.inputs_p2 = {
	k_right: def_right_p2,
	k_left : def_left_p2,
	k_up: def_up_p2,
	k_down: def_down_p2,
	k_jmp: def_jmp_p2,
	k_L: def_L_p2,
	k_spe: def_spe_p2,
	k_blc: def_blc_p2,
	k_grb: def_grb_p2,
	k_pause: def_pause_p2
}
*/
global.inputs_p1 = {
	k_right:	"right_p1",
	k_left :	"left_p1",
	k_up:		"up_p1",
	k_down:		"down_p1",
	k_L:		"L_p1",
	k_M:		"M_p1",
	k_H:		"H_p1",
	k_S1:		"S1_p1",
	k_S2:		"S2_p1",
	k_S3:		"S3_p1",
	k_pause:	"pause_p1"
}

global.inputs_p2 = {
	k_right:	"right_p2",
	k_left :	"left_p2",
	k_up:		"up_p2",
	k_down:		"down_p2",
	k_L:		"L_p2",
	k_M:		"M_p2",
	k_H:		"H_p2",
	k_S1:		"S1_p2",
	k_S2:		"S2_p2",
	k_S3:		"S3_p2",
	k_pause:	"pause_p2"
}

global.player_one_selection = {
	character : noone,
	color_i : 0,
	super : function (select, _obj) {},
	select : 0,
	done : false,
	smol : noone,
}

global.player_two_selection = {
	character : noone,
	color_i : 0,
	super : function (select, _obj) {},
	select : 0,
	done : false,
	smol : noone,
}

global.training_mode = false;

pal_swap_init_system();

Scr_fonts();



