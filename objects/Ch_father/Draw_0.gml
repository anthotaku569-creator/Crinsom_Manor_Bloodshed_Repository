/// @description Insert description here
// You can write your code in this editor

if global.training_mode == true{
	/*
	draw_set_font(global.bitmap_font2)
	draw_set_alpha(1);
	draw_text(
		x + 48*image_xscale,
		y - 120,
		json_encode(active_prys)
	)
	*/
	/*
	var k = ds_map_find_first(active_prys),
    maptext = "";
	while (!is_undefined(k)) {
	  maptext += string(k) + ": " + string(active_prys[? k]) + "\n";
	  k = ds_map_find_next(active_prys, k);
	}
	draw_set_font(global.bitmap_font2)
	draw_text(
		x + 48*image_xscale,
		y - 120,
		maptext
	);
	*/
	draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_blue, c_blue, c_blue, c_blue, true)

	//draw_ellipse_color(x-4 - sprite_get_xoffset(sprite_index),y-4 - sprite_get_yoffset(sprite_index),x+4- sprite_get_xoffset(sprite_index),y+4 - sprite_get_yoffset(sprite_index),false, c_fuchsia, false);
}
#region drawing the char itself

gpu_set_blendmode(bm_normal);
pal_swap_set(pallete.sprite,pallete.i,false);
//pal_swap_set(char[0].pallete,char[0].color_cursor,false);

if bars.HealthBar.actual <= 0 and collision_function(x, y + 1, pass) and state= states.round_finish{
	image_xscale = 1;
	draw_sprite_part_ext(sprite_index, image_index, 0, erasing_sprite, sprite_width, sprite_height - erasing_sprite, x - sprite_xoffset * xscale ,y - sprite_yoffset + erasing_sprite, xscale, image_yscale, c_white, 1);
	
	if image_index == image_number - 1{
		erasing_sprite += ceil((sprite_height/(image_number))*0.75);
	}
	if erasing_sprite >= sprite_height {
		match_controller.respawn_character(wich_player)
	}
}
else{
	xscale = image_xscale
	draw_self()
}

if state == states.run or state == states.air_dash or state == states.curse_eye{
	draw_sprite_ext(sprite_index,image_index,xprevious,yprevious,image_xscale,image_yscale,image_angle,c_white,0.5);
	draw_sprite_ext(sprite_index,image_index,xprevious - velx,yprevious - vely,image_xscale,image_yscale,image_angle,c_white,0.25);
}

switch(prot){
	case protections.full:
		if state != states.round_finish{
			image_alpha = 0.5
		}
		break;
	default:
		image_alpha = 1
		break;
}


pal_swap_reset();

#endregion

