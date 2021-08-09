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