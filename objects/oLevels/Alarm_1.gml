if oControl.enemyCount < 200
{
	var rd = random(360);
	var xx = (room_width * 0.5) + lengthdir_x(1500, rd);
	var yy = (room_height * 0.5) + lengthdir_y(1500, rd);
	with instance_create_layer(xx, yy, "Players", oEnemy)
	{
		eColor = choose(c_red, c_blue, c_orange, c_lime, c_yellow, c_aqua, c_fuchsia, c_green, c_purple);
		var rr = choose(0, 1, 2);
		switch rr
		{
			case 0:
				shape = "Circle";
				mass = 0.5;
				size = irandom_range(12, 86);
				FixtureCreateCircle(size, mass, 0.2, 0.2, 1, 0.2);
				var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
				targetX = lengthdir_x(size*mass, dd);
				targetY = lengthdir_y(size*mass, dd);
				phy_rotation = dd;
				//physics_apply_impulse(phy_position_x, phy_position_y, targetX, targetY);
				break;
			case 1:
				shape = "Box";
				mass = 0.5;
				size = irandom_range(12, 72);
				FixtureCreateBox(size, size, mass, 0.1, 0.2, 1, 0.2);
				var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
				targetX = lengthdir_x(size*mass, dd);
				targetY = lengthdir_y(size*mass, dd);
				phy_rotation = dd;
				//physics_apply_impulse(phy_position_x, phy_position_y, targetX, targetY);
				break;
			case 2:
				shape = "Triangle";
				mass = 0.5;
				size = irandom_range(12, 96);
				FixtureCreateTriangle(size, size, mass, 0.1, 1, 0.5, 0.2);
				var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
				targetX = lengthdir_x(size*mass, dd);
				targetY = lengthdir_y(size*mass, dd);
				phy_rotation = dd;
				//physics_apply_impulse(phy_position_x, phy_position_y, targetX, targetY);
				break;
		}
	}
}


alarm[1] = room_speed;