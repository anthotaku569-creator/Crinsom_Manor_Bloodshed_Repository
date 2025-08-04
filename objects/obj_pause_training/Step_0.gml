/// @description Insert description here
// You can write your code in this editor



//Move cursor
if input_check_pressed("up_p1", 1){
	cursor--;
}
if input_check_pressed("down_p1", 1){
	cursor++;
}

if cursor >= max_options{
	cursor = max_options - 1;
}
if cursor < -1 {
	cursor = - 1;
}



if cursor == -1 {
	if input_check_pressed("left_p1", 1){
		if actual_menu_screen > 0 {
			actual_menu_screen--;
		}
	}
	if input_check_pressed("right_p1", 1){
		if actual_menu_screen < 3 {
			actual_menu_screen++;
		}
	}
	if actual_menu_screen > -1  and actual_menu_screen < 4 {
	max_options = array_length(options[actual_menu_screen]);
}
}
else{
	if input_check_pressed("L_p1", 1){
		selected = options[actual_menu_screen][cursor].name;
	}
}



//Selection choosing


switch(selected) {
	case "Exit":
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
		selected = "";
		break;
	case "Character Select":
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
		room_goto(CharSelect_training)
		selected = "";
		break;
	case "Stage Select":
		global.training_mode = true;
		room_goto(StageSelect);
		selected = "";
		break;
	case "Resume":
		if instance_exists(match_controller){
			with(match_controller){
				instance_activate_all();
				timer_activ = true;
				instance_destroy(obj_pause_training);
			}
		}
		selected = "";
		break;
	case "Recovery":
	case "Block":
	case "Block Stance":
	case "Grab parry":
	case "Inst. Recovery":
	case "Dir. Influence":
	case "Vel. Influence":
	case "Control":
		var choices = options[actual_menu_screen][cursor].slider;
		var choice_max = array_length(choices) - 1;
		var act_choice = ds_map_find_value(match_controller.training_settings, options[actual_menu_screen][cursor].name);
		if (act_choice<choice_max){
			match_controller.training_settings[? options[actual_menu_screen][cursor].name] += 1;
		}
		else{
			match_controller.training_settings[? options[actual_menu_screen][cursor].name] = 0;
		}
		selected = "";
		break;
	default:
		break;
}

/*
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
*/