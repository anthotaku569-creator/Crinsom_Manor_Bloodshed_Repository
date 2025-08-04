/// @description Insert description here
// You can write your code in this editor
if character_selected != noone{
gpu_set_blendmode_ext(bm_dest_colour, bm_inv_src_alpha);
draw_sprite(marker_selector,0,x,y)
gpu_set_blendmode(bm_normal);
	if wich_player == 1{
		
		draw_sprite_ext(banner,0,0,0,1,1,0,c_white,0.75);
		pal_swap_set(pallete,color_cursor,false);
		draw_sprite_ext(idle,0,112,344,1,1,0,c_white,1);
		pal_swap_reset();
		if color_selected == -1 {
			draw_set_font(global.bitmap_digits)
			draw_sprite_ext(Spr_Sticky_color,0,96,384 + 32,1,1,0,c_white,1);
			draw_set_halign(fa_center);
			draw_text_ext_transformed(96,364 + 32,string(color_cursor - 1),4,120,2,2,5);
		}
		
		draw_set_halign(fa_left);
		draw_set_font(global.bitmap_font2_outline);
		draw_text_transformed(0+8,344-16, name, 2, 2, 0);
	}
	else{
		
		draw_sprite_ext(banner,0,640,0,-1,1,0,c_white,0.75);
		pal_swap_set(pallete,color_cursor,false);
		draw_sprite_ext(idle,0,528,344,-1,1,0,c_white,1);
		pal_swap_reset();
		if color_selected == -1 {
			draw_set_font(global.bitmap_digits)
			draw_sprite_ext(Spr_Sticky_color,0,544,384 + 32,1,1,0,c_white,1);
			draw_set_halign(fa_center);
			draw_text_ext_transformed(544,364 + 32,string(color_cursor - 1),0,96,2,2,5);
		}
		
		draw_set_halign(fa_right);
		draw_set_font(global.bitmap_font2_outline);
		draw_text_transformed(640-8,344-16, name, 2, 2, 0);
	}
}

draw_self();