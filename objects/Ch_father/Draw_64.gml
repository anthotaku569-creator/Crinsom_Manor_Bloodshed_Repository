/// @description Insert description here
// You can write your code in this editor




if global.training_mode == true{
	draw_set_alpha(0.6);
	draw_set_font(global.bitmap_font2)
	switch(wich_player){
		case 1:
		draw_rectangle_color(0 , 90 - 8, 160, 306 + 48, c_white, c_white, c_white, c_white, false)
		draw_set_alpha(1);
		draw_set_font(global.bitmap_font2)
		draw_set_halign(fa_left);
		draw_text(0 ,90, "Velocity : " + string(velx + con_velx) + " x; " + string(vely + con_vely) + " y");
		draw_text(0 ,114, "Guts : " + string((abs(guts))));
		draw_text(0 ,138, "Dmg Scaling : " + string(scaling.dmg));
		draw_text(0 ,162, "Kbck Scaling : " + string(scaling.kbck));
		draw_text(0 ,186, "Combo Dmg : " + string(scaling.cum_dmg) + "(" + string((scaling.cum_dmg/bars.HealthBar.maximum)*100) + "%)");
		draw_text(0 ,210, "Stun : " + string(scaling.dmg));
		draw_text(0 ,234, "<<Attack>>");
		if current_attack != noone {
			draw_text(0 ,258, "Move duration : " + string(sprite_get_number(current_attack.animation)));
			if array_length(current_attack.hboxs) > 0{
				draw_text(0 ,282, "Startup : " + string(current_attack.hboxs[0].create) + "|" + string(actual_startup));
			}
			else{
				draw_text(0 ,282, "Startup : ...");
			}
		}
		else{
			draw_text(0 ,282, "Move duration : ...");
			draw_text(0 ,258, "Startup : ...");
		}
		draw_text(0 ,306, "Advantage : " + string(frame_data));
		switch (prot){
			case 0: draw_text(0 ,330, "Inmunity : noone"); break;
			case 1: draw_text(0 ,330, "Inmunity : Armor"); break;
			case 2: draw_text(0 ,330, "Inmunity : Hit Invul."); break;
			case 3: draw_text(0 ,330, "Inmunity : Grab Invul."); break;
			case 4: draw_text(0 ,330, "Inmunity : Proyectile Inv."); break;
			case 5: draw_text(0 ,330, "Inmunity : Invulnerable"); break;
				
		}
		//n_hitboxes
		break;
		case 2:
		draw_rectangle_color(640 , 90 - 8, 640 -  160, 306 + 48, c_white, c_white, c_white, c_white, false)
		draw_set_alpha(1);
		draw_set_font(global.bitmap_font2)
		draw_set_halign(fa_right);
		draw_text(640 ,90, "Velocity : " + string(velx) + " x; " + string(vely) + " y");
		draw_text(640 ,114, "Guts : " + string((abs(guts))));
		draw_text(640 ,138, "Dmg Scaling : " + string(scaling.dmg));
		draw_text(640 ,162, "Kbck Scaling : " + string(scaling.kbck));
		draw_text(640 ,186, "Combo Dmg : " + string(scaling.cum_dmg) + "(" + string((scaling.cum_dmg/bars.HealthBar.maximum)*100) + "%)");
		draw_text(640 ,210, "Stun : " + string(scaling.dmg));
		draw_text(640 ,234, "<<Attack>>");
		if current_attack != noone {
			draw_text(640 ,282, "Move duration : " + string(sprite_get_number(current_attack.animation)));
			if array_length(current_attack.hboxs) > 0{
				draw_text(640 ,258, "Startup : " + string(current_attack.hboxs[0].create) + "|" + string(actual_startup));
			}
			else{
				draw_text(640 ,258, "Startup : ...");
			}
		}
		else{
			draw_text(640 ,282, "Move duration : ...");
			draw_text(640 ,258, "Startup : ...");
		}
		draw_text(640 ,306, "Advantage : " + string(frame_data));
		switch (prot){
			case 0: draw_text(640 ,330, "Inmunity : noone"); break;
			case 1: draw_text(640 ,330, "Inmunity : Armor"); break;
			case 2: draw_text(640 ,330, "Inmunity : Hit Invul."); break;
			case 3: draw_text(640 ,330, "Inmunity : Grab Invul."); break;
			case 4: draw_text(640 ,330, "Inmunity : Proyectile Inv."); break;
			case 5: draw_text(640 ,330, "Inmunity : Invulnerable"); break;
				
		}
		
		break;
	}

	draw_set_alpha(1);
}

/*
draw_set_font(global.bitmap_font2)
draw_set_halign(fa_left);

switch(wich_player){
	case 1:
		draw_set_color(c_black);
		draw_text(0 ,0, "Velx	:" + string(velx));
		draw_text(0,24, "Vely	:" + string(vely));
		draw_text(0,48, "coyote	:" + string(coyote_time));
		draw_text(0,72, "step_frames	:" + string(step_frames));
		draw_text(0,96,"HP	:" + string(bars.HealthBar.actual)
						+ " / " + string(bars.HealthBar.maximum));
		draw_text(0,120,"SP	:" + string(bars.HitstunBar.actual)
						+ " / " + string(bars.HitstunBar.maximum));
		draw_text(0,144,"IP	:" + string(bars.InspirationBar.actual)
						+ " / " + string(bars.InspirationBar.maximum));
		draw_text(0,168, "scaling	:" + string(scaling.dmg) + " | " + string(scaling.kbck) + " | " + string(scaling.combo));
		draw_text(0 ,192, "Charge:" + string(bars.Charge.actual));
		draw_text(0 ,216, "Protection:" + string(prot));
		//draw_text(0 ,240, "Input atack :" + string(input_check("atk_p1")));
		//draw_text(0 ,264, "Input special :" + string(input_check("spe_p1")));
		break;
	case 2:
		draw_set_color(c_black);
		draw_text(240 ,0, "Velx	:" + string(velx));
		draw_text(240,24, "Vely	:" + string(vely));
		draw_text(240,48, "coyote	:" + string(coyote_time));
		draw_text(240,72, "step_frames	:" + string(step_frames));
		draw_text(240,96,"HP	:" + string(bars.HealthBar.actual)
						+ " / " + string(bars.HealthBar.maximum));
		draw_text(240,120,"SP	:" + string(bars.HitstunBar.actual)
						+ " / " + string(bars.HitstunBar.maximum));
		draw_text(240,144,"IP	:" + string(bars.InspirationBar.actual)
						+ " / " + string(bars.InspirationBar.maximum));
		draw_text(240,168, "scaling	:" + string(scaling.dmg) + " | " + string(scaling.kbck) + " | " + string(scaling.combo));
		draw_text(240 ,192, "Charge:" + string(bars.Charge.actual));
		draw_text(240 ,216, "Protection:" + string(prot));
		//draw_text(240 ,240, "Input atack :" + string(input_check("atk_p2")));
		//draw_text(240 ,264, "Input special :" + string(input_check("spe_p2")));
		break;
	default:
		break;
}
*/
