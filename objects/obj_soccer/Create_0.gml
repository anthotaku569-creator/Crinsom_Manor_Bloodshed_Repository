function bbox_place_meeting(posx, posy, obj_col){
	return place_meeting(posx,posy,obj_col);
}

function bbox_collision_function(posx, posy){
	return collision_function(posx,posy);
}


function bbox_instance_place(posx, posy, obj_col){
	var inst = noone;
	inst =  instance_place(posx,posy, obj_col);
	return inst;
}

velx = 0;
vely = 0;
movement = 4;
bounding_box = noone;
distance_x = 0;
relajo = 24;

idle_sprite = Soccer1_idle
run_sprite = Soccer1_run
kick_sprite = Soccer1_kick

if side == 1{
	idle_sprite = Soccer1_idle
	run_sprite = Soccer1_run
	kick_sprite = Soccer1_kick
}
else{
	idle_sprite = Soccer2_idle
	run_sprite = Soccer2_run
	kick_sprite = Soccer2_kick	
}