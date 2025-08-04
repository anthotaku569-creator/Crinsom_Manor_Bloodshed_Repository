/// @description Insert description here
// You can write your code in this editor
/*
if character_selected != noone{
gpu_set_blendmode_ext(bm_dest_colour, bm_inv_src_alpha);
draw_sprite(marker_selector,0,x,y)
gpu_set_blendmode(bm_normal);
	if wich_player == 1{
		
		pal_swap_set(pallete,color_cursor,false);
		draw_sprite_ext(banner,0,0,0,1,1,0,c_white,0.75);
		draw_sprite_ext(idle,0,112,344,1,1,0,c_white,1);
		pal_swap_reset();
		if super_selected == -1 {
			draw_sprite_ext(Spr_Super_Selec,0,0,360,1,1,0,c_white,1);
			var sup_size = array_length(super_names);
			for (var i = 0; i < sup_size; i += 1){
				draw_set_halign(fa_left);
				draw_set_font(global.bitmap_font2)
				draw_text_ext_transformed(44,376 + (i * 32),string(super_names[i]),4,120,1.5,1.5,0);
			}
		}
		else if color_selected == -1 {
			draw_set_font(global.bitmap_digits)
			draw_sprite_ext(Spr_Sticky_color,0,96,384,1,1,0,c_white,1);
			draw_set_halign(fa_center);
			draw_text_ext_transformed(96,364,string(color_cursor - 1),4,120,2,2,5);
		}
		
		draw_set_halign(fa_left);
		draw_set_font(global.bitmap_font2_outline);
		draw_text_transformed(0+8,344-16, name, 2, 2, 0);
	}
	else{
		
		pal_swap_set(pallete,color_cursor,false);
		draw_sprite_ext(banner,0,640,0,-1,1,0,c_white,0.75);
		draw_sprite_ext(idle,0,528,344,-1,1,0,c_white,1);
		pal_swap_reset();
		if super_selected == -1 {
			draw_sprite_ext(Spr_Super_Selec,0,640,360,-1,1,0,c_white,1);
			var sup_size = array_length(super_names);
			for (var i = 0; i < sup_size; i += 1){
				draw_set_halign(fa_right);
				draw_set_font(global.bitmap_font2)
				draw_text_ext_transformed(596, 376 + (i * 32),string(super_names[i]),4,120,1.5,1.5,0);
			}
		}
		else if color_selected == -1 {
			draw_set_font(global.bitmap_digits)
			draw_sprite_ext(Spr_Sticky_color,0,544,384,1,1,0,c_white,1);
			draw_set_halign(fa_center);
			draw_text_ext_transformed(544,364,string(color_cursor - 1),0,96,2,2,5);
		}
		
		draw_set_halign(fa_right);
		draw_set_font(global.bitmap_font2_outline);
		draw_text_transformed(640-8,344-16, name, 2, 2, 0);
	}
}
*/

if stg_selected != noone{
	gpu_set_blendmode_ext(bm_dest_colour, bm_inv_src_alpha);
	draw_sprite(marker_selector,0,x,y)
	gpu_set_blendmode(bm_normal);
}
draw_set_font(global.bitmap_font2_outline);
if wich_player == 1{
	if stg_name != noone{
		draw_set_halign(fa_left);
		//draw_text_transformed(0+8,344-16, stg_name, 2, 2, 0);
		draw_text_transformed(16,204, stg_name, 1, 1, 0);
	}
	if stg_banner != noone{
		draw_sprite_ext(stg_banner,0,96,216,1,1,0,c_white,1);
	}
}
else{
	if stg_name != noone{
		draw_set_halign(fa_right);
		draw_text_transformed(640 - 16, 204, stg_name, 1, 1, 0);
	}
	if stg_banner != noone{
		draw_sprite_ext(stg_banner,0,552,216,-1,1,0,c_white,1);
	}
}


draw_self();