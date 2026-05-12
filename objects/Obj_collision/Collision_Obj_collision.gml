var _other_bounded =  other.char_bounded;
var p_push = prev_push;
with(char_bounded){
	var push = abs(velx);
	if push < gnd_fric_1 and push > 0{
		push = gnd_fric_1;
	}
	if push != bounding_box.prev_push {
		if push > 0 {
			show_debug_message("push: " + string(push));
		}
		else{
			show_debug_message("push: " + "No");
		}
		bounding_box.prev_push = push;
	}
	
	
	if xprevious > _other_bounded.x {
		if !_other_bounded.bbox_collision_function(_other_bounded.x - 1, _other_bounded.y){
			x += (push) ;
			_other_bounded.x -= (push) ;
		}
		else{
			x += 8 + (push);
		}
	}
	else{
		if !_other_bounded.bbox_collision_function(_other_bounded.x + 1, _other_bounded.y){
			x -= (push) ;
			_other_bounded.x += (push) ;
		}
		else{
			x -= 8 + (push);
		}
	}
}