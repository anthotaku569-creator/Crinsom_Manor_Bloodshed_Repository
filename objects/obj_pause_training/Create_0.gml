cursor = 0;
max_options = 4;
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
		name: "Stage Select"
	},
	{
		name: "Resume"
	}
]
//CPU Defense
options[1] = [
	{
		name: "Recovery",
		slider: ["Noone", "N. Atck", "Up Spe", "P.I.", "Rec01", "Rec02", "Rec03", "Random"]
	},
	{
		name: "Block",
		slider: ["Noone", "Normal", "Perfect", "Parry"]
	},
	{
		name: "Block Stance",
		slider: ["Stand", "Crouch", "Random", "Perfect"]
	},
]
//CPU On Hit
options[2] = [
	{
		name: "Inst. Recovery",
		slider: ["Noone", "Random", "Perfect"]
	},
	{
		name: "Dir. Influence",
		slider: ["Noone", "Random", "Up", "Down", "Left", "Right", "In", "Out"]
	},
	{
		name: "Vel. Influence",
		slider: ["Noone", "Random", "Up", "Down", "Left", "Right", "In", "Out"]
	}
]
//Input Recordings
options[3] = [
	{
		name: "Control",
		slider: ["Player2", "CPU", "Rec01", "Rec02", "Rec03", "Random"]
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