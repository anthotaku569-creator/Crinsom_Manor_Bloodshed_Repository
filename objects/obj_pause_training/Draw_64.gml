/// @description Insert description here
// You can write your code in this editor
if file_exists("pause_save.png"){
	pause_sprite = sprite_add("pause_save.png",0,0,0,0,0)
    if (pause_sprite != noone) {
        draw_sprite(pause_sprite, 0, 0, 0);
    }
}
draw_self();
//Draw the current menu title
draw_set_halign(fa_center);
draw_set_font(global.bitmap_font2)
if cursor == -1 {
	draw_text_ext_transformed(336,156,"____________________",4,240,2,2,0);
}
	switch(actual_menu_screen){
		case -1:
			actual_menu_screen = 0;
			break;
		case 0:
			draw_text_ext_transformed(336,156,"Normal Menu",4,240,2,2,0);
			break;
		case 1:
			draw_text_ext_transformed(336,156,"CPU Defense",4,240,2,2,0);
			break;
		case 2:
			draw_text_ext_transformed(336,156,"CPU On Hit",4,240,2,2,0);
			break;
		case 3:
			draw_text_ext_transformed(336,156,"Input Recordings",4,240,2,2,0);
			break;
		case 4:
			actual_menu_screen = 0;
			break;
	}


//Draw the options
draw_set_halign(fa_left);
draw_set_font(global.bitmap_font2)
draw_text_ext_transformed(80, 80, selected, 4, 240, 1.5, 1.5, 0);

if actual_menu_screen > -1  and actual_menu_screen < 4 {
	for (var i = 0; i < max_options; i += 1) {
		draw_text_ext_transformed(192, 190 + (32*i), options[actual_menu_screen][i].name, 4, 240, 1.5, 1.5, 0);
		switch (options[actual_menu_screen][i].name){
			case "Recovery":
			case "Block":
			case "Block Stance":
			case "Grab parry":
			case "Inst. Recovery":
			case "Dir. Influence":
			case "Vel. Influence":
			case "Control":
				draw_text_ext_transformed(
					192 + 200, 190 + (32*i),
					options[actual_menu_screen][i].slider[
					ds_map_find_value(match_controller.training_settings, options[actual_menu_screen][i].name)
					], 4, 240, 1.5, 1.5, 0
				);
				break;
			case "Delay":
				draw_text_ext_transformed(
					192 + 200, 190 + (32*i),
					ds_map_find_value(match_controller.training_settings, options[actual_menu_screen][i].name)
					, 4, 240, 1.5, 1.5, 0
				);
				break;
		}
	}
}

//Draw the cursor
if cursor != -1 {
	draw_sprite(Spr_cursor1, 0, 192 - 48, 190 + (32*cursor));
}

/*
if selection_p1.selected == -1{
	draw_sprite(Spr_cursor1, 0, 194-48, 214 + (32*selection_p1.cursor));
}
else{
	draw_text_ext_transformed(194-48, 214 + (32*selection_p1.cursor),"!!!",4,240,1.5,1.5,0);
}
if selection_p2.selected == -1{
	draw_sprite(Spr_cursor2, 0, 194-48, 214 + (32*selection_p2.cursor));
}
else{
	draw_text_ext_transformed(194-48, 214 + (32*selection_p2.cursor),"!!!",4,240,1.5,1.5,0);
}
*/


//test
//draw_text_ext_transformed(48,48,string(selection_p1.cursor),4,240,1.5,1.5,0);
//draw_text_ext_transformed(48,96,string(selection_p2.cursor),4,240,1.5,1.5,0);