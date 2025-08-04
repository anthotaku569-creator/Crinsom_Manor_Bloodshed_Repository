// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function slope_magnet(obj){
	
	var _active = true;
	
	if variable_instance_exists(obj, "state"){
		switch(obj.state){
			case states.idle:
			case states.run:
			case states.dodge:
				_active = true;
				break;
			default:
				_active = false;
				break;
		}
	}
	
	
	//magnet
	var slope_m = obj.bbox_instance_place(obj.x - obj.velx, obj.y + 48, Collision_slope)
	
	if slope_m!= noone {
		if sign(slope_m.image_xscale) != sign(obj.velx)
			and _active == true
			//and abs(velx) < gnd_fric_1*4
			and vely >= 0
			{
			var angle = arctan(slope_m.image_yscale/slope_m.image_xscale)
			var t_speed = sqrt(sqr(obj.velx) + sqr(obj.vely))
			var y_exp = abs(t_speed * sin(angle));
			if (obj.vely < y_exp){
				obj.velx = abs(t_speed * cos(angle))* sign(velx);
				obj.vely = abs(y_exp);
			}
			else {
				obj.x += obj.velx;
				obj.y += y_exp;
			}
		}
	}
}