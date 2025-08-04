/// @description Insert description here
// You can write your code in this editor
//Move the player if the Left or Right verb is activated
if (input_check("left_p1")) { x -= 4;}
if (input_check("right_p1")) {x += 4;}

//If the player pressed the "Shoot" button, shoot a bullet
if (input_check_pressed("atk_p1")) show_debug_message("bang");
//If the player pressed the "Shoot" button, shoot a bullet
if (input_check_released("atk_p1")) show_debug_message("re-re-re-load");


/*


	k_right:	"right_p1",
	k_left :	"left_p1",
	k_up:		"up_p1",
	k_down:		"down_p1",
	k_jmp:		"jmp_p1",
	k_atk:		"atk_p1",
	k_spe:		"spe_p1",
	k_blc:		"blc_p1",
	k_grb:		"grb_p1",
	k_pause:	"pause_p1"

*/