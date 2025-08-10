
var sons = [];

sons[0] = instance_create_depth(x, y + (32 * 0), depth, obj_button_binder); //right
sons[1] = instance_create_depth(x, y + (32 * 1), depth, obj_button_binder); //left
sons[2] = instance_create_depth(x, y + (32 * 2), depth, obj_button_binder); //up
sons[3] = instance_create_depth(x, y + (32 * 3), depth, obj_button_binder); //down
sons[4] = instance_create_depth(x, y + (32 * 4), depth, obj_button_binder); //L
sons[5] = instance_create_depth(x, y + (32 * 5), depth, obj_button_binder); //M
sons[6] = instance_create_depth(x, y + (32 * 6), depth, obj_button_binder); //H
sons[7] = instance_create_depth(x, y + (32 * 7), depth, obj_button_binder); //S1
sons[8] = instance_create_depth(x, y + (32 * 8), depth, obj_button_binder); //S2
sons[9] = instance_create_depth(x, y + (32 * 9), depth, obj_button_binder); //S3
sons[10] = instance_create_depth(x, y + (32 * 10), depth, obj_button_binder); //Pause
sons[11] = instance_create_depth(x, y + (32 * 11), depth, obj_button_reset); //Reseting
sons[12] = instance_create_depth(x, y + (32 * 12), depth, obj_control_binder); //Control


if wich_player == 1	{
	sons[0]._verb = "right_p1";			sons[0]._wich_player = wich_player;
	sons[1]._verb = "left_p1";			sons[1]._wich_player = wich_player;
	sons[2]._verb = "up_p1";			sons[2]._wich_player = wich_player;
	sons[3]._verb = "down_p1";			sons[3]._wich_player = wich_player;
	sons[4]._verb = "L_p1";				sons[4]._wich_player = wich_player;
	sons[5]._verb = "M_p1";				sons[5]._wich_player = wich_player;
	sons[6]._verb = "H_p1";				sons[6]._wich_player = wich_player;
	sons[7]._verb = "S1_p1";			sons[7]._wich_player = wich_player;
	sons[8]._verb = "S2_p1";			sons[8]._wich_player = wich_player;	
	sons[9]._verb = "S3_p1";			sons[9]._wich_player = wich_player;	
	sons[10]._verb = "pause_p1";		sons[10]._wich_player = wich_player;
	sons[11]._wich_player = wich_player;
	sons[12].wich_player = wich_player;
}

else{
	sons[0]._verb = "right_p2";			sons[0]._wich_player = wich_player;
	sons[1]._verb = "left_p2";			sons[1]._wich_player = wich_player;
	sons[2]._verb = "up_p2";			sons[2]._wich_player = wich_player;
	sons[3]._verb = "down_p2";			sons[3]._wich_player = wich_player;
	sons[4]._verb = "L_p2";				sons[4]._wich_player = wich_player;
	sons[5]._verb = "M_p2";				sons[5]._wich_player = wich_player;
	sons[6]._verb = "H_p2";				sons[6]._wich_player = wich_player;
	sons[7]._verb = "S1_p2";			sons[7]._wich_player = wich_player;
	sons[8]._verb = "S2_p2";			sons[8]._wich_player = wich_player;	
	sons[9]._verb = "S3_p2";			sons[9]._wich_player = wich_player;	
	sons[10]._verb = "pause_p2";		sons[10]._wich_player = wich_player;
	sons[11]._wich_player = wich_player;
	sons[12].wich_player = wich_player;
}
