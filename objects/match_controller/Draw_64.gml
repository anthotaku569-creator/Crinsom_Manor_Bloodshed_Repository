/// @description match_drawing
// You can write your code in this editor



if sprite_index == hitbox_spr {
draw_sprite(HUD_fighting,0,0,0)

draw_sprite_ext(global.player_one_selection.smol,0,0,0,1,1,0,c_white,1)
draw_sprite_ext(global.player_two_selection.smol,0,640,0,-1,1,0,c_white,1)

#region COMBO COUNTER

if player_one.scaling.combo > player_two.scaling.combo {
	draw_sprite_ext(Spr_ComboCounter,1,320,32,1,1,0,c_white,1)
	draw_set_font(global.bitmap_digits)
	draw_set_halign(fa_center)
	draw_set_color(c_black)
	draw_text(320,32,string(player_one.scaling.combo));
}

if player_two.scaling.combo > player_one.scaling.combo {
	draw_sprite_ext(Spr_ComboCounter,0,320,32,1,1,0,c_white,1)
	draw_set_font(global.bitmap_digits)
	draw_set_halign(fa_center)
	draw_set_color(c_black)
	draw_text(320,32,string(player_two.scaling.combo));
}

draw_set_color(c_white);
	
#endregion


#region Lives Player 1
switch(deaths_p1){
	case 0:
		draw_sprite(Spr_stock,0,258,50);
		draw_sprite(Spr_stock,0,274,50);
		break;
	case 1:
		draw_sprite(Spr_stock,0,258,50);
		draw_sprite(Spr_stock,1,274,50);
		break;
	case 2:
		draw_sprite(Spr_stock,1,258,50);
		draw_sprite(Spr_stock,1,274,50);
		break;
}
#endregion

#region Health Player 1
//var health_p1 = (power(player_one.bars.HealthBar.actual, 2)/power(player_one.bars.HealthBar.maximum, 2))*204;
//var white_health_p1 = (power(player_one.bars.HealthBar.show, 2)/power(player_one.bars.HealthBar.maximum, 2))*204;
var health_p1 = ((player_one.bars.HealthBar.actual)/(player_one.bars.HealthBar.maximum))*204;
var white_health_p1 = ((player_one.bars.HealthBar.show)/(player_one.bars.HealthBar.maximum))*204;
draw_sprite_part_ext(
	Spr_HealthBar, 1,
	0, 0,
	white_health_p1, 12,
	82+204, 2,
	-1, 1,
	c_white, 1
);

draw_sprite_part_ext(
	Spr_HealthBar, 0,
	0, 0,
	health_p1, 12,
	82+204, 2,
	-1, 1,
	c_white, 1
);
#endregion

#region Inspiration Player 1
var insp_p1 = (bloodlust/player_one.bars.InspirationBar.maximum)*204;

if (bloodlust < player_one.bars.InspirationBar.maximum){
	draw_sprite_part_ext(
		Spr_HealthBar, 0,
		0, 0,
		insp_p1, 12,
		286, 18,
		-1, 1,
		c_white, 1
	);
}
else{
	draw_sprite_part_ext(
		Spr_HealthBar, 1,
		0, 0,
		insp_p1, 12,
		286, 18,
		-1, 1,
		c_white, 1
	);
	draw_set_font(global.bitmap_font2_outline);
	draw_set_halign(fa_right)
	draw_text(284, 34,"FULL");
}

#endregion

#region draw status Player 1

draw_set_font(global.bitmap_effect_numbs);

if player_one.stt_effects.burn > 0 {
	var burn_sec_p1 = ceil(player_one.stt_effects.burn/60)
	draw_sprite(Spr_status_stickers,0,248,48)
	draw_set_color(c_red)
	draw_set_halign(fa_center)
	draw_text(248, 64,burn_sec_p1);
}
if player_one.stt_effects.paralysis > 0 {
	draw_sprite(Spr_status_stickers,1,232,48)
	draw_set_color(c_orange)
	draw_set_halign(fa_center)
	draw_text(232, 64, ceil(player_one.stt_effects.paralysis));
}
if player_one.stt_effects.poison > 0 {
	var poison_sec_p1 = ceil(player_one.stt_effects.poison/60)
	draw_sprite(Spr_status_stickers,2,216,48)
	draw_set_color(c_green)
	draw_set_halign(fa_center)
	draw_text(216, 64,poison_sec_p1);
}
if player_one.stt_effects.cold > 0 {
	var cold_sec_p1 = ceil(player_one.stt_effects.cold/60)
	draw_sprite(Spr_status_stickers,3,200,48)
	draw_set_color(c_blue)
	draw_set_halign(fa_center)
	draw_text(200, 64,cold_sec_p1);
}
if player_one.stt_effects.berserker > 0 {
	var berserker_sec_p1 = ceil(player_one.stt_effects.berserker/60)
	draw_sprite(Spr_status_stickers,4,184,48)
	draw_set_color(c_purple)
	draw_set_halign(fa_center)
	draw_text(184, 64,berserker_sec_p1);
}
if player_one.stt_effects.curse > 0 {
	var curse_sec_p1 = ceil(player_one.stt_effects.curse/60)
	draw_sprite(Spr_status_stickers,5,168,48)
	draw_set_color(c_purple)
	draw_set_halign(fa_center)
	draw_text(168, 64,curse_sec_p1);
}
if player_one.stt_effects.regenerate > 0 {
	var regenerate_sec_p1 = ceil(player_one.stt_effects.regenerate/60)
	draw_sprite(Spr_status_stickers,6,152,48)
	draw_set_color(c_teal)
	draw_set_halign(fa_center)
	draw_text(152, 64,regenerate_sec_p1);
}
if player_one.stt_effects.passion > 0 {
	var passion_sec_p1 = ceil(player_one.stt_effects.passion/60)
	draw_sprite(Spr_status_stickers,7,136,48)
	draw_set_color(c_fuchsia)
	draw_set_halign(fa_center)
	draw_text(136, 64,passion_sec_p1);
}
draw_set_color(c_white)

#endregion

#region Lives Player 2
switch(deaths_p2){
	case 0:
		draw_sprite(Spr_stock,0,370,50);
		draw_sprite(Spr_stock,0,354,50);
		break;
	case 1:
		draw_sprite(Spr_stock,0,370,50);
		draw_sprite(Spr_stock,1,354,50);
		break;
	case 2:
		draw_sprite(Spr_stock,1,370,50);
		draw_sprite(Spr_stock,1,354,50);
		break;
}
#endregion

#region Health Player 2
//var health_p2 = (power(player_two.bars.HealthBar.actual, 2)/power(player_two.bars.HealthBar.maximum, 2))*204;
//var white_health_p2 = (power(player_two.bars.HealthBar.show, 2)/power(player_two.bars.HealthBar.maximum, 2))*204;
var health_p2 = ((player_two.bars.HealthBar.actual)/(player_two.bars.HealthBar.maximum))*204;
var white_health_p2 = ((player_two.bars.HealthBar.show)/(player_two.bars.HealthBar.maximum))*204;

draw_sprite_part_ext(
	Spr_HealthBar, 1,
	0, 0,
	white_health_p2, 12,
	558-204, 2,
	1, 1,
	c_white, 1
);

draw_sprite_part_ext(
	Spr_HealthBar, 0,
	0, 0,
	health_p2, 12,
	558-204, 2,
	1, 1,
	c_white, 1
);
#endregion

#region Inspiration Player 2
var insp_p2 = ((100 - bloodlust)/100)*204;

if (100 - bloodlust < 100){
	draw_sprite_part_ext(
		Spr_HealthBar, 0,
		0, 0,
		insp_p2, 18,
		354, 16,
		1, 1,
		c_white, 1
	);
}
else{
	draw_sprite_part_ext(
		Spr_HealthBar, 1,
		0, 0,
		insp_p2, 18,
		354, 16,
		1, 1,
		c_white, 1
	);
	draw_set_font(global.bitmap_font);
	draw_set_halign(fa_left)
	draw_text(356, 34,"bitmap_font2_outline");
}

#endregion

#region draw status Player 2

draw_set_font(global.bitmap_effect_numbs);

if player_two.stt_effects.burn > 0 {
	var burn_sec_p2 = ceil(player_two.stt_effects.burn/60)
	draw_sprite(Spr_status_stickers,0,400,32)
	draw_set_color(c_red)
	draw_set_halign(fa_center)
	draw_text(400, 48,burn_sec_p2);
}
if player_two.stt_effects.paralysis > 0 {
	draw_sprite(Spr_status_stickers,1,416,32)
	draw_set_color(c_orange)
	draw_set_halign(fa_center)
	draw_text(416, 48,ceil(player_two.stt_effects.paralysis));
}
if player_two.stt_effects.poison > 0 {
	var poison_sec_p2 = ceil(player_two.stt_effects.poison/60)
	draw_sprite(Spr_status_stickers,2,432,32)
	draw_set_color(c_green)
	draw_set_halign(fa_center)
	draw_text(432, 48,poison_sec_p2);
}
if player_two.stt_effects.cold > 0 {
	var cold_sec_p2 = ceil(player_two.stt_effects.cold/60)
	draw_sprite(Spr_status_stickers,3,448,32)
	draw_set_color(c_blue)
	draw_set_halign(fa_center)
	draw_text(448, 48,cold_sec_p2);
}
if player_two.stt_effects.berserker > 0 {
	var berserker_sec_p2 = ceil(player_two.stt_effects.berserker/60)
	draw_sprite(Spr_status_stickers,4,464,32)
	draw_set_color(c_purple)
	draw_set_halign(fa_center)
	draw_text(464, 48,berserker_sec_p2);
}
if player_two.stt_effects.curse > 0 {
	var curse_sec_p2 = ceil(player_two.stt_effects.curse/60)
	draw_sprite(Spr_status_stickers,5,480,32)
	draw_set_color(c_purple)
	draw_set_halign(fa_center)
	draw_text(480, 48,curse_sec_p2);
}
if player_two.stt_effects.regenerate > 0 {
	var regenerate_sec_p2 = ceil(player_two.stt_effects.regenerate/60)
	draw_sprite(Spr_status_stickers,6,496,32)
	draw_set_color(c_teal)
	draw_set_halign(fa_center)
	draw_text(496, 48,regenerate_sec_p2);
}
if player_two.stt_effects.passion > 0 {
	var passion_sec_p2 = ceil(player_two.stt_effects.passion/60)
	draw_sprite(Spr_status_stickers,7,512,32)
	draw_set_color(c_fuchsia)
	draw_set_halign(fa_center)
	draw_text(512, 48,passion_sec_p2);
}
draw_set_color(c_white)

#endregion

#region removing

/*

#region Hitstun Player 1
var stun_p2 = (player_two.bars.HitstunBar.actual/player_two.bars.HitstunBar.maximum)*204;

if stun_p2 > player_two.bars.HitstunBar.maximum{
	stun_p2 = 204
}

var stun_text2 = "";

gpu_set_blendmode_ext(bm_dest_colour, bm_inv_src_alpha);

switch(player_two.bars.HitstunBar.kdwn){
	case 0:
		draw_sprite_part_ext(
			Spr_StunBar, 0,
			204 - stun_p2, 0,
			stun_p2, 16,
			352, 16,
			1, 1,
			c_white, 1
		);
		if player_two.stt_effects.paralysis > 0{
			stun_text2 = "paralysis";
		}
		else{
			stun_text2 = "";
		}
		break;
	case 1:
		draw_sprite_part_ext(
			Spr_StunBar, 0,
			204 - stun_p2, 0,
			stun_p2, 16,
			352, 16,
			1, 1,
			c_white, 1
		);
		if player_two.stt_effects.paralysis > 0{
			stun_text2 = "paralysis";
		}
		else{
			stun_text2 = "knockdown";
		}
		break;
	case 2:
		draw_sprite_part_ext(
			Spr_StunBar, 1,
			204 - stun_p2, 0,
			stun_p2, 16,
			352, 16,
			1, 1,
			c_white, 1
		);
		if player_two.stt_effects.paralysis > 0{
			stun_text2 = "paralysis";
		}
		else{
			stun_text2 = "HEAVY knockdown";
		}
		break;
}

if (player_two.bars.HitstunBar.actual == 0){
	if player_two.stt_effects.paralysis > 0{
		stun_text2 = "paralysis";
	}
	else{
		stun_text2 = "";
	}
}

gpu_set_blendmode(bm_normal);
draw_set_font(global.bitmap_font);
draw_set_halign(fa_left)
draw_text(355, 19,stun_text2);

#endregion

#region Hitstun Player 1
var stun_p1 = (player_one.bars.HitstunBar.actual/player_one.bars.HitstunBar.maximum)*204;

if stun_p1 > player_one.bars.HitstunBar.maximum{
	stun_p1 = 204
}

var stun_text1 = "";

gpu_set_blendmode_ext(bm_dest_colour, bm_inv_src_alpha);

switch(player_one.bars.HitstunBar.kdwn){
	case 0:
		draw_sprite_part_ext(
			Spr_StunBar, 0,
			204 - stun_p1, 0,
			stun_p1, 16,
			288, 16,
			-1, 1,
			c_white, 1
		);
		if player_one.stt_effects.paralysis > 0{
			stun_text1 = "paralysis";
		}
		else{
			stun_text1 = "";
		}
		break;
	case 1:
		draw_sprite_part_ext(
			Spr_StunBar, 0,
			204 - stun_p1, 0,
			stun_p1, 16,
			288, 16,
			-1, 1,
			c_white, 1
		);
		if player_one.stt_effects.paralysis > 0{
			stun_text1 = "paralysis";
		}
		else{
			stun_text1 = "knockdown";
		}
		break;
	case 2:
		draw_sprite_part_ext(
			Spr_StunBar, 1,
			204 - stun_p1, 0,
			stun_p1, 16,
			288, 16,
			-1, 1,
			c_white, 1
		);
		if player_one.stt_effects.paralysis > 0{
			stun_text1 = "paralysis";
		}
		else{
			stun_text1 = "HEAVY knockdown";
		}
		break;
}

if (player_one.bars.HitstunBar.actual == 0){
	if player_one.stt_effects.paralysis > 0{
		stun_text1 = "paralysis";
	}
	else{
		stun_text1 = "";
	}
}

gpu_set_blendmode(bm_normal);
draw_set_font(global.bitmap_font);
draw_set_halign(fa_right)
draw_text(286, 19,stun_text1);

#endregion


#region draw charge p1 or float p1
if player_one.bars.Charge.actual < 60 {
	Scr_circular_bar(12, 72, player_one.bars.Charge.actual, 60, c_yellow, 12, 1)
}
if player_one.extras.float.time < 120 {
	Scr_circular_bar(48, 72, player_one.extras.float.time, 120, c_aqua, 12, 1)
}
#endregion

#region draw charge p2 or float p2
if player_two.bars.Charge.actual < 60 {
	Scr_circular_bar(592, 64, player_two.bars.Charge.actual, 60, c_yellow, 12, 1)
}
if player_two.extras.float.time < 120 {
	Scr_circular_bar(568, 64, player_two.extras.float.time, 120, c_aqua, 12, 1)
}
#endregion

*/
#endregion

draw_set_font(global.bitmap_digits)
draw_set_halign(fa_center)
//draw_text(320,0,string(ceil(time/(60))));
	draw_text_transformed(320,0,string(ceil(time/(60))),1,1,0);
visible = true;

	if (redeye) {
		draw_set_color(c_red);
		draw_set_alpha(0.5);
		gpu_set_blendmode_ext(bm_dest_color, bm_zero);


		draw_rectangle(0, 0,
			camera_get_view_width(view_camera[0]) * 2,
			camera_get_view_height(view_camera[0]) * 2,
			false
		);

		draw_set_color(c_white);
		draw_set_alpha(1);
		gpu_set_blendmode_ext(bm_src_alpha, bm_inv_src_colour);
	}
}
