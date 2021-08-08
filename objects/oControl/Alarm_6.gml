/// @description Spawn Enemy Dummy
if uiOverlay == buttonoverlay.sololobby || uiOverlay == buttonoverlay.cooplobby
{
	var ex;
	if global.gameMode == "SOLO" { ex = 0.6; }
	else { ex = 0.5; }
	with instance_create_layer(room_width * ex, room_height * 0.45, "Players", oEnemy)
	{
		eHealth = 100;
		eColor = choose(c_aqua, c_blue, c_fuchsia, c_green, c_maroon, c_orange, c_purple, c_silver, c_teal, c_yellow);
		activeColor = eColor;
		canMove = false;
		var rr = choose(0, 1, 2);
		switch rr
		{
			case 0:
				shape = "Circle";
				mass =  0;
				size = irandom_range(50, 80);
				FixtureCreateCircle(size, mass, 0.8, 0.1, 0.2, 0.2);
				break;
			case 1:
				shape = "Box";
				mass = 0;
				size = irandom_range(50, 80);
				FixtureCreateBox(size, size, mass, 0.7, 0.1, 0.2, 0.2);
				break;
			case 2:
				shape = "Triangle";
				mass = 0;
				size = irandom_range(50, 80);
				FixtureCreateTriangle(size, size, mass, 0.5, 0.1, 0.2, 0.2);
				break;
		}
	}
}