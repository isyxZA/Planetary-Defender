if room == rmGame
{
	switch global.netStatus
	{
		case "DISCONNECTED":
			if surface_exists(uiMainSurf) 
			{
	            surface_set_target(uiMainSurf);
				var cw_t = gpu_get_colorwriteenable();
				cw_t[3] = false;
				gpu_set_colorwriteenable(cw_t);
	            draw_clear_alpha(c_black, 0.6);
				draw_sprite_ext(sUI, 0, 0, 0, 1/uiScaleX, 1/uiScaleY, 0, c_white, 1);
				surface_reset_target();
				cw_t[3] = true;
				gpu_set_colorwriteenable(cw_t);
			}
			else
			{
				uiMainSurf = surface_create(uiW, uiH);
	            surface_set_target(uiMainSurf);
	            draw_clear(c_black);
	            surface_reset_target();
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