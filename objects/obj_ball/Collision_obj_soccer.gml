if other.sprite_index == other.kick_sprite {
	 if other.image_index >= 9 and other.image_index <= 13{
		 var extra_x = 0;
		 vely = choose(-9,-10,-11);
		 if other.x - 96 < other.max_left {
			 extra_x = 2
		 }
		 else if other.x + 96 > other.max_right {
			 extra_x = -2
		 }
		 velx = choose(5,5,6,7)*other.image_xscale + extra_x;
	 }
 }