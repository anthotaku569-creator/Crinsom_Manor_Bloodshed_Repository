var _other_bounded =  other.char_bounded;

with(char_bounded){
	if xprevious > _other_bounded.x {
		if !_other_bounded.bbox_collision_function(_other_bounded.x - 1, _other_bounded.y){
			x += (abs(velx)) ;
			_other_bounded.x -= (abs(velx)) ;
		}
		else{
			x += 8 + (abs(velx)) ;
		}
	}
	else{
		if !_other_bounded.bbox_collision_function(_other_bounded.x - 1, _other_bounded.y){
			x -= (abs(velx)) ;
			_other_bounded.x += (abs(velx)) ;
		}
		else{
			x -= 8 + (abs(velx)) ;
		}
	}
}