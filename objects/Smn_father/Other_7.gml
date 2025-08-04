/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

function return_to_idle(){
	if collision_function(self.x, self.y+1){
			if input_check(inputs.k_down){
				sprite_index = animations.crouch;
			}
			else{sprite_index = animations.idle;}
		}
		else{
			if (vely < 0) {
				sprite_index = animations.air.rising
			}
			else{
				sprite_index = animations.air.falling
			}
		}
}

switch(state){
	case states.normal_atack:
		state = states.idle;
		return_to_idle()
		break;
	case states.special_atack:
		state = states.idle;
		return_to_idle()
		break;
	case states.landing:
		state = states.idle;
		return_to_idle()
		break;
	case states.knockdown:
		bars.HitstunBar.kdwn = 0
		image_index = 0
		bars.HitstunBar.actual = 0
		state = states.kdown_recovery
		break;
	case states.kdown_recovery:
		bars.HitstunBar.kdwn = 0
		image_index = 0
		bars.HitstunBar.actual = 0
		state = states.idle;
		return_to_idle()
		break;
	case states.dodge:
		state = states.idle;
		return_to_idle()
		break;
	case states.parry:
		state = states.idle;
		return_to_idle()
		break;
	case states.air_dash:
		state = states.idle;
		return_to_idle();
		break;
	case states.run:
		if (sprite_index == extras.run.stop){
			state = states.idle;
			return_to_idle();
		}
		break;
	default:
		break;
}
