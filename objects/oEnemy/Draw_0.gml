switch shape
{
	case "Circle":
		draw_circle_color(x, y, r * scale, eColor, eColor, true);
		break;
	case "Box":
		draw_rectangle_color(x - (w * scale), y - (h * scale), x + (w * scale), y + (h * scale),
								eColor, eColor, eColor, eColor, true);
		break;
	case "Triangle":
		draw_primitive_begin(pr_linestrip);
		draw_vertex_color(x + (p1x * scale), y + (p1y * scale), eColor, 1);
		draw_vertex_color(x + (p2x * scale), y + (p2y * scale), eColor, 1);
		draw_vertex_color(x + (p3x * scale), y + (p3y * scale), eColor, 1);
		draw_vertex_color(x + (p1x * scale), y + (p1y * scale), eColor, 1);
		draw_primitive_end();
		break;
}

//draw_line(phy_position_x, phy_position_y, phy_position_x + lengthdir_x(60, phy_rotation), phy_position_y + lengthdir_y(60,phy_rotation));