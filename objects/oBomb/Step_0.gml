/// @description Check for enemies within radius
if canTrigger
{
	if collision_circle(phy_position_x, phy_position_y, bRadius, oEnemy, false, true)
	{
		canTrigger = false;
		alarm[0] = room_speed * 0.2;
	}
}

if bRadius1 < bRadius
{
	bRadius1 = lerp(bRadius1, bRadius+10, 0.05);
}
else if bRadius1 >= bRadius
{
	bRadius1 = 0;
}