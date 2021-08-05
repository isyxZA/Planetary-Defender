if rot < 360 { rot += 0.125; } else { rot = 0; }

if instance_exists(oPlayerONE)
{
	scale = max(1, min(1.5, point_distance(phy_position_x, phy_position_y, oPlayerONE.phy_position_x, oPlayerONE.phy_position_y )*0.003));
}
else
{
	scale = 1;
}

a1 = pHealth/100;
a2 = 0.6 - a1;
