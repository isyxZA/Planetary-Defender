effect_create_above(ef_flare, phy_position_x, phy_position_y, 1, c_silver);
effect_create_above(ef_ring, phy_position_x, phy_position_y, 0, bColor);
with other 
{ 
	eHealth -= other.damage;
	if eHealth <= 0 
	{
		oControl.scoreP1 += 100;
		with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "+ 100"; tColor = c_yellow; }
		if Chance(0.2)
		{
			var item = instance_create_layer(phy_position_x, phy_position_y, "Players", oItem)
			item.iColor = eColor;
			effect_create_above(ef_spark, phy_position_x, phy_position_y, 1, eColor);
			effect_create_above(ef_ellipse, phy_position_x, phy_position_y, 1, eColor);
		}
		instance_destroy();
	} 
}

instance_destroy();