// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_fonts(){
//Spanish font
var map_string = "";
var map_numb = "";
for (var i = 32; i < 255; i += 1){
	map_string+=chr(i)
}
for (var j = 48; j < 58; j += 1){
	map_numb+=chr(j)
}
//global.bitmap_font=font_add_sprite_ext(Fuente2,map_string,false,0)
global.bitmap_font=font_add_sprite_ext(spr_font_1,map_string,true,1)
global.bitmap_font2=font_add_sprite_ext(spr_font_2,map_string,true,1)
global.bitmap_font2_outline=font_add_sprite_ext(spr_font_2_out,map_string,true,1)
global.bitmap_digits=font_add_sprite_ext(spr_font_3,map_numb,true,1)
global.bitmap_digits2=font_add_sprite_ext(spr_font_4,map_numb,true,2)
global.bitmap_effect_numbs=font_add_sprite_ext(spr_effect_numb,map_numb,true,2)

//draw_set_font(global.bitmap_font)
}