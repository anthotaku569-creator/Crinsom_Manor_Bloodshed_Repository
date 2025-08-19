// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function StatFunctions(W, G, A, J){
	var result =
	{
		weight : {
			HealthPoint: (W * 30) + 250,//(W * 30) + 150,
			DI_Tap: 0,
			DI_hold: ceil(W / 40),
			hit_red: floor(W / 16)
		},
		ground : {
			ground_speed: gnd_fric_1 + (G * (3/5)) ,
		},
		aerial : {
			max_air_speed: air_fric_1 + (A * (1/5)) ,
			air_acc: A / 12 ,
		},
		jump : {
			j_heigh: sqrt(48*3*((J + 5)/10)),
			grav: (J + 5)/20,
		}
	};
	
	return result;
}