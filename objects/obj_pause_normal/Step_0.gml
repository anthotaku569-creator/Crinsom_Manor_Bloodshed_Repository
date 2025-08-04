/// @description Insert description here
// You can write your code in this editor

//Move cursor
if input_check_pressed("up_p1", 1) and selection_p1.cursor > 0{
	selection_p1.cursor--;
}
if input_check_pressed("down_p1", 1) and selection_p1.cursor < 3{
	selection_p1.cursor++;
}

if input_check_pressed("up_p2", 2) and selection_p2.cursor > 0{
	selection_p2.cursor--;
}
if input_check_pressed("down_p2", 2) and selection_p2.cursor < 3{
	selection_p2.cursor++;
}



if input_check_pressed("L_p1", 1, 2){
	selection_p1.selected = selection_p1.cursor;
}
if input_check_pressed("L_p2", 2, 2){
	selection_p2.selected = selection_p2.cursor;
}


//Selection choosing

if selection_p1.selected != -1 and selection_p2.selected != -1{
	final_select = min(selection_p1.selected, selection_p2.selected)
}
if final_select != -1 {
	switch(final_select){
		case 3:
			if instance_exists(match_controller){
				with(match_controller){
					instance_activate_all();
					timer_activ = true;
					instance_destroy(obj_pause_normal);
				}
			}
			break;
		case 2:
			room_goto(StageSelect);
			break;
		case 1:
			global.player_one_selection = {
				character : noone,
				color : 0,
				super : function (select, _obj) {},
				select : 0,
				done : false,
			}
			global.player_two_selection = {
				character : noone,
				color : 0,
				super : function (select, _obj) {},
				select : 0,
				done : false,
			}
			room_goto(CharSelect)
			break;
		case 0:
			global.player_one_selection = {
				character : noone,
				color : 0,
				super : function (select, _obj) {},
				select : 0,
				done : false,
			}
			global.player_two_selection = {
				character : noone,
				color : 0,
				super : function (select, _obj) {},
				select : 0,
				done : false,
			}
			room_goto(Menu_1)
			break;
	}
}