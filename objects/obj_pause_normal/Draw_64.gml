/// @description Insert description here
// You can write your code in this editor
if file_exists("pause_save.png"){
	pause_sprite = sprite_add("pause_save.png",0,0,0,0,0)
    if (pause_sprite != noone) {
        draw_sprite(pause_sprite, 0, 0, 0);
    }
}
draw_self();
//Draw the options
draw_set_halign(fa_left);
draw_set_font(global.bitmap_font2)
draw_text_ext_transformed(194,214,"Exit match",4,240,1.5,1.5,0);
draw_text_ext_transformed(194,214+32,"Character select",4,240,1.5,1.5,0);
draw_text_ext_transformed(194,214+64,"Stage select",4,240,1.5,1.5,0);
draw_text_ext_transformed(194,214+96,"Resume",4,240,1.5,1.5,0);
//Draw the cursor
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


//test
draw_text_ext_transformed(48,48,string(selection_p1.cursor),4,240,1.5,1.5,0);
draw_text_ext_transformed(48,96,string(selection_p2.cursor),4,240,1.5,1.5,0);