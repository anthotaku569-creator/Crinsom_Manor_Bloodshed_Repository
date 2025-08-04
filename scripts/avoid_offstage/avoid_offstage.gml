// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function avoid_offstage(obj){
	var dist_x = 0;
	if obj.x > room_width {
		while obj.bbox_collision_function(room_width - dist_x , obj.y, true){
			dist_x++;
		}
		obj.x = room_width - dist_x;
	}
	else if obj.x < 0 {
		while obj.bbox_collision_function(dist_x , obj.y, true){
			dist_x++;
		}
		obj.x = dist_x;
	}
	
	var dist_y = 0;
	if obj.y > room_height{
		while obj.bbox_collision_function(obj.x , room_height - dist_y, true){
			dist_y++;
		}
		obj.x = room_height - dist_y;
	}
	else if obj.y < 0 {
		while obj.bbox_collision_function(obj.x , dist_y, true){
			dist_y++;
		}
		obj.y = dist_y;
	}
}