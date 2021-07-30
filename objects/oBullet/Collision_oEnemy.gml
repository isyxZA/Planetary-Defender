effect_create_above(ef_flare, phy_position_x, phy_position_y, 1, c_silver);
effect_create_above(ef_ring, phy_position_x, phy_position_y, 1, bColor);
with other 
{ 
	if Chance(0.1)
	{
		var item = instance_create_layer(phy_position_x, phy_position_y, "Players", oItem)
		item.iColor = eColor;
		effect_create_above(ef_ellipse, phy_position_x, phy_position_y, 1, eColor);
	}
	instance_destroy(); 
}
instance_destroy();