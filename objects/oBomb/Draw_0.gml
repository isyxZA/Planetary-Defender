draw_set_alpha(0.2);
draw_circle_color(phy_position_x, phy_position_y, bRadius, c_silver, c_red, false);
draw_set_alpha(1);
draw_sprite_ext(sBomb, 0, phy_position_x, phy_position_y, 1, 1, 0, bColor, 1);
draw_sprite_ext(sBomb, 0, phy_position_x, phy_position_y, 0.8, 0.8, 0, c_white, 0.7);