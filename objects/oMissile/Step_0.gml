if instance_exists(target)
{
	var tdir = point_direction(phy_position_x, phy_position_y, target.phy_position_x, target.phy_position_y);
	xForce = lengthdir_x(10000, tdir);
	yForce = lengthdir_y(10000, tdir);
	if rot != tdir
	{
		rot += angle_difference(tdir, rot) * 0.2;
	}
}
else
{
	target = instance_nearest(phy_position_x, phy_position_y, oEnemy);
}


if canTrack
{
	physics_apply_force(phy_position_x, phy_position_y, xForce, yForce);
}