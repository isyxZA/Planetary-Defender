/// @description AOE Burst trigger
//Cooldown time
if burstCurTime < burstCooldown
{
	++burstCurTime;
	alarm[5] = 1;
	if burstCurTime < burstRadTime
	{
		burstActive = true;
		//Expanding burst radius
		if burstCurRadius < burstRadius { burstCurRadius += 16; } 
		//Repeat expanding radius
		if burstCurRadius >= burstRadius { burstCurRadius = 0; }
	}
	else
	{
		burstActive = false;
	}
}
else
{
	burstActive = false;
	burstCurRadius = 0;
	burstCurTime = burstCooldown;
	canBurst = true;
}