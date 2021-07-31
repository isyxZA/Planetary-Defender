if canMove
{
	var pa = point_direction(phy_position_x, phy_position_y, oPlanet.x, oPlanet.y);
	//phy_rotation += 0.125;
	targetX = lengthdir_x(size*mass, pa);
	targetY = lengthdir_y(size*mass, pa);
	physics_apply_force(phy_position_x, phy_position_y, targetX, targetY);
}

var pd = point_distance(phy_position_x, phy_position_y, oPlanet.x, oPlanet.y)*0.004;
scale = lerp(scale, min(1, max(0.2,pd)), 0.05);

switch shape
{
	case "Circle":
		break;
	case "Box":
		physics_apply_torque(size*0.25);
		break;
	case "Triangle":
		break;
}