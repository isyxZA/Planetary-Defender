if instance_exists(owner)
{
	phy_position_x = owner.phy_position_x;
	phy_position_y = owner.phy_position_y;
	phy_rotation = owner.phy_rotation;
}

if global.gameOver
{
	instance_destroy();
}