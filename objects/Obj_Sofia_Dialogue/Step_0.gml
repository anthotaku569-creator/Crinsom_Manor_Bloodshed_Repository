/*for (var i = 0; i < 4; i += 0.1){
	current_text += string_char_at(full_text, ceil(i));
}*/

if char_count < string_length(full_text){
	char_count+=0.2
}

timer--;

if timer <= 0 {
	instance_destroy();
}