/// @description Auto Turret trigger
if turretCurVolley < turretVolley
{
	shootTurret = true;
	alarm[3] = turretRate;
}
else
{
	if turretCurTime < turretCooldown
	{
		++turretCurTime;
		alarm[3] = 1;
	}
	else
	{
		turretCurTime = turretCooldown;
		canTurret = true;
	}
}