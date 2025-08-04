/// @description Insert description here
// You can write your code in this editor

if input_check_pressed(inputs.k_L, 1) and char[wich_player - 1].character_selected == noone{
	char[wich_player - 1].character_selected = other.char;
	char[wich_player - 1].banner = other.banner;
	char[wich_player - 1].idle = other.idle;
	char[wich_player - 1].pallete = other.pallete;
	char[wich_player - 1].super_names = other.super_names;
	char[wich_player - 1].super_function = other.super_function;
	char[wich_player - 1].smol = other.sprite_index;
	char[wich_player - 1].name = other.name;
}