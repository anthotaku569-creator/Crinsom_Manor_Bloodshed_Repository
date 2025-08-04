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
}

distance_x = abs(obj_ball.x - (x + (48 * side)));
distance_y = abs(obj_ball.y - (y - 12));

function move_to_ball(){
	if obj_ball.vely >= -0.5 {
		 if (obj_ball.vely >= -0.5) {
	        if (distance_x > relajo) {
	            function_moving(sign((obj_ball.x) - (self.x + 48 * side)));
	        }
			else if (distance_y < 4 or obj_ball.vely == 0){
				image_index = -1;
				sprite_index = kick_sprite;
			}
	    }
	}
}


movement_function(self);
avoidClip_function(self);
friction_function(self);
avoid_offstage(self);

switch(sprite_index){
	case idle_sprite:
		move_to_ball();
		if velx != 0 {
			sprite_index = run_sprite;
		}
		break;
	case run_sprite:
		var center = (max_left + max_right) /2
		if side == 1{
			if obj_ball.x + obj_ball.velx < center{
				movement = 4.4
				relajo = 47
			}
			else{
				movement = 2.4
				relajo = 12
			}
		}
		else {
			if obj_ball.x + obj_ball.velx > center{
				movement = 4.4
				relajo = 47
			}
			else{
				movement = 2.4
				relajo = 12
			}
		}
		move_to_ball();
		if velx != 0 {
			image_xscale = sign(velx);
		}
		else {
			sprite_index = idle_sprite;
		}
		break;
	case kick_sprite:
		image_xscale = side;
		break;
	default:
		sprite_index = idle_sprite;
		break;
}

//reduceVelocity();
