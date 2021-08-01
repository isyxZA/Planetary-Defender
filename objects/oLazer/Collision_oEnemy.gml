with other 
{ 
	effect_create_above(ef_flare, phy_position_x, phy_position_y, 1, c_silver);
	oControl.scoreP1 += 10;
	if Chance(0.2)
	{
		var item = instance_create_layer(phy_position_x, phy_position_y, "Players", oItem)
		item.iColor = eColor;
		effect_create_above(ef_spark, phy_position_x, phy_position_y, 1, eColor);
		effect_create_above(ef_ellipse, phy_position_x, phy_position_y, 1, eColor);
	}
	instance_destroy();
}