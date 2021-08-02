with other
{
	var edir = point_direction(phy_position_x, phy_position_y, oPlanet.x, oPlanet.y);
	effect_create_above(ef_ellipse, phy_position_x + lengthdir_x(32, edir), phy_position_y + lengthdir_y(32, edir), 1, eColor);
	effect_create_above(ef_ellipse, phy_position_x + lengthdir_x(32, edir), phy_position_y + lengthdir_y(32, edir), 0, c_silver);
	effect_create_above(ef_smokeup, phy_position_x + lengthdir_x(32, edir), phy_position_y + lengthdir_y(32, edir), 1, eColor);
	effect_create_above(ef_spark, phy_position_x + lengthdir_x(32, edir), phy_position_y + lengthdir_y(32, edir), 1, c_silver);
	instance_destroy();
}

pHealth -= 1;
with instance_create_layer(x, y - 100, "Buttons", oAlerts) { txt = "- 1"; tColor = c_red; }