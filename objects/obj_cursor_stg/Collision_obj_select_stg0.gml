/*if input_check_pressed(inputs.k_atk, wich_player) and stg_selected == noone{
	//stg_selected = other.stg_selected;
	stg_name =  other.stg_name;
	stg_banner = other.stg_banner;
}*/

stg_name =  other.stg_name;
stg_banner = other.stg_banner;
if input_check_pressed(inputs.k_atk, wich_player){
	stg_selected = other.stg_selected;
}