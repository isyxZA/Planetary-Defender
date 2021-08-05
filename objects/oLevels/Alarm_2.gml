/// @description Increment Level
++gameLevel;
//Adjust enemy difficulty by level
++enemyHealth;
//Adjust special waves spawn amount
if spawnCycleMax < 40
{
	++spawnCycleMax;
}
alarm[2] = levelTimer;