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

create_chars(global.player_one_selection.select,global.player_two_selection.select)