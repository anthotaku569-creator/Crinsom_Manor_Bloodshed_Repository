// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function avoidClip_function(obj){
	var _pass = false;
	/*
	if variable_instance_exists(obj, "pass"){
		_pass = obj.pass;
	}*/
	
	dist = 1;
	while obj.bbox_collision_function(obj.x, obj.y, _pass){
		if !obj.bbox_collision_function(obj.x + dist , obj.y, _pass){
			obj.x += dist
		}
		else if !obj.bbox_collision_function(obj.x - dist , obj.y, _pass){
			obj.x -= dist
		}
		else if !obj.bbox_collision_function(obj.x , obj.y + dist, _pass){
			obj.y += dist
		}
		else if !obj.bbox_collision_function(obj.x , obj.y - dist, _pass){
			obj.y -= dist
		}
		dist++;
	}
}