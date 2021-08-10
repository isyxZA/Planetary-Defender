part_emitter_destroy(global.particleSystem, p1Emitter);

if instance_exists(oLazer)
{
	with oLazer
	{
		if owner == oPlayerONE.id
		{
			instance_destroy();
		}
	}
}