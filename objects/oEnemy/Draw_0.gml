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
		if !isSpecial
		{
			draw_vertex_color(x + lengthdir_x(p1xStart, image_angle), y + lengthdir_y(p1yStart, image_angle), activeColor, 1);
			draw_vertex_color(x + lengthdir_x(p2xStart, image_angle), y + lengthdir_y(p2yStart, image_angle), activeColor, 1);
			draw_vertex_color(x + lengthdir_x(p3xStart, image_angle), y + lengthdir_y(p3yStart, image_angle), activeColor, 1);
			draw_vertex_color(x + lengthdir_x(p1xStart, image_angle), y + lengthdir_y(p1yStart, image_angle), activeColor, 1);
		}
		else
		{
			draw_vertex_color(x + p1xStart, y + p1yStart, activeColor, 1);
			draw_vertex_color(x + p2xStart, y + p2yStart, activeColor, 1);
			draw_vertex_color(x + p3xStart, y + p3yStart, activeColor, 1);
			draw_vertex_color(x + p1xStart, y + p1yStart, activeColor, 1);
		}
		draw_primitive_end();
		break;
}

//draw_line(x, y, x + lengthdir_x(60, image_angle), y + lengthdir_y(60,image_angle));