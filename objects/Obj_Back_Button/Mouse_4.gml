/// @description Insert description here
// You can write your code in this editor

switch(room){
	case CharSelect:
	case CharSelect_training:
	case Control_Config_Menu:
		room_goto(Menu_1);
		global.training_mode = false;
		break;
	case StageSelect:
		room_goto(CharSelect);
		break;
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