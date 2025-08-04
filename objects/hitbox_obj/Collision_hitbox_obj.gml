/// @description Insert description here
// You can write your code in this editor
if (pry_properties.physics.collision == true){
	pry_properties.velx = cos(other.kback.angle*pi/180)*other.kback.strength*other.image_xscale;
	pry_properties.vely = sin(other.kback.angle*pi/180)*other.kback.strength*-1;
}

if stt_effects.water{
	if other.stt_effects.burn > 0 {
		stt_effects.burn += other.stt_effects.burn;
		dmg -= other.stt_effects.burn/2;
		other.stt_effects.burn = 0
	}
	if other.stt_effects.paralysis > 0 {
		stt_effects.paralysis += other.stt_effects.paralysis;
		dmg -= other.stt_effects.paralysis/2;
		other.stt_effects.paralysis = 0
	}
	if other.stt_effects.cold > 0 {
		stt_effects.cold += other.stt_effects.cold;
		dmg -= other.stt_effects.cold/2;
		other.stt_effects.cold = 0
	}
	if other.stt_effects.poison > 0 {
		stt_effects.poison += other.stt_effects.poison;
		dmg -= other.stt_effects.poison/2;
		other.stt_effects.poison = 0
	}
	if other.stt_effects.curse > 0 {
		stt_effects.curse += other.stt_effects.curse;
		dmg -= other.stt_effects.curse/2;
		other.stt_effects.curse = 0
	}
}

if other.reflect == true and bloc== blc_types.pry{
	if (pry_properties.physics.collision != true){
		pry_properties.velx = pry_properties.velx * -1
		pry_properties.vely = pry_properties.vely * -1
	}
	duration += 10
	master = other.master
	//match_controller.sophie_dialoge_action(sophie_states.reflect, master.wich_player);
}