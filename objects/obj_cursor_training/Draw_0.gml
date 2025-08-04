/// @description Insert description here
// You can write your code in this editor


draw_sprite(Spr_cursor1, 0, select1_x, select1_y)

gpu_set_blendmode_ext(bm_dest_colour, bm_inv_src_alpha);
draw_sprite(marker_selector,0,select1_x,select1_y)
gpu_set_blendmode(bm_normal);


if char[0].character_selected != noone {
if char[wich_player - 1].character_selected != noone{
	gpu_set_blendmode_ext(bm_dest_colour, bm_inv_src_alpha);
	draw_sprite(marker_selector,0,x,y)
}
gpu_set_blendmode(bm_normal);
		draw_sprite_ext(char[0].banner,0,0,0,1,1,0,c_white,0.75);
		pal_swap_set(char[0].pallete,char[0].color_cursor,false);
		draw_sprite_ext(char[0].idle,0,112,344,1,1,0,c_white,1);
		pal_swap_reset();
		if char[0].color_selected == -1 {
			draw_set_font(global.bitmap_digits)
			draw_sprite_ext(Spr_Sticky_color,0,96,384 + 32,1,1,0,c_white,1);
			draw_set_halign(fa_center);
			draw_text_ext_transformed(96,364 + 32,string(char[0].color_cursor - 1),4,120,2,2,5);
		}
		
		draw_set_halign(fa_left);
		draw_set_font(global.bitmap_font2_outline);
		draw_text_transformed(0+8,344-16, char[0].name, 2, 2, 0);
	if wich_player == 2 and char[1].character_selected != noone{
		
		//character 2 draw
		draw_sprite_ext(char[1].banner,0,640,0,-1,1,0,c_white,0.75);
		pal_swap_set(char[1].pallete,char[1].color_cursor,false);
		draw_sprite_ext(char[1].idle,0,528,344,-1,1,0,c_white,1);
		pal_swap_reset();
		if char[1].color_selected == -1 {
			draw_set_font(global.bitmap_digits)
			draw_sprite_ext(Spr_Sticky_color,0,544,384 + 32,1,1,0,c_white,1);
			draw_set_halign(fa_center);
			draw_text_ext_transformed(544,364 + 32,string(char[1].color_cursor - 1),0,96,2,2,5);
		}
		
		draw_set_halign(fa_right);
		draw_set_font(global.bitmap_font2_outline);
		draw_text_transformed(640-8,344-16, char[1].name, 2, 2, 0);
	}
}

draw_self();
