/// @description Insert description here
// You can write your code in this editor

//objects_array = [];

bloodlust = 50;

room_speed = 60

player_one = noone
player_two = noone

deaths_p1 = 0;
deaths_p2 = 0;

time = 60*300;//60*99;

timer_activ = false;

redeye = false;

training_settings = ds_map_create();

ds_map_add(training_settings, "Recovery", 0);
ds_map_add(training_settings, "Block", 0);
ds_map_add(training_settings, "Block Stance", 0);
ds_map_add(training_settings, "Grab parry", 0);
ds_map_add(training_settings, "Inst. Recovery", 0);
ds_map_add(training_settings, "Dir. Influence", 0);
ds_map_add(training_settings, "Vel. Influence", 0);
ds_map_add(training_settings, "Control", 0);
ds_map_add(training_settings, "Delay", 0);


function create_chars(_selectp1, _selectp2){
	#region playerone
		player_one = instance_create_depth(
			room_width/2 - 240,
			room_height - 48, 0,
			global.player_one_selection.character
			);
			//global.player_one_selection.character);
		player_one.wich_player = 1;
		player_one.inputs = global.inputs_p1;
		player_one.pallete.i = global.player_one_selection.color_i;
		global.player_one_selection.super(
			_selectp1,//global.player_one_selection.select,
			player_one
		);
		player_one.state = states.enter_match;
		player_one.sprite_index = player_one.animations.enter;
	#endregion
	#region playertwo
		player_two = instance_create_depth(
			room_width/2 + 240,
			room_height - 48, 0,
			global.player_two_selection.character);
		player_two.wich_player = 2;
		player_two.inputs = global.inputs_p2;
		player_two.pallete.i = global.player_two_selection.color_i;
		global.player_two_selection.super(
			_selectp2,//global.player_one_selection.select,
			player_two
		);
		player_two.state = states.enter_match;
		player_two.sprite_index = player_two.animations.enter;
		player_two.image_xscale = -1;
	#endregion
	
}

function get_bloodlust(wich_player){
	if wich_player == 1{
		return bloodlust;
	}
	else{
		return 100 - bloodlust;
	}
}

function modify_blodlust(_val ,wich_player){
	if wich_player != 1{
		_val = _val*-1;
	}
	bloodlust +=_val;
	if (bloodlust) > 100{
		bloodlust = 100;
	}
	if (bloodlust) < 0{
		bloodlust = 0;
	}
}

function pause(){
	input_clear_momentary(false)
	if input_check_pressed("pause_p1",1) or input_check_pressed("pause_p2",2){
		if not instance_exists(obj_pause_parent){
			screen_save("pause_save.png")
			instance_deactivate_all(true);
			instance_activate_object(user_controller);
			timer_activ = false;
			if global.training_mode == false {
				instance_create_depth(0,0,-100,obj_pause_normal);
			}
			else{
				instance_create_depth(0,0,-100,obj_pause_training);
			}
		}
	}
}

function hit_pause(_pwr){
	room_speed = 60/(5 + _pwr)
	alarm[0] = 1
}

function slowdown(){
	redeye = true;
	alarm[0] = 1
	room_speed = 15
}

function follow_players(){
	if player_two != noone{
		x = (player_two.x + player_one.x)/2
		y = (player_two.y + player_one.y)/2
		
		//camera_set_view_size(0, 320, 240)
		
		/*var p1_width = abs (player_one.bbox_left-player_one.bbox_right)
		var p2_width = abs (player_two.bbox_left-player_two.bbox_right)
		var p1_height = abs (player_one.bbox_top-player_one.bbox_bottom)
		var p2_height = abs (player_two.bbox_top-player_two.bbox_bottom)
		
		var avr_width = (p1_width + p2_width);
		var avr_height = (p1_height + p2_height);*/
		
		var x_distance = abs(player_one.x-player_two.x) + 96
		var y_distance = abs(player_one.y-player_two.y) + 240
		//camera_set_view_size(0, 640*2, 480*2)
		if x_distance > (320) and (y_distance < x_distance){
			var _width = x_distance;
			var _height = _width * 480/640;
			//view_wport[0] = _width;
			//view_hport[0] = _height;
			camera_set_view_size(view_camera[0], _width, _height);
			camera_set_view_border(view_camera[0], _width/2, _height/2);
		}
		else if y_distance > 240{
			var _height = y_distance;
			var _width = _height * 640/480;
			//view_wport[0] = _width;
			//view_hport[0] = _height;
			camera_set_view_size(view_camera[0], _width, _height);
			camera_set_view_border(view_camera[0], _width/2, _height/2);
			
		}
		else{
			camera_set_view_size(0, 320, 240)
		}
	}
}

function cutscene(sprite){
	instance_deactivate_all(true);
	sprite_index = sprite;
	image_index = 0;
	//visible = true;
	timer_activ = false;
}

function end_cuntscene(){
	instance_activate_all();
	sprite_index = hitbox_spr;
	timer_activ = true;
}

function hitspark_create(sprite,attack_x,attack_y,enemy_x,enemy_y){
	var place_x = (3*enemy_x + attack_x)/4;
	var place_y = (enemy_y + 2 * attack_y)/3 - 12;
	obj = instance_create_depth(place_x, place_y, -100, obj_hitspark);
	obj.sprite_index = sprite;
	obj.image_angle  = random_range(0, 360);
}

function create_invocation(_obj,player_creator,_x,_y){
	var _inv = instance_create_depth(_x,_y,-2,_obj);
	switch(player_creator){
		case 1:
			//pj creator and pj enemy
			_inv.master = player_one; _inv.enemy = player_two;
			_inv.follow = _inv.enemy;
			_inv.wich_player = 1;
			_inv.inputs = global.inputs_p1;
			break;
		case 2:
			//pj creator and pj enemy
			_inv.master = player_two; _inv.enemy = player_one;
			_inv.follow = _inv.enemy;
			_inv.wich_player = 2;
			_inv.inputs = global.inputs_p2;
			break;
		default:
			//pj creator and pj enemy
			_inv.master = player_one; _inv.enemy = player_two;
			_inv.follow = _inv.enemy;
			_inv.wich_player = 1;
			_inv.inputs = global.inputs_p1;
			break;
	}
}

function start_match(){
	if player_one.sprite_index == player_one.animations.idle and player_two.sprite_index == player_two.animations.idle{
		player_one.state = states.idle;
		player_two.state = states.idle;
		timer_activ = true;
	}
}

function round_end(_ply){
	if global.training_mode == false{
		if _ply == 1{
			deaths_p1 ++;
		}
		else if _ply == 2{
			deaths_p2 ++;
		}
		
		player_one.state = states.round_finish;
		player_two.state = states.round_finish;
	}
	//time = 60*180;//60*99;
}

function actual_respawn (_ply){
	if _ply == 1{
		player_one.image_speed = 1;
		player_one.sprite_index = player_one.animations.idle;
		player_one.erasing_sprite = 0;
		player_one.bars.HealthBar.actual = player_one.bars.HealthBar.maximum;
		player_one.bars.HitstunBar.actual = 0;
		player_one.x = room_width/2;
		player_one.y = room_height - 48;
		player_one.stt_effects = {
			burn : 0,
			paralysis : 0,
			cold : 0,
			poison : 0,
			curse : 0,
			regenerate : 0,
			passion: 0,
			berserker: 0,
		};
	}
	else if _ply == 2{
		player_two.image_speed = 1;
		player_two.erasing_sprite = 0;
		player_two.bars.HealthBar.actual = player_two.bars.HealthBar.maximum;
		player_two.bars.HitstunBar.actual = 0;
		player_two.sprite_index = player_two.animations.idle;
		player_two.bars.HealthBar.actual = player_two.bars.HealthBar.maximum;
		player_two.x = room_width/2;
		player_two.y = room_height - 48;
		player_two.stt_effects = {
			burn : 0,
			paralysis : 0,
			cold : 0,
			poison : 0,
			curse : 0,
			regenerate : 0,
			passion: 0,
			berserker: 0,
		};
	}
	//time = 60*180;// 60*99;
	timer_activ = true;
}

function respawn_character(_ply){
	player_one.state = states.idle;
	player_two.state = states.idle;
	if _ply == 1{
		actual_respawn (1)
	}
	if _ply == 2{
		actual_respawn (2)
	}
	if deaths_p1 == 2 or deaths_p2 == 2 or time <= 0{
		global.player_one_selection = {
			character : noone,
			color : 0,
			super : function (select, _obj) {},
			select : 0,
			done : false,
		}
		global.player_two_selection = {
			character : noone,
			color : 0,
			super : function (select, _obj) {},
			select : 0,
			done : false,
		}
		room_goto(CharSelect)
	}
}

function timing(){
	if time > 0 {
		if timer_activ == true and global.training_mode == false{
			time--;
		}
	}
	else{
		if player_one.state != states.round_finish and  player_two.state != states.round_finish {
			player_one.state = states.round_finish;
			player_two.state = states.round_finish;
			player_one.bars.HealthBar.actual = -1;
			player_one.sprite_index = player_one.animations.death;
			player_two.bars.HealthBar.actual = -1;
			player_two.sprite_index = player_two.animations.death;
		}
		else{
			
		}
	}
}

create_chars(global.player_one_selection.select,global.player_two_selection.select)