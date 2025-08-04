if moving_to_point == 1 {
	curr_targetx = targetx_1;
	curr_targety = targety_1;
}
else {
	curr_targetx = targetx_2;
	curr_targety = targety_2;
}

x += velx;
y += vely;

if (x == curr_targetx and y == curr_targety){
	//x = curr_targetx;
	//y = curr_targety;
	moving_to_point = moving_to_point*-1;
}

velx = spd * sign(curr_targetx - x);
vely = spd * sign(curr_targety - y);


