cursor = 0;
max_options = 3;
actual_menu_screen = 0;
selected = "";
//Normal Menu
options[0] = [
	{
		name: "Exit"
	},
	{
		name: "Character Select"
	},
	{
		name: "Resume"
	}
]
//CPU Defense
options[1] = [
	{
		name: "Recovery",
		slider: ["Noone", "Light attack", "Special 1", "Special 2", "Special 3"]
	},
	{
		name: "Block",
		slider: ["Noone", "Normal", "Perfect", "Shield"]
	},
	{
		name: "Block Stance",
		slider: ["Stand", "Crouch", "Random", "Perfect"]
	},
	{
		name: "Grab tech",
		slider: ["Never", "Random", "Always"]
	}
]
//CPU On Hit
options[2] = [
	{
		name: "Kndwn recovery",
		slider: ["Never", "Random", "Always"]
	},
	{
		name: "Humanity Burst",
		slider: ["Never", "Random", "Always"]
	}
]
//Input Recordings
options[3] = [
	{
		name: "Control",
		slider: ["Player2", "CPU", "--WIP--"]
	},
	{
		name: "Delay",
		actual: 0,
		max_size: 61
	},
	{
		name: "Start Recording"
	}
]

/*

___________________________________________
############################################################################################
ERROR in action number 1
of Draw Event for object obj_pause_training:
Memory allocation failed: Attempting to allocate 1228800 bytes
 at gml_Object_obj_pause_training_Draw_64 (line 4) -        pause_sprite = sprite_add("pause_save.png",0,0,0,0,0)
############################################################################################
gml_Object_obj_pause_training_Draw_64 (line 4)

*/