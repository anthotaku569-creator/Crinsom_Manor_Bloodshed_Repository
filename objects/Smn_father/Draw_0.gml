/// @description Insert description here
// You can write your code in this editor
//draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_blue, c_blue, c_blue, c_blue, true)

draw_self()

if state = states.run{
	draw_sprite_ext(sprite_index,image_index,xprevious,yprevious,image_xscale,image_yscale,image_angle,c_white,0.5);
	draw_sprite_ext(sprite_index,image_index,xprevious - velx,yprevious - vely,image_xscale,image_yscale,image_angle,c_white,0.25);
}

switch(prot){
	case protections.full:
		image_alpha = 0.5
		break;
	default:
		image_alpha = 1
		break;
}