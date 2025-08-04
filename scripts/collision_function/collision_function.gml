
function collision_function(posx, posy, _pass){
	if place_meeting(posx, posy ,Collision_normal){
		return true;
	}
	else{
		var _oneway = instance_place(posx, posy ,Collision_oneway);
		if _oneway != noone{
			if y <= _oneway.y and !_pass{
				return true;
			}
			else{
				return false;
			}
		}
		return false;
	}
	/*
	if place_meeting(obj.posx, obj.posy + 1 ,Collision_oneside) and obj.vely>=0{
		return true;
	}
	*/
}
//collision_function(posx, posy)
//collision_function(self.x, self.y)