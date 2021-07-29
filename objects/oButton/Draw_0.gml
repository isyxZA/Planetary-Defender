draw_sprite_ext(sprite_index, 0, x, y, xscale, yscale, 0, c_white, 1);

if highlight
{ 
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, 0, x, y, xscale, yscale, 0, c_white, 0.5);
	gpu_set_blendmode(bm_normal);
}

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt12);
draw_text_colour(xmid, ymid, txt, c1, c1, c1, c1, 1);