draw_set_alpha(0.1);
draw_circle_color(phy_position_x, phy_position_y, bRadius, bColor, bColor, false);
draw_set_alpha(0.05);
draw_circle_color(phy_position_x, phy_position_y, bRadius1, c_yellow, c_yellow, false);
draw_set_alpha(1);
draw_sprite_ext(sBomb, 0, phy_position_x, phy_position_y, 1, 1, 0, bColor, 1);
draw_sprite_ext(sBomb, 0, phy_position_x, phy_position_y, 0.8, 0.8, 0, c_yellow, 0.7);