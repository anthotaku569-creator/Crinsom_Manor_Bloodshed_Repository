/// @description Insert description here
// You can write your code in this editor
function move_cursor(){
	if input_check_pressed(inputs.k_right,1){
		if x < xstart + 96{
			x +=48
		}
	}
	if input_check_pressed(inputs.k_left,1){
		if x > xstart - 96{
			x -=48
		}
	}

	if input_check_pressed(inputs.k_down,1){
		if y < ystart + 96{
			y +=48
		}
	}
	if input_check_pressed(inputs.k_up,1){
		if y > ystart - 96{
			y -=48
		}
	}
}

function select_super(_player){
	if _player == 1{
		if input_check_pressed(inputs.k_right,1){
			char[0].super_selected = 1;
		}
		if input_check_pressed(inputs.k_down,1){
			char[0].super_selected = 2;
		}
		if input_check_pressed(inputs.k_left,1){
			char[0].super_selected = 3;
		}
	}
	else{
		if input_check_pressed(inputs.k_right,1){
			char[1].super_selected = 3;
		}
		if input_check_pressed(inputs.k_down,1){
			char[1].super_selected = 2;
		}
		if input_check_pressed(inputs.k_left,1){
			char[1].super_selected = 1;
		}
	}
}

if char[wich_player - 1].character_selected == noone{
	#region character selection phase
	move_cursor();
	if wich_player == 2 and input_check_pressed(inputs.k_M,1){
		wich_player = 1
		select1_x = -100
		select1_y = -100
		global.player_one_selection.done = false;
		char[0].color_selected = -1 ;
	}
	/*if input_check_pressed(inputs.k_blc) {
	}*/
	#endregion
}
else if char[wich_player - 1].color_selected == -1 {
	#region color selection phase
	if input_check_pressed(inputs.k_down,1){
		if char[wich_player - 1].color_cursor < sprite_get_width(char[wich_player - 1].pallete) - 1{
			char[wich_player - 1].color_cursor ++
		}
	}
	if input_check_pressed(inputs.k_up,1){
		if char[wich_player - 1].color_cursor > 1{
			char[wich_player - 1].color_cursor --
		}
	}
	if input_check_pressed(inputs.k_L,1){
		 char[wich_player - 1].color_selected = char[wich_player - 1].color_cursor;
		 if wich_player == 1{
			 global.player_one_selection.character =  char[0].character_selected;
			 global.player_one_selection.color_i =  char[0].color_selected;
			 global.player_one_selection.super =  char[0].super_function;
			 global.player_one_selection.select =  char[0].super_selected;
			 global.player_one_selection.done = true;
			 global.player_one_selection.smol =  char[0].smol;
		 }
		 else{
			 global.player_two_selection.character = char[1].character_selected;
			 global.player_two_selection.color_i = char[1].color_selected;
			 global.player_two_selection.super = char[1].super_function;
			 global.player_two_selection.select = char[1].super_selected;
			 global.player_two_selection.done = true;
			 global.player_two_selection.smol = char[1].smol;
		 }
	}
	if input_check_pressed(inputs.k_M,1){
		char[wich_player - 1].super_selected = -1 ;
	}
	#endregion
}
else{
	if input_check_pressed(inputs.k_M,1){
		char[wich_player - 1].color_selected = -1 ;
		if wich_player == 1 { 
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
	if global.player_one_selection.done {
		if global.player_two_selection.done {
			//room_goto(StageSelect);
			room_goto(Stg_1);
		}
		else{
			select1_x = x;
			select1_y = y;
			wich_player = 2;		
		}
	}
}



if wich_player == 1 {
	sprite_index = Spr_cursor1
}
if wich_player == 2 {
	sprite_index = Spr_cursor2
}