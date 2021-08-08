if !global.gameOver
{
	if room == rmGame
	{
		if audio_system_is_available() && audio_sound_is_playable(sndExplosion)
		{
			audio_play_sound(sndExplosion, 0, false);
		}
	}
	else
	{
		oControl.alarm[6] = room_speed * 4;
	}
}
SpawnFlare(x, y, sFlare02, 1, 1, c_white);

switch shape
{
	case "Circle":
		part_type_color1(oParticles.partCircle, eColor);
		part_particles_create(global.particleSystem, x, y, oParticles.partCircle, 5);
		break;
	case "Box":
		part_type_color1(oParticles.partSquare, eColor);
		part_particles_create(global.particleSystem, x, y, oParticles.partSquare, 5);
		break;
	case "Triangle":
		part_type_color1(oParticles.partLine, eColor);
		part_particles_create(global.particleSystem, x, y, oParticles.partLine, 5);
		break;
}
--oControl.enemyCount;