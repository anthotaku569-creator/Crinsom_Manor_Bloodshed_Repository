/// @description Insert description here
// You can write your code in this editor
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

if wich_player == 1 {
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
	sprite_index = Spr_cursor1
}
if wich_player == 2 {
	inputs = {
	k_right: "right_p2",
	k_left : "left_p2",
	k_up: "up_p2",
	k_down: "down_p2",
	k_jmp: "jmp_p2",
	k_atk: "atk_p2",
	k_spe: "spe_p2",
	k_blc: "blc_p2",
	k_grb: "grb_p2",
	k_pause: "pause_p2"
}
	sprite_index = Spr_cursor2
}
/*
//step 1
character_selected = noone;
banner = noone;
idle = noone;
//step 2
super_selected = -1;
super_names = []
super_function = function (select, _obj){}
//step 3
color_selected = -1;
color_cursor = 1;
pallete = noone;
smol = noone;
name = ""
*/


stg_selected = noone;
stg_name = "";
stg_banner = noone;
