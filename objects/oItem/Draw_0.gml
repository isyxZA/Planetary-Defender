if !blink
{
	draw_sprite_ext(sprite_index, 0, x, y, xScale, yScale, 0, c_white, 1);
	draw_sprite_ext(sprite_index, 0, x, y, xScale, yScale, 0, iColor, 0.5);
}
else
{
	draw_sprite_ext(sprite_index, 0, x, y, xScale, yScale, 0, c_white, 0.2);
	draw_sprite_ext(sprite_index, 0, x, y, xScale, yScale, 0, iColor, 0.1);
}