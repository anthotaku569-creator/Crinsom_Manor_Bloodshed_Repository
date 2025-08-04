/// @description Insert description here
// You can write your code in this editor
bars.InspirationBar.actual += 12;
						state = states.idle;
						if collision_function(self.x, self.y+1){
							if keyboard_check(inputs.k_down){sprite_index = animations.crouch;}
							else{sprite_index = animations.idle;}
						}
						else{
							if (vely < 0) {sprite_index = animations.air.rising}
						else{sprite_index = animations.air.falling}
						}