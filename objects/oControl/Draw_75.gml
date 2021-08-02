if room == rmGame
{
	switch global.gameMode
	{
		case "SOLO":
			if surface_exists(uiSurf_1a) 
			{
	            draw_surface_stretched_ext(uiSurf_1a, uiX_1a, uiY_1a, uiW_1a, uiH_1a, c_white, 1);
	        }
			if surface_exists(uiSurf_1b) 
			{
	            draw_surface_stretched_ext(uiSurf_1b, uiX_1b, uiY_1b, uiW_1b, uiH_1b, c_white, 1);
	        }
			break;
		case "COOP":
			break;
		case "CLIENT":
			break;
		case "HOST":
			break;
	}
}