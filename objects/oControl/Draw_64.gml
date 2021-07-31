if room == rmGame
{
	switch global.netStatus
	{
		case "DISCONNECTED":
			var cw_t = gpu_get_colorwriteenable();
			cw_t[3] = false;
			gpu_set_colorwriteenable(cw_t);
			if surface_exists(uiSurf_1a) 
			{
				//MAIN PANEL\\
	            surface_set_target(uiSurf_1a);
	            draw_clear_alpha(c_black, 0.6);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_font(fnt12);
				//Boost Bar
				draw_sprite_ext(sButton, 0, 0, 50, 0.25, 0.35, 0, c_white, 1);
				draw_sprite_ext(sUI, 0, 0, 50, 0.5, 1.5, 0, c_white, 1);
				draw_text(25, 62, "Boost");
				//Hull Health
				draw_sprite_ext(sButton, 0, 50, 25, 0.25, 0.35, 0, c_white, 1);
				draw_sprite_ext(sUI, 0, 50, 25, 0.5, 1.5, 0, c_white, 1);
				draw_text(75, 38, "Hull");
				//Commmunications Panel
				draw_sprite_ext(sUI, 0, 100, 0, 2, 1.5, 0, c_white, 1);
				draw_text(200, 16, "-----------");
				//Shield Level
				draw_sprite_ext(sButton, 0, 300, 25, 0.25, 0.35, 0, c_white, 1);
				draw_sprite_ext(sUI, 0, 300, 25, 0.5, 1.5, 0, c_white, 1);
				draw_text(325, 38, "Shield");
				//AOE Burst
				draw_sprite_ext(sButton, 0, 350, 50, 0.25, 0.35, 0, c_white, 1);
				draw_sprite_ext(sUI, 0, 350, 50, 0.5, 1.5, 0, c_white, 1);
				draw_text(375, 62, "Burst");
				surface_reset_target();
			}
			else
			{
				uiSurf_1a = surface_create(uiW_1a, uiH_1a);
	            surface_set_target(uiSurf_1a);
	            draw_clear(c_black);
	            surface_reset_target();
			}
			if surface_exists(uiSurf_1a) 
			{
				//SIDE PANEL\\
				surface_set_target(uiSurf_1b);
	            draw_clear_alpha(c_black, 0.6);
				draw_sprite_ext(sUI, 0, 0, 0, 1, 6, 0, c_white, 1);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_font(fnt12);
				//Boost Bar
				var vsep1 = 60;
				var vsep1a = 12;
				var vsep1b = 13;

				draw_sprite_ext(sButton, 0, 0, 0, 0.5, 0.35, 0, c_white, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1, 0.5, 0.35, 0, c_white, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 2, 0.5, 0.35, 0, c_white, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 3, 0.5, 0.35, 0, c_white, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 4, 0.5, 0.35, 0, c_white, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 5, 0.5, 0.35, 0, c_white, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 6, 0.5, 0.35, 0, c_white, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 7, 0.5, 0.35, 0, c_white, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 8, 0.5, 0.35, 0, c_white, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 9, 0.5, 0.35, 0, c_white, 1);
				
				draw_set_color(c_gray);
				draw_text(50 - 1, vsep1b, "Primary");
				draw_text(50 - 1, vsep1 + vsep1b, "Secondary");
				draw_text(50 - 1, (vsep1 * 2) + vsep1b, "Speed");
				draw_text(50 - 1, (vsep1 * 3) + vsep1b, "Boost");
				draw_text(50 - 1, (vsep1 * 4) + vsep1b, "Shield");
				draw_text(50 - 1, (vsep1 * 5) + vsep1b, "Burst");
				draw_text(50 - 1, (vsep1 * 6) + vsep1b, "Missiles");
				draw_text(50 - 1, (vsep1 * 7) + vsep1b, "Lazer");
				draw_text(50 - 1, (vsep1 * 8) + vsep1b, "Turret");
				draw_text(50 - 1, (vsep1 * 9) + vsep1b, "Mines");
				
				draw_set_color(c_aqua);
				draw_text(50, vsep1a, "Primary");
				draw_set_color(c_blue);
				draw_text(50, vsep1 + vsep1a, "Secondary");
				draw_set_color(c_fuchsia);
				draw_text(50, (vsep1 * 2) + vsep1a, "Speed");
				draw_set_color(c_green);
				draw_text(50, (vsep1 * 3) + vsep1a, "Boost");
				draw_set_color(c_maroon);
				draw_text(50, (vsep1 * 4) + vsep1a, "Shield");
				draw_set_color(c_orange);
				draw_text(50, (vsep1 * 5) + vsep1a, "Burst");
				draw_set_color(c_purple);
				draw_text(50, (vsep1 * 6) + vsep1a, "Missiles");
				draw_set_color(c_silver);
				draw_text(50, (vsep1 * 7) + vsep1a, "Lazer");
				draw_set_color(c_teal);
				draw_text(50, (vsep1 * 8) + vsep1a, "Turret");
				draw_set_color(c_yellow);
				draw_text(50, (vsep1 * 9) + vsep1a, "Mines");
				draw_set_color(c_white);
				
				draw_set_halign(fa_left);
				draw_set_font(fnt8);
				draw_text(8, vsep1a * 3, "Fire Rate: " + string(pRateP1));
				draw_text(8, vsep1a * 4, "Damage: " + string(pDamageP1));
				draw_text(8, vsep1 + (vsep1a * 3), "Fire Rate: " + string(sRateP1));
				draw_text(8, vsep1 + (vsep1a * 4), "Damage: " + string(sDamageP1));
				draw_text(8, (vsep1 * 2) + (vsep1a * 3), "Max: " + string(sMaxP1));
				draw_text(8, (vsep1 * 2) + (vsep1a * 4), "Acceleration: " + string(sAccelP1));
				draw_text(8, (vsep1 * 3) + (vsep1a * 3), "Power: " + string(bPowerP1));
				draw_text(8, (vsep1 * 3) + (vsep1a * 4), "Cooldown: " + string(bRateP1));
				draw_text(8, (vsep1 * 4) + (vsep1a * 3), "Strength: " + string(sStrengthP1));
				draw_text(8, (vsep1 * 4) + (vsep1a * 4), "Recharge: " + string(sRateP1));
				draw_text(8, (vsep1 * 5) + (vsep1a * 3), "Radius: " + string(bRadiusP1));
				draw_text(8, (vsep1 * 5) + (vsep1a * 4), "Cooldown: " + string(bCooldownP1));
				draw_text(8, (vsep1 * 6) + (vsep1a * 3), "Volley Size: " + string(mVolleyP1));
				draw_text(8, (vsep1 * 6) + (vsep1a * 4), "Damage: " + string(mDamageP1));
				draw_text(8, (vsep1 * 7) + (vsep1a * 3), "Max Time: " + string(lTimeP1));
				draw_text(8, (vsep1 * 7) + (vsep1a * 4), "Cooldown: " + string(lCooldownP1));
				draw_text(8, (vsep1 * 8) + (vsep1a * 3), "Fire Rate: " + string(tRateP1));
				draw_text(8, (vsep1 * 8) + (vsep1a * 4), "Damage: " + string(tDamageP1));
				draw_text(8, (vsep1 * 9) + (vsep1a * 3), "Max Active: " + string(mMaxP1));
				draw_text(8, (vsep1 * 9) + (vsep1a * 4), "Radius: " + string(mRadiusP1));

				surface_reset_target();
			}
			else
			{
				uiSurf_1b = surface_create(uiW_1b, uiH_1b);
	            surface_set_target(uiSurf_1b);
	            draw_clear(c_black);
	            surface_reset_target();
			}
			cw_t[3] = true;
			gpu_set_colorwriteenable(cw_t);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(fnt12);
			draw_set_color(c_dkgrey);
			draw_text(uimidX - 2, 16 + 2, "HIGH SCORE");
			draw_text(uimidX - 2, 32 + 2, string(global.highScoreP1));
			draw_text(uimidX - 2, 52 + 2, "SCORE");
			draw_text(uimidX - 2, 68 + 2, string(scoreP1));
			draw_set_color(c_yellow);
			draw_text(uimidX, 16, "HIGH SCORE");
			draw_text(uimidX, 32, string(global.highScoreP1));
			draw_text(uimidX, 52, "SCORE");
			draw_text(uimidX, 68, string(scoreP1));
			draw_set_color(c_white);
			break;
		case "COOP":
			break;
		case "CLIENT":
			break;
		case "HOST":
			break;
	}
}