if instance_exists(owner)
{
	if owner == oPlayerONE.id { oControl.scoreP1 += 200; }
	else { oControl.scoreP2 += 200; }
}

with other 
{ 
	effect_create_above(ef_flare, phy_position_x, phy_position_y, 1, c_silver);
	with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "+ 200"; tColor = c_yellow; }
	if Chance(DROPRATE)
	{
		var item = instance_create_layer(phy_position_x, phy_position_y, "Players", oItem)
		item.iColor = eColor;
		effect_create_above(ef_spark, phy_position_x, phy_position_y, 1, eColor);
		effect_create_above(ef_ellipse, phy_position_x, phy_position_y, 1, eColor);
	}
	instance_destroy();
}