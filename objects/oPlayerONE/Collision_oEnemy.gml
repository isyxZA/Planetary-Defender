effect_create_above(ef_flare, phy_position_x, phy_position_y, 1, c_silver);

if canDamage
{
	canDamage = false;
	alarm[11] = dTimer;
	with other { eHealth -= 10; }
}

if canBeDamaged
{
	canBeDamaged = false;
	alarm[9] = dTimer;
	if shieldHealth <= 0
	{
		hHealth -= 10;
		if hHealth <= 0 && room == rmGame
		{
			instance_destroy();
		}
	}
	else
	{
		shieldHealth -= 10;
		shieldCanCharge = false;
		alarm[8] = room_speed * 4;
	}
}