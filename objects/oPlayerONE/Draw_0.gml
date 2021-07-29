draw_self();

var l = point_distance(phy_position_x, phy_position_y, oPlanet.x, oPlanet.y)*0.004;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y - 20, string(l));
//draw_text(x, y - 20, string(hAxis));
//draw_text(x, y + 20, string(vAxis));
