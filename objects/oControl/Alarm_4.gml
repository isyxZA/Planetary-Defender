/// @description Alert Blink
if enemyWaveAlert
{
	if aColor == c_red { aColor = c_silver; }
	else { aColor = c_red; }
	
	alarm[4] = room_speed * 0.5;
}
else
{
	aColor = c_red;
}