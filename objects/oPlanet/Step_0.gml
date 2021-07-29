phy_rotation += 0.125;

if instance_exists(oPlayerONE)
{
	scale = max(1, min(1.5, point_distance(phy_position_x, phy_position_y, oPlayerONE.phy_position_x, oPlayerONE.phy_position_y )*0.003));
}
else
{
	scale = 1;
}
