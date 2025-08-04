// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function particle_function(_sprite, _x, _y ,off_x, off_y){
	var create_x = _x + random_range(off_x*-1,off_x)
	var create_y = _y + random_range(off_y*-1,off_y)
	obj = instance_create_depth(create_x, create_y, -100, obj_hitspark);
	obj.sprite_index = _sprite;
}