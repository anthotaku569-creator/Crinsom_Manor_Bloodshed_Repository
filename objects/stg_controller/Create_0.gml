/// @description Insert description here
// You can write your code in this editor


if global.training_mode == true{
	stg_cursor_p1 = instance_create_depth(296,200,-1,obj_cursor_stg);
	stg_cursor_p1.wich_player = 1;
}
else{
	stg_cursor_p1 = instance_create_depth(296,200,-1,obj_cursor_stg);
	stg_cursor_p2 = instance_create_depth(296,200,-1,obj_cursor_stg);

	stg_cursor_p1.wich_player = 1;
	stg_cursor_p2.wich_player = 2;
}
