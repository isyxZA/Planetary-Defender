draw_sprite_ext(sAura, aImage, phy_position_x, phy_position_y, 1.5, 1.5, 0, pColor, 1);

if burstDraw
{
	draw_set_alpha(0.1);
	draw_set_color(c_red);
	draw_circle(phy_position_x, phy_position_y, burstCurRadius, false);
	draw_circle(phy_position_x, phy_position_y, burstCurRadius-25, false);
	draw_set_color(c_white);
	draw_circle(phy_position_x, phy_position_y, burstCurRadius-50, false);
	draw_set_alpha(1);
}

draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(0.6);
draw_set_color(c_silver);
draw_circle(phy_position_x, phy_position_y, 3, false);
draw_line_width(phy_position_x, phy_position_y, phy_position_x + lengthdir_x(8, phy_rotation), phy_position_y + lengthdir_y(8, -phy_rotation), 3);
draw_set_color(c_white);
draw_set_alpha(1);