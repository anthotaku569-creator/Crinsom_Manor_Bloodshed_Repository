/// @description Insert description here
// You can write your code in this editor

function fear_function(){
	if instance_exists(hitbox_obj){
			if distance_to_object(hitbox_obj) < 96 and (hitbox_obj.dmg > 20 or hitbox_obj.hitspark!= hitspark_normal){
				timing = 15;
				image_index = -1;
				sprite_index = SweepGirl_fear_1;
			}
		}
		if instance_exists(match_controller){
			if (match_controller.player_one.state == states.hitstun or
			(match_controller.player_one.state == states.knockdown and match_controller.player_one.image_index < 6) or
			(match_controller.player_one.velx + match_controller.player_one.vely)/2 > 20
			) and
			distance_to_object(match_controller.player_one) < 96
			{
				timing = 15;
				image_index = -1;
				sprite_index = SweepGirl_fear_1;				
			}
			if (match_controller.player_two.state == states.hitstun or
			(match_controller.player_two.state == states.knockdown and match_controller.player_two.image_index < 6) or
			(match_controller.player_two.velx + match_controller.player_two.vely)/2 > 20
			) and
			distance_to_object(match_controller.player_two) < 96
			{
				timing = 15;
				image_index = -1;
				sprite_index = SweepGirl_fear_1;				
			}
		}
}

switch(sprite_index){
	case SweepGirl_fear_1:
		//
		break;
	case SweepGirl_fear_2:
		if instance_exists(hitbox_obj){
			if distance_to_object(hitbox_obj) > 96{
				sprite_index = idle_sprite;
			}
			else{
				timing = 15;
			}
		}
		else if instance_exists(match_controller){
			if (match_controller.player_one.state == states.hitstun or
			(match_controller.player_one.state == states.knockdown and match_controller.player_one.image_index < 6) or
			(match_controller.player_one.velx + match_controller.player_one.vely)/2 > 20
			) and
			distance_to_object(match_controller.player_one) < 96
			{
				timing = 15;			
			}
			else if (match_controller.player_two.state == states.hitstun or
			(match_controller.player_two.state == states.knockdown and match_controller.player_two.image_index < 6) or
			(match_controller.player_two.velx + match_controller.player_two.vely)/2 > 20
			) and
			distance_to_object(match_controller.player_two) < 96
			{
				timing = 15;				
			}
			else if timing <= 0{
					timing = 15;
					sprite_index = idle_sprite;
			}
			else{
				timing --;
			}
		}
		else if timing <= 0{
				timing = 15;
				sprite_index = idle_sprite;
		}
		else{
			timing --;
		}
		break;
	case SweepGirl_walk:
		if move >= 0{
			move --
			x += 1*image_xscale;
		}
		else {
			image_index = -1;
			sprite_index = idle_sprite;
			move = choose(60, 90, 120, 150, 180);
		}
		if x <= x_start{
			image_xscale = 1
		}
		if x >= x_end{
			image_xscale = -1
		}
		fear_function();
		break;
	case SweepGirl_idle_1:
		if move >= 0{
			move --
			sprite_index = idle_sprite;
		}
		else {
			image_index = -1;
			sprite_index = SweepGirl_walk;
			
			move = choose(15, 30, 45, 60, 75);
		}
		if x <= x_start{
			image_xscale = 1
		}
		if x >= x_end{
			image_xscale = -1
		};
		fear_function();
		break;
	case SweepGirl_hurra:
		sprite_index = idle_sprite;
		fear_function();
		if (match_controller.player_one.object_index == Ch_Rafael and match_controller.deaths_p1 == 2) or (match_controller.player_two.object_index == Ch_Rafael and match_controller.deaths_p2 == 2){
			sprite_index = SweepGirl_fear_3;
		}
		break;
	case SweepGirl_fear_3:
		break;
	default:
		sprite_index = idle_sprite;
		fear_function();
		break;
}
