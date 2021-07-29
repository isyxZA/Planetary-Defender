switch shape
{
	case "Circle":
		draw_circle_color(x, y, r * scale, c_green, c_green, false);
		break;
	case "Box":
		draw_rectangle_color(x - (w * scale), y - (h * scale), x + (w * scale), y + (h * scale),
								c_blue, c_blue, c_blue, c_blue, false);
		break;
	case "Triangle":
		draw_primitive_begin(pr_linestrip);
		draw_vertex_color(x + (p1x * scale), y + (p1y * scale), c_red, 1);
		draw_vertex_color(x + (p2x * scale), y + (p2y * scale), c_red, 1);
		draw_vertex_color(x + (p3x * scale), y + (p3y * scale), c_red, 1);
		draw_vertex_color(x + (p1x * scale), y + (p1y * scale), c_red, 1);
		draw_primitive_end();
		break;
}