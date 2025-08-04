// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_font_outline(_x, _y, _string, _xscale, _yscale, _angle, outline_color, string_color){
	var xx,yy;  
	xx = _x;  
	yy = _y;  
  
	//Outline  
	draw_set_color(outline_color);
	draw_set_alpha(0.5);
	draw_text_transformed(xx+1, yy+1, _string, _xscale, _yscale, _angle);  
	draw_text_transformed(xx-1, yy-1, _string, _xscale, _yscale, _angle);    
	draw_text_transformed(xx,   yy+1, _string, _xscale, _yscale, _angle);   
	draw_text_transformed(xx+1,   yy, _string, _xscale, _yscale, _angle);    
	draw_text_transformed(xx,   yy-1, _string, _xscale, _yscale, _angle);  
	draw_text_transformed(xx-1,   yy, _string, _xscale, _yscale, _angle);    
	draw_text_transformed(xx-1, yy+1, _string, _xscale, _yscale, _angle);   
	draw_text_transformed(xx+1, yy-1, _string, _xscale, _yscale, _angle);    
  
	//Text  
	draw_set_color(string_color);
	draw_set_alpha(1);
	draw_text_transformed(xx, yy, _string, _xscale, _yscale, _angle);  
}