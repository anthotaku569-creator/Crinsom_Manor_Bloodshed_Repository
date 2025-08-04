/// @description Insert description here
// You can write your code in this editor
bars.InspirationBar.actual += 12;
state = states.idle;



if collision_function(self.x, self.y+1, pass){
	if input_check(inputs.k_down, wich_player){sprite_index = animations.crouch;}
	else{sprite_index = animations.idle;}
}
else{
	if (vely < 0) {sprite_index = animations.air.rising}
else{sprite_index = animations.air.falling}
}
should_reverse = true;