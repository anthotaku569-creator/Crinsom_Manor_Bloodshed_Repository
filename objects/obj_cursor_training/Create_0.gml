/// @description Insert description here
// You can write your code in this editor
inputs = {
	k_right: "right_p1",
	k_left : "left_p1",
	k_up: "up_p1",
	k_down: "down_p1",
	k_L: "L_p1",
	k_M: "M_p1",
	k_H: "H_p1",
	//k_spe: "spe_p1",
	k_pause: "pause_p1"
}

wich_player = 1;



char[0] = {
//step 1
character_selected : noone,
banner : noone,
idle : noone,
//step 2
super_selected : -1,
super_names : [],
super_function : function (select, _obj){},
//step 3
color_selected : -1,
color_cursor : 1,
pallete : noone,
smol : noone,
name : "",
}


char[1] = {
//step 1
character_selected : noone,
banner : noone,
idle : noone,
//step 2
super_selected : 2,
super_names : [],
super_function : function (select, _obj){},
//step 3
color_selected : -1,
color_cursor : 1,
pallete : noone,
smol : noone,
name : "",
}

select1_x = -100
select1_y = -100