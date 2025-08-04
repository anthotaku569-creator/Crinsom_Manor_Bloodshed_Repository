/// @description Insert description here
// You can write your code in this editor

//create bounding box

function assign_boundingbox(){
	if (bounding_box==noone){
		bounding_box=instance_create_depth(x,y, -100, Obj_collision);
		bounding_box.char_bounded = self;
	}
	else{
		bounding_box.char_bounded = self;
	}
}

function bbox_place_meeting(posx, posy, obj_col){
	with(bounding_box){
		return place_meeting(posx,posy,obj_col);
	}
}

function bbox_collision_function(posx, posy, _pass){
	with(bounding_box){
		return collision_function(posx,posy, _pass);
	}
}


function bbox_instance_place(posx, posy, obj_col){
	var inst = noone;
	with(bounding_box){
		inst =  instance_place(posx,posy, obj_col);
	}
	return inst;
}

assign_boundingbox();