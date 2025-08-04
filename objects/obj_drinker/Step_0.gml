/// @description Insert description here
// You can write your code in this editor
switch(sprite_index){
	case Drinker_idle:
		if drink_cooldown > 0{
			drink_cooldown--;
		}
		else{
			sprite_index = Drinker_drink;
			image_index = -1;
		}
		break;
	case Drinker_drink:
		if image_index > 15 and image_index < 38{
			liquid -= choose(0.3, 0.5, 1.1);
		}
		if image_index == 38 and liquid <= 0{
			sprite_index = Drinker_newbeer;
			image_index = -1;
		}
		break;
	case Drinker_newbeer:
		liquid = 100;
		break;
}