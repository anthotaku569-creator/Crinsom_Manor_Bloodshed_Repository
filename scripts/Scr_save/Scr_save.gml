function Scr_save(){
	var save_data = {};
	var filename = "SG_WTGO_" + string(user_controller.user_number)+ ".json";
	//Setting saves
	save_data.settings = {
		controls: {
			player1: input_bindings_write(1),
			player2: input_bindings_write(2)
		}
	}
	
	// Save to file
	var json_string = json_stringify(save_data);
	var file = file_text_open_write(filename);
	file_text_write_string(file, json_string);
	file_text_close(file);
}