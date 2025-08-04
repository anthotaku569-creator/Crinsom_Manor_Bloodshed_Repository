/// @description Insert description here
// You can write your code in this editor


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


function move_cursor(){
	if input_check_pressed(inputs.k_right,wich_player){
		if x < xstart + 96{
			x +=48
		}
	}
	if input_check_pressed(inputs.k_left,wich_player){
		if x > xstart - 96{
			x -=48
		}
	}

	if input_check_pressed(inputs.k_down,wich_player){
		if y < ystart + 96{
			y +=48
		}
	}
	if input_check_pressed(inputs.k_up,wich_player){
		if y > ystart - 96{
			y -=48
		}
	}
}

if stg_selected == noone{
	move_cursor();
}
else{
	if input_check_pressed(inputs.k_spe,wich_player){
		stg_selected = noone
	}
}


/*
if character_selected == noone{
	#region character selection phase
	move_cursor();
	#endregion
}
else if super_selected == -1 {
	#region character selection phase
		
		select_super(wich_player)
		if input_check_pressed(inputs.k_spe,wich_player){
			character_selected = noone;
		}
	#endregion
}
else if color_selected == -1 {
	#region color selection phase
	if input_check_pressed(inputs.k_down,wich_player){
		if color_cursor < sprite_get_width(pallete) - 1{
			color_cursor ++
		}
	}
	if input_check_pressed(inputs.k_up,wich_player){
		if color_cursor > 1{
			color_cursor --
		}
	}
	if input_check_pressed(inputs.k_atk,wich_player){
		 color_selected = color_cursor;
		 if wich_player == 1{
			 global.player_one_selection.character = character_selected;
			 global.player_one_selection.color_i = color_selected;
			 global.player_one_selection.super = super_function;
			 global.player_one_selection.select = super_selected;
			 global.player_one_selection.done = true;
			 global.player_one_selection.smol = smol;
		 }
		 else{
			 global.player_two_selection.character = character_selected;
			 global.player_two_selection.color_i = color_selected;
			 global.player_two_selection.super = super_function;
			 global.player_two_selection.select = super_selected;
			 global.player_two_selection.done = true;
			 global.player_two_selection.smol = smol;
		 }
	}
	if input_check_pressed(inputs.k_spe,wich_player){
		super_selected = -1 ;
	}
	#endregion
}
else{
	if input_check_pressed(inputs.k_spe,wich_player){
		color_selected = -1 ;
		if wich_player == 1{ 
			global.player_one_selection = {
				character : noone,
				color_i : 0,
				super : function (select, _obj) {},
				select : 0,
				done : false,
				smol : noone,
			}
		 }
		 else{
			global.player_two_selection = {
				character : noone,
				color_i : 0,
				super : function (select, _obj) {},
				select : 0,
				done : false,
				smol : noone,
			}
		 }
	}
	if global.player_one_selection.done and global.player_two_selection.done {
		room_goto(StageSelect);
	}
}
*/