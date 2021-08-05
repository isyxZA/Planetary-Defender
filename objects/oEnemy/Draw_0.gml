switch shape
{
	case "Circle":
		draw_circle_color(x, y, rCurrent * scale, activeColor, activeColor, true);
		break;
	case "Box":
		draw_rectangle_color(x - lengthdir_x(w, image_angle), y - lengthdir_y(h, image_angle), x + lengthdir_x(w, image_angle), y + lengthdir_y(h, image_angle),
								activeColor, activeColor, activeColor, activeColor, true);
		break;
	case "Triangle":
		draw_primitive_begin(pr_linestrip);
		draw_vertex_color(x + (p1x * scale), y + (p1y * scale), activeColor, 1);
		draw_vertex_color(x + (p2x * scale), y + (p2y * scale), activeColor, 1);
		draw_vertex_color(x + (p3x * scale), y + (p3y * scale), activeColor, 1);
		draw_vertex_color(x + (p1x * scale), y + (p1y * scale), activeColor, 1);
		draw_primitive_end();
		break;
}

//draw_line(x, y, x + lengthdir_x(60, image_angle), y + lengthdir_y(60,image_angle));