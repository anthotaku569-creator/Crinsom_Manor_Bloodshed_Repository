
if !bbox_place_meeting(x,y,Collision_normal){
	vely = vely + grav_1;
}
else{
	vely = 0;
}

function function_moving(dir){
	if (dir != 1 and dir != -1) {
        return;
    }
	velx = (movement) * dir;
	if velx != 0{
		image_xscale = dir;
	}
}

switch(s_states){
	case sophie_actions.actionable:
		if distance_to_point(match_controller.x, y) > 48{
			function_moving(sign(match_controller.x-x));
			sprite_index = Sofia_run;
		}
		else{
			sprite_index = Sofia_idle;
			if match_controller.x < x {
				image_xscale = -1;
			}
			if match_controller.x > x {
				image_xscale = 1;
			}
			
		}
		break;
	case sophie_actions.talking:
		sprite_index = Sofia_talking;
		break;
	case sophie_actions.start:
		break;
}


/*
if distance_to_point(match_controller.x, y) > camera_get_view_width(view_camera[0]) / 2{
	movement = 6;
}
else{ movement = 4; }
*/


movement_function(self);
avoidClip_function(self);
friction_function(self);
avoid_offstage(self);
