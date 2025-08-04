/// @description Insert description here
// You can write your code in this editor


if (bloc = blc_types.pry){
	pal_swap_set(pallete.sprite,pallete.i,false);
	draw_self();
	pal_swap_reset();
}


if global.training_mode == true{
	if (bloc == blc_types.push) {
	draw_set_alpha(0.25)
	draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_green, c_green, c_green, c_green, false)
	draw_set_alpha(1)
	}
	else{
	draw_set_alpha(1)
	draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red, c_red, c_red, c_red, true)
	}
	draw_self();
}