draw_sprite_ext(sAura, aImage, phy_position_x, phy_position_y, 1.25, 1.25, 0, c_white, 1);
draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(0.6);
draw_set_color(c_silver);
draw_line(phy_position_x, phy_position_y, phy_position_x + lengthdir_x(8, phy_rotation), phy_position_y + lengthdir_y(8, -phy_rotation));
draw_set_color(c_white);
draw_set_alpha(1);
//draw_text(x, y - 20, string(hAxis));
//draw_text(x, y + 20, string(vAxis));
