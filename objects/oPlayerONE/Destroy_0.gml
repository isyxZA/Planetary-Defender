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