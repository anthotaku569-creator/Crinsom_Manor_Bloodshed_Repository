function Scr_circular_bar(_x,_y,_value, _max, _color, _radious, _alpha){
	if ( _value > 0 ){
		var i, len, tx, ty, val;
		var numOfSections = 60;
		var sizeOfSection = 360/numOfSections;
		
		val = (_value/_max) * numOfSections;
		
		if val > 1 {
			draw_set_color(_color);
			draw_set_alpha(_alpha);
			
			draw_primitive_begin(pr_trianglefan);
			draw_vertex(_x,_y);
			
			for (var i = 0; i < val; i++){
				len = (i * sizeOfSection) + 90;
				tx = lengthdir_x(_radious, len);
				ty = lengthdir_y(_radious, len);
				draw_vertex(_x + tx, _y + ty);
			}
			
			draw_primitive_end();
		}
		draw_set_alpha(1)
	}
	draw_set_color(c_white);
}