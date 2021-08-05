/// @description Enemy Wave Alert
if enemyWaveAlert == false
{
	enemyWaveAlert = true;
	enemyWaveText = choose("MASSIVE ATTACK \nINCOMING!", "HUGE WAVE \nDETECTED!", 
							"SO MANY UFO's \nI'VE LOST COUNT!", "PREPARE FOR A \nSWARM!");
	aColor = c_red;
	alarm[3] = room_speed * 6;
	alarm[4] = room_speed * 0.5;
}
else
{
	enemyWaveAlert = false;
}