/// @description Insert description here
// You can write your code in this editor

if sprite_index != hitbox_spr {
	draw_sprite_ext(
		sprite_index, image_index,
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		camera_get_view_width(view_camera[0]) /sprite_width,
		camera_get_view_height(view_camera[0]) /sprite_height,
		0,c_white,1);
	room_speed = 30;
}


surface_depth_disable(true);
gpu_set_zwriteenable(false);
gpu_set_ztestenable(false);

//draw_self();