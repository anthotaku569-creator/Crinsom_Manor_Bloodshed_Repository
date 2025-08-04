// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Slope_movement(obj){
	//vel x slope
	var slope = obj.bbox_instance_place(obj.x + obj.velx, obj.y, Collision_slope)
	if slope != noone {
		if sign(slope.image_xscale) == sign(obj.velx){
			var angle = arctan(slope.image_yscale/slope.image_xscale)
			var t_speed = sqrt(sqr(obj.velx) + sqr(obj.vely))
			var y_exp = abs(t_speed * sin(angle));
			if (obj.vely > (y_exp)){
				obj.velx = abs(t_speed * cos(angle))* sign(velx);
				obj.vely = abs(y_exp) *-1;
			}
			else{
				obj.y++;
				obj.y -= abs(y_exp);
				//obj.y = slope.bbox_top;
				//obj.x += obj.velx;
			}
		}
	}
	
	
}