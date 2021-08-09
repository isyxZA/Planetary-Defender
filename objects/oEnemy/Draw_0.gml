switch shape
{
	case "Circle":
		draw_circle_color(x, y, 4, c_silver, c_silver, false);
		draw_line_color(x, y, x + lengthdir_x(rCurrent * scale, 270), y + lengthdir_y(rCurrent * scale, 270), activeColor, activeColor);
		draw_line_color(x, y, x + lengthdir_x(rCurrent * scale, 180), y + lengthdir_y(rCurrent * scale, 180), activeColor, activeColor);
		draw_line_color(x, y, x + lengthdir_x(rCurrent * scale, 90) , y + lengthdir_y(rCurrent * scale, 90) , activeColor, activeColor);
		draw_line_color(x, y, x + lengthdir_x(rCurrent * scale, 0)  , y + lengthdir_y(rCurrent * scale, 0)  , activeColor, activeColor);
		draw_circle_color(x, y, rCurrent * scale, activeColor, activeColor, true);
		break;
	case "Box":
		var xx1 = x - lengthdir_x(w, image_angle);
		var yy1 = y - lengthdir_y(h, image_angle);
		var xx2 = x + lengthdir_x(w, image_angle);
		var yy2 = y + lengthdir_y(h, image_angle);
			
		draw_circle_color(x, y, 4, c_silver, c_silver, false);
		draw_line_color(x, y, xx1, yy1, activeColor, activeColor);
		draw_line_color(x, y, xx2, yy2, activeColor, activeColor);
		
		draw_rectangle_color(xx1, yy1, xx2, yy2, activeColor, activeColor, activeColor, activeColor, true);
		break;
	case "Triangle":
		draw_primitive_begin(pr_linestrip);
		
		if !isSpecial
		{
			var xx1 = x + lengthdir_x(p1x, image_angle);
			var yy1 = y + lengthdir_y(p1y, image_angle);
			var xx2 = x + lengthdir_x(p2x, image_angle);
			var yy2 = y + lengthdir_y(p2y, image_angle);
			var xx3 = x + lengthdir_x(p3x, image_angle);
			var yy3 = y + lengthdir_y(p3y, image_angle);
			
			draw_vertex_color(xx1, yy1, activeColor, 1);
			draw_vertex_color(xx2, yy2, activeColor, 1);
			draw_vertex_color(xx3, yy3, activeColor, 1);
			draw_vertex_color(xx1, yy1, activeColor, 1);
			
			draw_circle_color(x, y, 4, c_silver, c_silver, false);
			draw_line_color(x, y, xx1, yy1, activeColor, activeColor);
			draw_line_color(x, y, xx2, yy2, activeColor, activeColor);
			draw_line_color(x, y, xx3, yy3, activeColor, activeColor);
		}
		else
		{
			draw_vertex_color(x + p1x, y + p1y, activeColor, 1);
			draw_vertex_color(x + p2x, y + p2y, activeColor, 1);
			draw_vertex_color(x + p3x, y + p3y, activeColor, 1);
			draw_vertex_color(x + p1x, y + p1y, activeColor, 1);
			
			draw_circle_color(x, y, 4, c_silver, c_silver, false);
			draw_line_color(x, y, x + p1x, y + p1y, activeColor, activeColor);
			draw_line_color(x, y, x + p2x, y + p2y, activeColor, activeColor);
			draw_line_color(x, y, x + p3x, y + p3y, activeColor, activeColor);
		}
		draw_primitive_end();
		break;
	case "Star":
		draw_primitive_begin(pr_linestrip);
		if !isSpecial
		{
			draw_circle_color(x, y, 4, c_silver, c_silver, false);
			draw_vertex_color(x + lengthdir_x(p1x, image_angle), y + lengthdir_y(p1y, image_angle), activeColor, 1);
			draw_vertex_color(x + lengthdir_x(p2x, image_angle), y + lengthdir_y(p2y, image_angle), activeColor, 1);
			draw_vertex_color(x + lengthdir_x(p3x, image_angle), y + lengthdir_y(p3y, image_angle), activeColor, 1);
			draw_vertex_color(x + lengthdir_x(p1x, image_angle), y + lengthdir_y(p1y, image_angle), activeColor, 1);
			draw_vertex_color(x + lengthdir_x(p4x, image_angle), y + lengthdir_y(p4y, image_angle), activeColor, 1);
			draw_vertex_color(x + lengthdir_x(p5x, image_angle), y + lengthdir_y(p5y, image_angle), activeColor, 1);
			draw_vertex_color(x + lengthdir_x(p6x, image_angle), y + lengthdir_y(p6y, image_angle), activeColor, 1);
			draw_vertex_color(x + lengthdir_x(p4x, image_angle), y + lengthdir_y(p4y, image_angle), activeColor, 1);
		}
		else
		{
			draw_circle_color(x, y, 4, c_silver, c_silver, false);
			draw_vertex_color(x + p1x, y + p1y, activeColor, 1);
			draw_vertex_color(x + p2x, y + p2y, activeColor, 1);
			draw_vertex_color(x + p3x, y + p3y, activeColor, 1);
			draw_vertex_color(x + p1x, y + p1y, activeColor, 1);
			draw_vertex_color(x + p4x, y + p4y, activeColor, 1);
			draw_vertex_color(x + p5x, y + p5y, activeColor, 1);
			draw_vertex_color(x + p6x, y + p6y, activeColor, 1);
			draw_vertex_color(x + p4x, y + p4y, activeColor, 1);
		}
		draw_primitive_end();
		break;
}

//draw_line(x, y, x + lengthdir_x(60, image_angle), y + lengthdir_y(60,image_angle));