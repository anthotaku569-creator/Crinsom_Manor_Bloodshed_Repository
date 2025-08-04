function bbox_place_meeting(posx, posy, obj_col){
	return place_meeting(posx,posy,obj_col);
}

function bbox_collision_function(posx, posy){
	return collision_function(posx,posy, false);
}


function bbox_instance_place(posx, posy, obj_col){
	var inst = noone;
	inst =  instance_place(posx,posy, obj_col);
	return inst;
}

velx = 0;
vely = 0;
movement = 4;

enum sophie_actions {
	start,
	actionable,
	talking
}
s_states = sophie_actions.start;

alarm[0] = 60