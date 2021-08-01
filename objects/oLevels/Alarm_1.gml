if oControl.enemyCount < 200
{
	var rd = random(360);
	var xx = (room_width * 0.5) + lengthdir_x(1500, rd);
	var yy = (room_height * 0.5) + lengthdir_y(1500, rd);
	with instance_create_layer(xx, yy, "Players", oEnemy)
	{
		eColor = choose(c_aqua, c_blue, c_fuchsia, c_green, c_maroon, c_orange, c_purple, c_silver, c_teal, c_yellow);
		var rr = choose(0, 1, 2);
		switch rr
		{
			case 0:
				shape = "Circle";
				mass = 0.5;
				size = irandom_range(24, 86);
				FixtureCreateCircle(size, mass, 0.8, 0.1, 0.2, 0.2);
				var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
				targetX = lengthdir_x(size*mass, dd);
				targetY = lengthdir_y(size*mass, dd);
				break;
			case 1:
				shape = "Box";
				mass = 0.5;
				size = irandom_range(24, 72);
				FixtureCreateBox(size, size, mass, 0.7, 0.1, 0.2, 0.2);
				var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
				targetX = lengthdir_x(size*mass, dd);
				targetY = lengthdir_y(size*mass, dd);
				break;
			case 2:
				shape = "Triangle";
				mass = 0.5;
				size = irandom_range(24, 96);
				FixtureCreateTriangle(size, size, mass, 0.5, 0.1, 0.2, 0.2);
				var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
				targetX = lengthdir_x(size*mass, dd);
				targetY = lengthdir_y(size*mass, dd);
				break;
		}
	}
}

alarm[1] = room_speed;