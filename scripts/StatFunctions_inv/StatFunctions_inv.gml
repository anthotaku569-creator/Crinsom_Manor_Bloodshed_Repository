// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function StatFunctions_inv(W, S){
	var result =
	{
		weight : {
			HealthPoint: (W * 8) + 50,//(W * 10) + 75,
			hit_red: floor(W / 7.5)
		},
		velocity : {
			movement_speed: air_fric_1 + (S * (2/5)) ,
		},
	};
	
	return result;
}