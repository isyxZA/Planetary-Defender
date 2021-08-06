if rot < 360 { rot += 0.125; } else { rot = 0; }

if global.gameMode == "SOLO" 
{
	if instance_exists(oPlayerONE)
	{
		scale = max(1, min(1.5, point_distance(phy_position_x, phy_position_y, oPlayerONE.phy_position_x, oPlayerONE.phy_position_y )*0.003));
	}
	else
	{
		scale = 1;
	}
}
else
{
	var p1;
	var p2;
	if instance_exists(oPlayerONE) { p1 = true; }
	else { p1 = false; }
	
	if instance_exists(oPlayerTWO) { p2 = true; }
	else { p2 = false; }
	
	if p1 && p2
	{
		scale = 1;
	}
	else if p1
	{
		scale = max(1, min(1.5, point_distance(phy_position_x, phy_position_y, oPlayerONE.phy_position_x, oPlayerONE.phy_position_y) * 0.003));
	}
	else if p2
	{
		scale = max(1, min(1.5, point_distance(phy_position_x, phy_position_y, oPlayerTWO.phy_position_x, oPlayerTWO.phy_position_y) * 0.003));
	}
	else
	{
		scale = 1;
	}
}

a1 = pHealth/100;
a2 = 0.6 - a1;
