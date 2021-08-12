if room == rmMenu { draw_sprite_ext(sAura, aImage, phy_position_x - 8, phy_position_y + 8, 2, 2, 0, c_black, 1); }
draw_sprite_ext(sAura, aImage, phy_position_x, phy_position_y, 2, 2, 0, pColor, 1);

if burstActive
{
	draw_set_alpha(0.2);
	draw_set_color(pColor);
	draw_circle(phy_position_x, phy_position_y, burstCurRadius, false);
	draw_circle(phy_position_x, phy_position_y, burstCurRadius-25, false);
	draw_set_color(c_white);
	draw_circle(phy_position_x, phy_position_y, burstCurRadius-50, false);
	draw_set_alpha(1);
}

draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_silver);
draw_line_width(x + lengthdir_x(4, image_angle), y + lengthdir_y(4, image_angle), 
				x + lengthdir_x(10, image_angle), y + lengthdir_y(10, image_angle), 3);
draw_set_alpha(0.6);
draw_set_color(lColor1);
draw_circle(x + lengthdir_x(9, (image_angle + lPosition)), y + lengthdir_y(9, (image_angle + lPosition)), 2, false);
draw_set_color(lColor2);
draw_circle(x + lengthdir_x(9, (image_angle + lPosition + 120)), y + lengthdir_y(9, (image_angle + lPosition + 120)), 2, false);
draw_set_color(lColor3);
draw_circle(x + lengthdir_x(9, (image_angle + lPosition + 240)), y + lengthdir_y(9, (image_angle + lPosition + 240)), 2, false);
draw_sprite_ext(sShield, sImage, phy_position_x, phy_position_y, 1.25, 1.25, 0, pColor, sA);
draw_set_color(c_white);
draw_set_alpha(1);