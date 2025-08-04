draw_sprite_ext(Sophie_dialogue, 0, 320 - (320*side), 80, side, 1, 0, c_white, 1);
draw_set_font(global.bitmap_font2);

if side == 1 {
draw_set_halign(fa_left);
}
else{
draw_set_halign(fa_right);
}

draw_text_ext( 320 - (256*side), 80 + 24, current_text, 2 + 16, 200)



current_text = string_copy(full_text,1,char_count)