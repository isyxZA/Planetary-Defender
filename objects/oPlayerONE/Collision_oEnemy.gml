if canDamage
{
	canDamage = false;
	alarm[3] = dTimer;
	effect_create_above(ef_flare, phy_position_x, phy_position_y, 1, c_silver);
	with other { eHealth -= 10; }
}