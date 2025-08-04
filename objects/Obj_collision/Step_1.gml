/// @description Insert description here
// You can write your code in this editor

function get_CharHeight(){
	var height = abs(char_bounded.bbox_top - char_bounded.bbox_bottom);
	return height/48;
}

x = char_bounded.x;
y = char_bounded.y + 1;
image_yscale = get_CharHeight();
image_xscale = 0.5;
