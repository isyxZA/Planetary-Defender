if room == rmMenu && drawActive
{
	switch oControl.uiOverlay
	{
		case buttonoverlay.main:
			break;
		case buttonoverlay.sololobby:
			var fw = room_width - 60;
			var fh = room_height - 60;
			var cw = fw / 10;
			var ch = fh / 5;
			var fc = c_dkgray;
			//From left to right
			for (var i = 0; i < (fw/cw); ++i)
			{
				var fx = (i * cw) + 30;
				//Top to bottom
				for (var ii = 0; ii < (fh/ch); ++ii) 
				{
					var fy = (ii * ch) + 30;
					if fc == c_dkgray
					{
						fc = c_orange;
					}
					else
					{
						fc = c_dkgray;
					}
					draw_set_color(fc);
					draw_set_alpha(0.3);
					draw_rectangle(fx, fy, fx + cw, fy + ch, false);
					draw_set_color(c_dkgray);
					draw_set_alpha(1);
					draw_rectangle(fx, fy, fx + cw, fy + ch, true);
				}
			}
			draw_set_color(c_black);
			draw_set_alpha(0.2);
			draw_rectangle(30, 30, room_width - 30, room_height - 30, false);
			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_line(0, 0, 30, 30);
			draw_line(0, room_height, 30, room_height - 30);
			draw_line(room_width, 0, room_width - 30, 30);
			draw_line(room_width, room_height, room_width - 30, room_height - 30);
			draw_rectangle(30, 30, room_width - 30, room_height - 30, true);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(fnt24);
			draw_set_color(c_dkgray);
			draw_text((room_width * 0.5) - 2, 66, "--- TOP SECRET UFO FACILITY ---");
			draw_set_color(c_white);
			draw_text(room_width * 0.5, 64, "--- TOP SECRET UFO FACILITY ---");
			draw_set_font(fnt12);
			if instance_exists(oPlayerONE) 
			{
				var px = room_width * 0.15;
				var py = 230;
				var pa = 20;
				draw_text(px, py-10, "UFO Control: " + string(oPlayerONE.playerInput));
				switch oPlayerONE.playerInput
				{
					case "GAMEPAD":
						//Display Button Inputs
						draw_text(px, py + pa, "Movement == Left Stick");
						draw_text(px, py + (pa * 2), "Rotation == Right Stick");
						draw_text(px, py + (pa * 3), "Primary Attack == Right Trigger");
						draw_text(px, py + (pa * 4), "Secondary Attack == Left Trigger");
						draw_text(px, py + (pa * 5), "Speed Boost == Left Shoulder");
						draw_text(px, py + (pa * 6), "AOE Burst == Right Shoulder");
						draw_text(px, py + (pa * 7), "Auto-Turret == X Button");
						draw_text(px, py + (pa * 8), "Homing Missiles == A Button");
						draw_text(px, py + (pa * 9), "Activate Lazer == Y Button");
						draw_text(px, py + (pa * 10), "Drop Mines == B Button");
						break;
					case "KEYBOARD":
						//Display Keyboard and Mouse Inputs
						draw_text(px, py + pa, "Movement == W A S D");
						draw_text(px, py + (pa * 2), "Rotation == Mouse");
						draw_text(px, py + (pa * 3), "Primary Attack == Left Mouse");
						draw_text(px, py + (pa * 4), "Secondary Attack == Right Mouse");
						draw_text(px, py + (pa * 5), "Speed Boost == Spacebar");
						draw_text(px, py + (pa * 6), "AOE Burst == C");
						draw_text(px, py + (pa * 7), "Auto-Turret == Q");
						draw_text(px, py + (pa * 8), "Homing Missiles == E");
						draw_text(px, py + (pa * 9), "Activate Lazer == R");
						draw_text(px, py + (pa * 10), "Drop Mines == F");
						break;
				}
			}
			//draw_set_color(c_white);
			break;
		case buttonoverlay.cooplobby:
			var fw = room_width - 60;
			var fh = room_height - 60;
			var cw = fw / 10;
			var ch = fh / 5;
			var fc = c_dkgray;
			//From left to right
			for (var i = 0; i < (fw/cw); ++i)
			{
				var fx = (i * cw) + 30;
				//Top to bottom
				for (var ii = 0; ii < (fh/ch); ++ii) 
				{
					var fy = (ii * ch) + 30;
					if fc == c_dkgray
					{
						fc = c_orange;
					}
					else
					{
						fc = c_dkgray;
					}
					draw_set_color(fc);
					draw_set_alpha(0.3);
					draw_rectangle(fx, fy, fx + cw, fy + ch, false);
					draw_set_color(c_dkgray);
					draw_set_alpha(1);
					draw_rectangle(fx, fy, fx + cw, fy + ch, true);
				}
			}
			draw_set_color(c_black);
			draw_set_alpha(0.2);
			draw_rectangle(30, 30, room_width - 30, room_height - 30, false);
			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_line(0, 0, 30, 30);
			draw_line(0, room_height, 30, room_height - 30);
			draw_line(room_width, 0, room_width - 30, 30);
			draw_line(room_width, room_height, room_width - 30, room_height - 30);
			draw_rectangle(30, 30, room_width - 30, room_height - 30, true);
		
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(fnt24);
			draw_set_color(c_dkgray);
			draw_text((room_width * 0.5) - 2, 66, "--- TOP SECRET UFO FACILITY ---");
			draw_set_color(c_white);
			draw_text(room_width * 0.5, 64, "--- TOP SECRET UFO FACILITY ---");
			draw_set_font(fnt12);
			if instance_exists(oPlayerONE) 
			{
				var px = room_width * 0.15;
				var py = 230;
				var pa = 20;
				draw_text(px, py-40, "PLAYER 1");
				draw_text(px, py-10, "UFO Control: " + string(oPlayerONE.playerInput));
				switch oPlayerONE.playerInput
				{
					case "GAMEPAD":
						//Display Button Inputs
						draw_text(px, py + pa, "Movement == Left Stick");
						draw_text(px, py + (pa * 2), "Rotation == Right Stick");
						draw_text(px, py + (pa * 3), "Primary Attack == Right Trigger");
						draw_text(px, py + (pa * 4), "Secondary Attack == Left Trigger");
						draw_text(px, py + (pa * 5), "Speed Boost == Left Shoulder");
						draw_text(px, py + (pa * 6), "AOE Burst == Right Shoulder");
						draw_text(px, py + (pa * 7), "Auto-Turret == X Button");
						draw_text(px, py + (pa * 8), "Homing Missiles == A Button");
						draw_text(px, py + (pa * 9), "Activate Lazer == Y Button");
						draw_text(px, py + (pa * 10), "Drop Mines == B Button");
						break;
					case "KEYBOARD":
						//Display Keyboard and Mouse Inputs
						if global.splitKeyboard
						{
							draw_text(px, py + pa, "Movement == W A S D");
							draw_text(px, py + (pa * 2), "Rotation == W A S D");
							draw_text(px, py + (pa * 3), "Primary Attack == Left Shift");
							draw_text(px, py + (pa * 4), "Secondary Attack == Left Control");
							draw_text(px, py + (pa * 5), "Speed Boost == Spacebar");
							draw_text(px, py + (pa * 6), "AOE Burst == C");
							draw_text(px, py + (pa * 7), "Auto-Turret == Q");
							draw_text(px, py + (pa * 8), "Homing Missiles == E");
							draw_text(px, py + (pa * 9), "Activate Lazer == R");
							draw_text(px, py + (pa * 10), "Drop Mines == F");
						}
						else
						{
							draw_text(px, py + pa, "Movement == W A S D");
							draw_text(px, py + (pa * 2), "Rotation == Mouse");
							draw_text(px, py + (pa * 3), "Primary Attack == Left Mouse");
							draw_text(px, py + (pa * 4), "Secondary Attack == Right Mouse");
							draw_text(px, py + (pa * 5), "Speed Boost == Spacebar");
							draw_text(px, py + (pa * 6), "AOE Burst == C");
							draw_text(px, py + (pa * 7), "Auto-Turret == Q");
							draw_text(px, py + (pa * 8), "Homing Missiles == E");
							draw_text(px, py + (pa * 9), "Activate Lazer == R");
							draw_text(px, py + (pa * 10), "Drop Mines == F");
						}
						break;
				}
				//Draw the color picker here
				
				
			}
			if instance_exists(oPlayerTWO) 
			{
				var p2x = room_width * 0.85;
				var p2y = 230;
				var p2a = 20;
				draw_text(p2x, p2y-40, "PLAYER 2");
				draw_text(p2x, p2y-10, "UFO Control: " + string(oPlayerTWO.playerInput));
				switch oPlayerTWO.playerInput
				{
					case "GAMEPAD":
						//Display Button Inputs
						draw_text(p2x, p2y + p2a, "Movement == Left Stick");
						draw_text(p2x, p2y + (p2a * 2), "Rotation == Right Stick");
						draw_text(p2x, p2y + (p2a * 3), "Primary Attack == Right Trigger");
						draw_text(p2x, p2y + (p2a * 4), "Secondary Attack == Left Trigger");
						draw_text(p2x, p2y + (p2a * 5), "Speed Boost == Left Shoulder");
						draw_text(p2x, p2y + (p2a * 6), "AOE Burst == Right Shoulder");
						draw_text(p2x, p2y + (p2a * 7), "Auto-Turret == X Button");
						draw_text(p2x, p2y + (p2a * 8), "Homing Missiles == A Button");
						draw_text(p2x, p2y + (p2a * 9), "Activate Lazer == Y Button");
						draw_text(p2x, p2y + (p2a * 10), "Drop Mines == B Button");
						break;
					case "KEYBOARD":
						//Display Keyboard and Mouse Inputs
						if global.splitKeyboard
						{
							draw_text(p2x, p2y + p2a, "Movement == Arrow Keys");
							draw_text(p2x, p2y + (p2a * 2), "Rotation == Arrow Keys");
							draw_text(p2x, p2y + (p2a * 3), "Primary Attack == Numpad 1");
							draw_text(p2x, p2y + (p2a * 4), "Secondary Attack == Numpad 2");
							draw_text(p2x, p2y + (p2a * 5), "Speed Boost == Numpad 0");
							draw_text(p2x, p2y + (p2a * 6), "AOE Burst == Delete");
							draw_text(p2x, p2y + (p2a * 7), "Auto-Turret == Numpad 3");
							draw_text(p2x, p2y + (p2a * 8), "Homing Missiles == Numpad 4");
							draw_text(p2x, p2y + (p2a * 9), "Activate Lazer == Numpad 5");
							draw_text(p2x, p2y + (p2a * 10), "Drop Mines == Numpad 6");
						}
						else
						{
							draw_text(p2x, p2y + p2a, "Movement == W A S D");
							draw_text(p2x, p2y + (p2a * 2), "Rotation == Mouse");
							draw_text(p2x, p2y + (p2a * 3), "Primary Attack == Left Mouse");
							draw_text(p2x, p2y + (p2a * 4), "Secondary Attack == Right Mouse");
							draw_text(p2x, p2y + (p2a * 5), "Speed Boost == Spacebar");
							draw_text(p2x, p2y + (p2a * 6), "AOE Burst == C");
							draw_text(p2x, p2y + (p2a * 7), "Auto-Turret == Q");
							draw_text(p2x, p2y + (p2a * 8), "Homing Missiles == E");
							draw_text(p2x, p2y + (p2a * 9), "Activate Lazer == R");
							draw_text(p2x, p2y + (p2a * 10), "Drop Mines == F");
						}
						break;
				}
				//Draw the color picker here
				
				
			}
			//draw_set_color(c_white);
			break;
	}
}