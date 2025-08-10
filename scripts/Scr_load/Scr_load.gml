function Scr_load(_user){
	user_controller.user_number = _user;
	var filename = "SG_WTGO_" + string(_user)+ ".json";
	if (!file_exists(filename)){
		return
	}
	var file = file_text_open_read(filename);
	var json_string = file_text_read_string(file);
	file_text_close(file);
	var save_data = json_parse(json_string);
	Apply_Save_Data(save_data, json_string);
	
}

function Apply_Save_Data(data, json_string) {
	//
	//Setting loads
	//control
	input_bindings_read(data.settings.controls.player1, 1);
	input_bindings_read(data.settings.controls.player2, 2);
}