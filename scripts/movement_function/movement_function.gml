function movement_function(obj){
	var _pass = false;
	
	if variable_instance_exists(obj, "pass"){
		_pass = obj.pass;
	}
	/*
	Slope_movement(obj);
	
	if obj.velx != 0 {
		slope_magnet(obj);
	}*/
	//collision horizontal
	var vecx=sign(obj.velx)*0.01
	repeat(abs(obj.velx)*100){
		if !obj.bbox_collision_function(obj.x + vecx, obj.y, _pass){
			obj.x = obj.x + vecx;
		}
		/*else if obj.bbox_place_meeting(obj.x + vecx, obj.y, Collision_slope){
			obj.x = obj.x + vecx;
			if !obj.bbox_collision_function(obj.x, obj.y + 1, _pass){
				obj.y ++;
			}
		}*/
		else{
			obj.velx=0;
		}
	}
	//collision vertical
	var vecy=sign(obj.vely)*0.01
	repeat(abs(obj.vely)*100){
		// (abajo)
		if vecy > 0{
			if !obj.bbox_collision_function(obj.x, obj.y + vecy, _pass){
			obj.y = obj.y + vecy;
			}
			/*else if obj.bbox_place_meeting(obj.x, obj.y + vecy, Collision_slope){
				obj.y = obj.y + vecy;
			}*/
			else{
				obj.vely=0;
			}
		}
		// (arriba)
		else {
			if !obj.bbox_collision_function(obj.x, obj.y + vecy - 1, _pass){
			obj.y = obj.y + vecy;
			}
			else{
				/*while obj.bbox_collision_function(obj.x,obj.y){
					obj.y = obj.y - vecy;
				}*/
				//obj.vely=0;
			}
		}
		
	}
}