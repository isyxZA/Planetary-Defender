if oControl.enemyCount < 100
{
	var xx = choose(irandom_range(50, 100), irandom_range(room_width - 50, room_width - 100));
	var yy = choose(irandom_range(50, 100), irandom_range(room_height - 50, room_height - 100));
	with instance_create_layer(xx, yy, "Players", oEnemy)
	{
		var rr = choose(0, 1, 2);
		switch rr
		{
			case 0:
				shape = "Circle";
				mass = 0.2;
				var sz = irandom_range(12, 48);
				FixtureCreateCircle(sz, mass, 0.2, 0.2, 0.1, 0.1);
				var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
				targetX = lengthdir_x(sz*mass, dd);
				targetY = lengthdir_y(sz*mass, dd);
				phy_rotation = -dd;
				//physics_apply_impulse(phy_position_x, phy_position_y, targetX, targetY);
				break;
			case 1:
				shape = "Box";
				mass = 0.2;
				var sz = irandom_range(12, 48);
				FixtureCreateBox(sz, sz, mass, 0.1, 0.2, 0.1, 0.1);
				var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
				targetX = lengthdir_x(sz*mass, dd);
				targetY = lengthdir_y(sz*mass, dd);
				phy_rotation = -dd;
				//physics_apply_impulse(phy_position_x, phy_position_y, targetX, targetY);
				break;
			case 2:
				shape = "Triangle";
				mass = 0.2;
				var sz = irandom_range(12, 48);
				FixtureCreateTriangle(sz, sz, mass, 0.1, 0.2, 0.1, 0.1);
				var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
				targetX = lengthdir_x(sz*mass, dd);
				targetY = lengthdir_y(sz*mass, dd);
				phy_rotation = -dd;
				//physics_apply_impulse(phy_position_x, phy_position_y, targetX, targetY);
				break;
		}
	}
}


alarm[1] = room_speed;