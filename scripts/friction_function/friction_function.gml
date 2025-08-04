// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function friction_function(obj){
	
	var _pass = false;
	
	if variable_instance_exists(obj, "pass"){
		_pass = obj.pass;
	}
	
	
	var vecx=sign(obj.velx);
	if collision_function(obj.x, obj.y + 1, _pass){
		if abs(obj.velx) > gnd_fric_1{
			obj.velx = obj.velx - (vecx * gnd_fric_1);
		}
		else{
			obj.velx = 0
		}
	}
	else{
		if abs(obj.velx) > air_fric_1{
			obj.velx = obj.velx - (vecx * air_fric_1);
		}
		else{
			obj.velx = 0
		}
	}
}