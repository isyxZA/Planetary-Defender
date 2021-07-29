if canMove
{
	var pa = -point_direction(phy_position_x, phy_position_y, oPlanet.x, oPlanet.y);
	phy_rotation = pa;
	physics_apply_force(phy_position_x, phy_position_y, targetX, targetY);
}
var pd = point_distance(phy_position_x, phy_position_y, oPlanet.x, oPlanet.y)*0.004;
var adj = random_range(-0.6, 0);
scale = lerp(scale, (min(1, pd) + adj), 0.05);

