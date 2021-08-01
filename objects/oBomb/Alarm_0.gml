var clist = ds_list_create();
var cnum = collision_circle_list(phy_position_x, phy_position_y, bRadius, oEnemy, false, true, clist, false);
if cnum > 0
{
	for (var i = 0; i < cnum; ++i;)
	{
		oControl.scoreP1 += 10;
		with clist[| i] 
		{
			eHealth -= other.damage;
			if eHealth <= 0 
			{
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
		}
	}
}
ds_list_destroy(clist);

if instance_exists(owner)
{
	--owner.minesActive;
}

effect_create_above(ef_ellipse, phy_position_x, phy_position_y, 1, bColor);
effect_create_above(ef_ellipse, phy_position_x, phy_position_y, 0, c_silver);
effect_create_above(ef_smokeup, phy_position_x, phy_position_y, 1, bColor);
effect_create_above(ef_spark  , phy_position_x, phy_position_y, 1, c_silver);

instance_destroy();