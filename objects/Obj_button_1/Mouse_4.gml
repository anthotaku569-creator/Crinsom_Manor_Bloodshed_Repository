/// @description Insert description here
// You can write your code in this editor

switch(sprite_index){
	case Spr_Button_Local:
		global.training_mode = false;
		room_goto(CharSelect); break;
	case Spr_Button_Solo:
		global.training_mode = true;
		room_goto(CharSelect_training); break;
	case Spr_Button_Configuration:
		room_goto(Control_Config_Menu); break;
}
