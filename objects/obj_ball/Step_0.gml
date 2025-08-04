if !bbox_place_meeting(self.x,self.y,Collision_normal){
	vely = vely + grav_1/2;
}
else{
	vely = 0;
}
function friction_self(){
	var vecx=sign(velx);
	if abs(velx) > 0.5{
			velx = velx - (vecx * 0.2);
		}
		else{
			velx = 0
		}
}


if bbox_place_meeting(self.x + sign(velx)*2,self.y,Collision_normal){
	velx = velx *-1
}

if bbox_place_meeting(self.x,self.y + 1,Collision_normal){
	friction_self();
}

avoidClip_function(self);
movement_function(self);
avoid_offstage(self);

if velx == 0 and vely == 0{
	sprite_index = soccerball_1;
}
else{
	sprite_index = soccerball_2;
}