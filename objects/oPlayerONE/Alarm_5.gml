/// @description AOE Burst trigger
if burstCurTime < burstCooldown
{
	++burstCurTime;
	alarm[5] = 1;
}
else
{
	burstCurTime = burstCooldown;
	canBurst = true;
}