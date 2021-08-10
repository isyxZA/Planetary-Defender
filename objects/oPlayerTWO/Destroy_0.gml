part_emitter_destroy(global.particleSystem, p2Emitter);

if instance_exists(oLazer)
{
	with oLazer
	{
		if owner == oPlayerTWO.id
		{
			instance_destroy();
		}
	}
}