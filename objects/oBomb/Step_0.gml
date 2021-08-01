/// @description Check for enemies within radius
if canTrigger
{
	if collision_circle(phy_position_x, phy_position_y, bRadius, oEnemy, false, true)
	{
		canTrigger = false;
		alarm[0] = room_speed * 0.2;
	}
}