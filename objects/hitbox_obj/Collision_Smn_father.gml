/// @description Insert description here
// You can write your code in this editor
if (other.wich_player != master.wich_player){
	if (bloc = blc_types.pry){
		if (pry_properties.activation.summon != noone){
			if (pry_properties.activation.contact == true){
				if (duration > pry_properties.activation.delay and pry_properties.activation.delay != -1){
					duration = pry_properties.activation.delay
				}
			}
		}
		else if abs(rel_pos.posx) == 0 and abs(rel_pos.posy) == 0 {
			if alarm[0] < 0{
				alarm[0] = 1
			}
			//instance_destroy()
		}
		else{
			instance_destroy()
		}
	}
	else{
		instance_destroy()
	}
}