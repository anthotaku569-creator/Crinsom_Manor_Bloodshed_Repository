/// @description match_drawing
// You can write your code in this editor



if sprite_index == hitbox_spr {
draw_sprite(HUD_fighting,0,0,0)

pal_swap_set(player_one.pallete.sprite,player_one.pallete.i,false);
draw_sprite_ext(global.player_one_selection.smol,0,0,0,1,1,0,c_white,1)
pal_swap_set(player_two.pallete.sprite,player_two.pallete.i,false);
draw_sprite_ext(global.player_two_selection.smol,0,640,0,-1,1,0,c_white,1)
pal_swap_reset();

#region COMBO COUNTER

if player_one.scaling.combo > player_two.scaling.combo {
	draw_sprite_ext(Spr_ComboCounter,1,320,64,1,1,0,c_white,1)
	draw_set_font(global.bitmap_digits)
	draw_set_halign(fa_center)
	draw_set_color(c_black)
	draw_text(320,64,string(player_one.scaling.combo));
}

if player_two.scaling.combo > player_one.scaling.combo {
	draw_sprite_ext(Spr_ComboCounter,0,320,64,1,1,0,c_white,1)
	draw_set_font(global.bitmap_digits)
	draw_set_halign(fa_center)
	draw_set_color(c_black)
	draw_text(320,64,string(player_two.scaling.combo));
}

draw_set_color(c_white);
	
#endregion


#region Lives Player 1
switch(deaths_p1){
	case 0:
		draw_sprite(Spr_stock,0,258,64);
		draw_sprite(Spr_stock,0,274,64);
		break;
	case 1:
		draw_sprite(Spr_stock,0,258,64);
		draw_sprite(Spr_stock,1,274,64);
		break;
	case 2:
		draw_sprite(Spr_stock,1,258,64);
		draw_sprite(Spr_stock,1,274,64);
		break;
}
#endregion

#region Health Player 1
//var health_p1 = (power(player_one.bars.HealthBar.actual, 2)/power(player_one.bars.HealthBar.maximum, 2))*204;
//var white_health_p1 = (power(player_one.bars.HealthBar.show, 2)/power(player_one.bars.HealthBar.maximum, 2))*204;
var health_p1 = ((player_one.bars.HealthBar.actual)/(player_one.bars.HealthBar.maximum))*206;
var white_health_p1 = ((player_one.bars.HealthBar.show)/(player_one.bars.HealthBar.maximum))*206;
draw_sprite_part_ext(
	Spr_HealthBar, 1,
	0, 0,
	white_health_p1, 10,
	82+204, 11,
	-1, 1,
	c_white, 1
);

draw_sprite_part_ext(
	Spr_HealthBar, 0,
	0, 0,
	health_p1, 10,
	82+204, 11,
	-1, 1,
	c_white, 1
);

if global.training_mode == true{
	draw_set_font(global.bitmap_font2);
	draw_set_halign(fa_right);
	draw_text(84+204, 11, string(player_one.bars.HealthBar.actual));
}

#endregion

#region Inspiration Player 1
var insp_p1 = (bloodlust/player_one.bars.InspirationBar.maximum)*238;

if (bloodlust < player_one.bars.InspirationBar.maximum){
	draw_sprite_part_ext(
		Spr_InspBar, 0,
		0, 0,
		insp_p1, 10,
		320, 43,
		-1, 1,
		c_white, 1
	);
}
else{
	draw_sprite_part_ext(
		Spr_InspBar, 1,
		0, 0,
		insp_p1, 10,
		320, 43,
		-1, 1,
		c_white, 1
	);
}

#endregion

#region Humanity Player 1
var human_p1 = (player_one.bars.Humanity.actual/player_one.bars.Humanity.maximum)*62;

draw_sprite_part_ext(
	Spr_HumanBar, 0,
	0, 0,
	human_p1, 10,
	17, 83,
	1, 1,
	c_white, 1
);
#endregion

#region draw status Player 1

draw_set_font(global.bitmap_effect_numbs);

if player_one.stt_effects.burn > 0 {
	var burn_sec_p1 = ceil(player_one.stt_effects.burn/60)
	draw_sprite(Spr_status_stickers,0,248,53)
	draw_set_color(c_red)
	draw_set_halign(fa_center)
	draw_text(248, 53 + 64 - 48,burn_sec_p1);
}
if player_one.stt_effects.paralysis > 0 {
	draw_sprite(Spr_status_stickers,1,232,53)
	draw_set_color(c_orange)
	draw_set_halign(fa_center)
	draw_text(232, 53 + 64 - 48, ceil(player_one.stt_effects.paralysis));
}
if player_one.stt_effects.poison > 0 {
	var poison_sec_p1 = ceil(player_one.stt_effects.poison/60)
	draw_sprite(Spr_status_stickers,2,216,53)
	draw_set_color(c_green)
	draw_set_halign(fa_center)
	draw_text(216, 53 + 64 - 48,poison_sec_p1);
}
if player_one.stt_effects.cold > 0 {
	var cold_sec_p1 = ceil(player_one.stt_effects.cold/60)
	draw_sprite(Spr_status_stickers,3,200,53)
	draw_set_color(c_blue)
	draw_set_halign(fa_center)
	draw_text(200, 53 + 64 - 48,cold_sec_p1);
}
if player_one.stt_effects.berserker > 0 {
	var berserker_sec_p1 = ceil(player_one.stt_effects.berserker/60)
	draw_sprite(Spr_status_stickers,4,184,53)
	draw_set_color(c_purple)
	draw_set_halign(fa_center)
	draw_text(184, 53 + 64 - 48,berserker_sec_p1);
}
if player_one.stt_effects.curse > 0 {
	var curse_sec_p1 = ceil(player_one.stt_effects.curse/60)
	draw_sprite(Spr_status_stickers,5,168,53)
	draw_set_color(c_purple)
	draw_set_halign(fa_center)
	draw_text(168, 53 + 64 - 48,curse_sec_p1);
}
if player_one.stt_effects.regenerate > 0 {
	var regenerate_sec_p1 = ceil(player_one.stt_effects.regenerate/60)
	draw_sprite(Spr_status_stickers,6,152,53)
	draw_set_color(c_teal)
	draw_set_halign(fa_center)
	draw_text(152, 53 + 64 - 48,regenerate_sec_p1);
}
if player_one.stt_effects.passion > 0 {
	var passion_sec_p1 = ceil(player_one.stt_effects.passion/60)
	draw_sprite(Spr_status_stickers,7,136,53)
	draw_set_color(c_fuchsia)
	draw_set_halign(fa_center)
	draw_text(136, 53 + 64 - 48,passion_sec_p1);
}
draw_set_color(c_white)

#endregion

#region Lives Player 2
switch(deaths_p2){
	case 0:
		draw_sprite(Spr_stock,0,370,64);
		draw_sprite(Spr_stock,0,354,64);
		break;
	case 1:
		draw_sprite(Spr_stock,0,370,64);
		draw_sprite(Spr_stock,1,354,64);
		break;
	case 2:
		draw_sprite(Spr_stock,1,370,64);
		draw_sprite(Spr_stock,1,354,64);
		break;
}
#endregion

#region Health Player 2
//var health_p2 = (power(player_two.bars.HealthBar.actual, 2)/power(player_two.bars.HealthBar.maximum, 2))*204;
//var white_health_p2 = (power(player_two.bars.HealthBar.show, 2)/power(player_two.bars.HealthBar.maximum, 2))*204;
var health_p2 = ((player_two.bars.HealthBar.actual)/(player_two.bars.HealthBar.maximum))*206;
var white_health_p2 = ((player_two.bars.HealthBar.show)/(player_two.bars.HealthBar.maximum))*206;

draw_sprite_part_ext(
	Spr_HealthBar, 1,
	0, 0,
	white_health_p2, 10,
	558-204, 11,
	1, 1,
	c_white, 1
);

draw_sprite_part_ext(
	Spr_HealthBar, 0,
	0, 0,
	health_p2, 10,
	558-204, 11,
	1, 1,
	c_white, 1
);

if global.training_mode == true{
	draw_set_font(global.bitmap_font2);
	draw_set_halign(fa_left);
	draw_text(560-204, 11, string(player_two.bars.HealthBar.actual));
}
#endregion

#region Inspiration Player 2
var insp_p2 = ((100 - bloodlust)/100)*238;

if (100 - bloodlust < 100){
	draw_sprite_part_ext(
		Spr_InspBar, 0,
		0, 0,
		insp_p2, 10,
		320, 43,
		1, 1,
		c_white, 1
	);
}
else{
	draw_sprite_part_ext(
		Spr_InspBar, 1,
		0, 0,
		insp_p2, 10,
		320, 43,
		1, 1,
		c_white, 1
	);
}

#endregion

#region Humanity Player 2
var human_p2 = (player_two.bars.Humanity.actual/player_two.bars.Humanity.maximum)*62;

draw_sprite_part_ext(
	Spr_HumanBar, 0,
	0, 0,
	human_p2, 10,
	623, 83,
	-1, 1,
	c_white, 1
);
#endregion

#region draw status Player 2

draw_set_font(global.bitmap_effect_numbs);

if player_two.stt_effects.burn > 0 {
	var burn_sec_p2 = ceil(player_two.stt_effects.burn/60)
	draw_sprite(Spr_status_stickers,0,400,53)
	draw_set_color(c_red)
	draw_set_halign(fa_center)
	draw_text(400, 53 + 64 - 48,burn_sec_p2);
}
if player_two.stt_effects.paralysis > 0 {
	draw_sprite(Spr_status_stickers,1,416,53)
	draw_set_color(c_orange)
	draw_set_halign(fa_center)
	draw_text(416, 53 + 64 - 48,ceil(player_two.stt_effects.paralysis));
}
if player_two.stt_effects.poison > 0 {
	var poison_sec_p2 = ceil(player_two.stt_effects.poison/60)
	draw_sprite(Spr_status_stickers,2,432,53)
	draw_set_color(c_green)
	draw_set_halign(fa_center)
	draw_text(432, 53 + 64 - 48,poison_sec_p2);
}
if player_two.stt_effects.cold > 0 {
	var cold_sec_p2 = ceil(player_two.stt_effects.cold/60)
	draw_sprite(Spr_status_stickers,3,448,53)
	draw_set_color(c_blue)
	draw_set_halign(fa_center)
	draw_text(448, 53 + 64 - 48,cold_sec_p2);
}
if player_two.stt_effects.berserker > 0 {
	var berserker_sec_p2 = ceil(player_two.stt_effects.berserker/60)
	draw_sprite(Spr_status_stickers,4,464,32)
	draw_set_color(c_purple)
	draw_set_halign(fa_center)
	draw_text(464, 53 + 64 - 48,berserker_sec_p2);
}
if player_two.stt_effects.curse > 0 {
	var curse_sec_p2 = ceil(player_two.stt_effects.curse/60)
	draw_sprite(Spr_status_stickers,5,480,32)
	draw_set_color(c_purple)
	draw_set_halign(fa_center)
	draw_text(480, 53 + 64 - 48,curse_sec_p2);
}
if player_two.stt_effects.regenerate > 0 {
	var regenerate_sec_p2 = ceil(player_two.stt_effects.regenerate/60)
	draw_sprite(Spr_status_stickers,6,496,32)
	draw_set_color(c_teal)
	draw_set_halign(fa_center)
	draw_text(496, 53 + 64 - 48,regenerate_sec_p2);
}
if player_two.stt_effects.passion > 0 {
	var passion_sec_p2 = ceil(player_two.stt_effects.passion/60)
	draw_sprite(Spr_status_stickers,7,512,32)
	draw_set_color(c_fuchsia)
	draw_set_halign(fa_center)
	draw_text(512, 53 + 64 - 48,passion_sec_p2);
}
draw_set_color(c_white)

#endregion

draw_set_font(global.bitmap_digits)
draw_set_halign(fa_center)
//draw_text(320,0,string(ceil(time/(60))));
	draw_text_transformed(320,0,string(ceil(time/(60))),1,1,0);
visible = true;
draw_sprite(HUD_fighting_1,0,0,0)

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
