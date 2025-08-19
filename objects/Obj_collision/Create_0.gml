/// @description Insert description here
// You can write your code in this editor
char_bounded = noone;

function get_CharHeight(){
	var height = abs(char_bounded.bbox_top - char_bounded.bbox_bottom);
	return height/48;
}