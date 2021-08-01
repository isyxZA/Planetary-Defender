/// @description Homing missiles trigger
if missileCurVolley < missileVolley
{
	shootMissile = true;
	alarm[4] = room_speed * 0.5;
}
else
{
	if missileCurTime < missileCooldown
	{
		++missileCurTime;
		alarm[4] = 1;
	}
	else
	{
		missileCurTime = missileCooldown;
		canMissile = true;
	}
}