/// @description Insert description here
// You can write your code in this editor

if global.training_mode == true{
	if stg_cursor_p1.stg_selected != noone {
		room_goto(stg_cursor_p1.stg_selected);
	}
}
else{
	if stg_cursor_p1.stg_selected != noone and stg_cursor_p2.stg_selected != noone {
		var stg_selected = choose(stg_cursor_p1.stg_selected, stg_cursor_p2.stg_selected);
		room_goto(stg_selected);
	}
}