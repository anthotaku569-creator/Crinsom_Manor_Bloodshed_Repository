// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function distance_calculator(_velocity, _deacceleration){
	//D = v*t + 1/2*a*t^2
	var _vo2 = power(_velocity, 2);
	var _2a = power(_deacceleration, 2);
	// vf^2 = vo^2 - 2*a*d
	// 2*a*d = vo^2 - vf^2
	// d = (vo^2 - vf^2) /2*a
	// d = (vo^2) /2*a
	var _distance = (_vo2)/_2a;
	return _distance;
}