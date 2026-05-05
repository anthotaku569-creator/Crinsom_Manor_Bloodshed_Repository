if sprite_index == Gemini_nthrow {
	pal_swap_set(pallete.sprite,pallete.i,false);
	draw_sprite_ext(
		Gemini_nthrow_1,
		image_index,
		x, y, image_xscale, image_yscale, 0, c_white, 1
	);
	pal_swap_reset();
}