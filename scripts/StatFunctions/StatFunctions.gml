// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function StatFunctions(W, G, A, J){
	var result =
	{
		weight : {
			HealthPoint: (W * 30) + 250,//(W * 30) + 150,
			DI_Tap: 0,
			DI_hold: ceil(W / 10),
			hit_red: floor(W / 8)
		},
		ground : {
			ground_speed: gnd_fric_1 + (G * (2/5)) ,
		},
		aerial : {
			max_air_speed: air_fric_1 + (A * (1/5)) ,
			air_acc: A / 15 ,
		},
		jump : {
			j_heigh: sqrt(240)*((J + 10)/20),
			grav: (J + 10)/20,
		}
	};
	
	return result;
}