/// @description Knockback delay
// You can write your code in this editor

function calc_kback(angle, kcbk, other_dir){
	
	if (scaling.kbck < 2){
		angle_scale = scaling.kbck
	}
	else{
		angle_scale = 2
	}
	
	if buffer.vertical == ver_buffer.d_up{
		angle += stats.weight.DI_Tap*scaling.kbck;
	}
	if buffer.horizontal == hor_buffer.d_left{
		angle += stats.weight.DI_Tap*scaling.kbck;
	}
	if buffer.vertical == ver_buffer.d_down{
		angle -= stats.weight.DI_Tap*scaling.kbck;
	}
	if buffer.horizontal == hor_buffer.d_right{
		angle -= stats.weight.DI_Tap*scaling.kbck;
	}
	velx = cos(angle*pi/180)*kcbk*other_dir;
	vely = sin(angle*pi/180)*kcbk*-1;
}

calc_kback(delay_kback.angle, delay_kback.strength, delay_kback.other_dir);