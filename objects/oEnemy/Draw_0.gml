switch shape
{
	case "Circle":
		
		draw_line_color(x, y, x + lengthdir_x(rCurrent * scale, 270), y + lengthdir_y(rCurrent * scale, 270), activeColor, activeColor);
		draw_line_color(x, y, x + lengthdir_x(rCurrent * scale, 180), y + lengthdir_y(rCurrent * scale, 180), activeColor, activeColor);
		draw_line_color(x, y, x + lengthdir_x(rCurrent * scale, 90) , y + lengthdir_y(rCurrent * scale, 90) , activeColor, activeColor);
		draw_line_color(x, y, x + lengthdir_x(rCurrent * scale, 0)  , y + lengthdir_y(rCurrent * scale, 0)  , activeColor, activeColor);
		draw_circle_color(x, y, rCurrent * scale, activeColor, activeColor, true);
		draw_circle_color(x + lengthdir_x(rCurrent * scale, 270), y + lengthdir_y(rCurrent * scale, 270), rCurrent * scale, activeColor, activeColor, true);
		draw_circle_color(x + lengthdir_x(rCurrent * scale, 180), y + lengthdir_y(rCurrent * scale, 180), rCurrent * scale, activeColor, activeColor, true);
		draw_circle_color(x + lengthdir_x(rCurrent * scale, 90) , y + lengthdir_y(rCurrent * scale, 90) , rCurrent * scale, activeColor, activeColor, true);
		draw_circle_color(x + lengthdir_x(rCurrent * scale, 0)  , y + lengthdir_y(rCurrent * scale, 0)  , rCurrent * scale, activeColor, activeColor, true);
		
		draw_circle_color(x + lengthdir_x(rCurrent * scale, 270), y + lengthdir_y(rCurrent * scale, 270), rCurrent * 0.2, activeColor, activeColor, false);
		draw_circle_color(x + lengthdir_x(rCurrent * scale, 180), y + lengthdir_y(rCurrent * scale, 180), rCurrent * 0.2, activeColor, activeColor, false);
		draw_circle_color(x + lengthdir_x(rCurrent * scale, 90) , y + lengthdir_y(rCurrent * scale, 90) , rCurrent * 0.2, activeColor, activeColor, false);
		draw_circle_color(x + lengthdir_x(rCurrent * scale, 0) , y + lengthdir_y(rCurrent * scale, 0)   , rCurrent * 0.2, activeColor, activeColor, false);
		draw_circle_color(x, y, 4, activeColor, activeColor, false);
		break;
	case "Box":
		if !isSpecial
		{
			var xx1 = x - lengthdir_x(w, image_angle);
			var yy1 = y - lengthdir_y(h, image_angle);
			var xx2 = x + lengthdir_x(w, image_angle);
			var yy2 = y + lengthdir_y(h, image_angle);
			
			var rr1 = max(3, (2 - (xx1 - x) * 0.1));
			var rr2 = max(3, (2 - (xx2 - x) * 0.1));
			
			draw_rectangle_color(xx1, yy1, xx2, yy2, activeColor, activeColor, activeColor, activeColor, true);
			draw_line_color(x, y, xx1, yy1, activeColor, activeColor);
			draw_line_color(x, y, xx2, yy2, activeColor, activeColor);
			
			draw_circle_color(x, y, 4, activeColor, activeColor, false);
			draw_circle_color(xx1, yy1, rr1, activeColor, activeColor, false);
			draw_circle_color(xx2, yy2, rr2, activeColor, activeColor, false);
		}
		else
		{
			var xx1 = x - w;
			var yy1 = y - h;
			var xx2 = x + w;
			var yy2 = y + h;

			draw_rectangle_color(xx1, yy1, xx2, yy2, activeColor, activeColor, activeColor, activeColor, true);
			draw_line_color(x, y, xx1, yy1, activeColor, activeColor);
			draw_line_color(x, y, xx2, yy2, activeColor, activeColor);
			
			draw_circle_color(x, y, 4, activeColor, activeColor, false);
			draw_circle_color(xx1, yy1, 4, activeColor, activeColor, false);
			draw_circle_color(xx2, yy2, 4, activeColor, activeColor, false);
			
		}
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
			
			var rr1 = max(3, (4 - (xx1 - x) * 0.1));
			var rr2 = max(3, (4 - (xx2 - x) * 0.1));
			var rr3 = max(3, (4 - (xx3 - x) * 0.1));
			
			draw_vertex_color(xx1, yy1, activeColor, 1);
			draw_vertex_color(xx2, yy2, activeColor, 1);
			draw_vertex_color(xx3, yy3, activeColor, 1);
			draw_vertex_color(xx1, yy1, activeColor, 1);
			
			draw_line_color(x, y, xx1, yy1, activeColor, activeColor);
			draw_line_color(x, y, xx2, yy2, activeColor, activeColor);
			draw_line_color(x, y, xx3, yy3, activeColor, activeColor);
			
			draw_circle_color(x, y, 4, activeColor, activeColor, false);
			draw_circle_color(xx1, yy1, rr1, activeColor, activeColor, false);
			draw_circle_color(xx2, yy2, rr2, activeColor, activeColor, false);
			draw_circle_color(xx3, yy3, rr3, activeColor, activeColor, false);
		}
		else
		{
			draw_vertex_color(x + p1x, y + p1y, activeColor, 1);
			draw_vertex_color(x + p2x, y + p2y, activeColor, 1);
			draw_vertex_color(x + p3x, y + p3y, activeColor, 1);
			draw_vertex_color(x + p1x, y + p1y, activeColor, 1);
			
			draw_line_color(x, y, x + p1x, y + p1y, activeColor, activeColor);
			draw_line_color(x, y, x + p2x, y + p2y, activeColor, activeColor);
			draw_line_color(x, y, x + p3x, y + p3y, activeColor, activeColor);
			
			draw_circle_color(x, y, 4, activeColor, activeColor, false);
			draw_circle_color(x + p1x, y + p1y, 4, activeColor, activeColor, false);
			draw_circle_color(x + p2x, y + p2y, 4, activeColor, activeColor, false);
			draw_circle_color(x + p3x, y + p3y, 4, activeColor, activeColor, false);
		}
		draw_primitive_end();
		break;
	case "Star":
		draw_primitive_begin(pr_linestrip);
		if !isSpecial
		{
			var xx1 = x + lengthdir_x(p1x, image_angle);
			var yy1 = y + lengthdir_y(p1y, image_angle);
			var xx2 = x + lengthdir_x(p2x, image_angle);
			var yy2 = y + lengthdir_y(p2y, image_angle);
			var xx3 = x + lengthdir_x(p3x, image_angle);
			var yy3 = y + lengthdir_y(p3y, image_angle);
			var xx4 = x + lengthdir_x(p4x, image_angle);
			var yy4 = y + lengthdir_y(p4y, image_angle);
			var xx5 = x + lengthdir_x(p5x, image_angle);
			var yy5 = y + lengthdir_y(p5y, image_angle);
			var xx6 = x + lengthdir_x(p6x, image_angle);
			var yy6 = y + lengthdir_y(p6y, image_angle);
			
			var rr1 = max(3, (2 - (yy1 - y) * 0.1));
			var rr2 = max(3, (2 - (yy4 - y) * 0.1));
			
			draw_vertex_color(xx1, yy1, activeColor, 1);
			draw_vertex_color(xx2, yy2, activeColor, 1);
			draw_vertex_color(xx3, yy3, activeColor, 1);
			draw_vertex_color(xx1, yy1, activeColor, 1);
			draw_vertex_color(xx4, yy4, activeColor, 1);
			draw_vertex_color(xx5, yy5, activeColor, 1);
			draw_vertex_color(xx6, yy6, activeColor, 1);
			draw_vertex_color(xx4, yy4, activeColor, 1);
			
			draw_circle_color(x, y, 4, activeColor, activeColor, false);
			draw_circle_color(x + lengthdir_x(p1x, image_angle), y + lengthdir_y(p1y, image_angle), rr1, activeColor, activeColor, false);
			draw_circle_color(x + lengthdir_x(p4x, image_angle), y + lengthdir_y(p4y, image_angle), rr2, activeColor, activeColor, false);
		}
		else
		{
			draw_vertex_color(x + p1x, y + p1y, activeColor, 1);
			draw_vertex_color(x + p2x, y + p2y, activeColor, 1);
			draw_vertex_color(x + p3x, y + p3y, activeColor, 1);
			draw_vertex_color(x + p1x, y + p1y, activeColor, 1);
			draw_vertex_color(x + p4x, y + p4y, activeColor, 1);
			draw_vertex_color(x + p5x, y + p5y, activeColor, 1);
			draw_vertex_color(x + p6x, y + p6y, activeColor, 1);
			draw_vertex_color(x + p4x, y + p4y, activeColor, 1);
			
			draw_circle_color(x, y, 4, activeColor, activeColor, false);
			draw_circle_color(x + p1x, y + p1y, 4, activeColor, activeColor, false);
			draw_circle_color(x + p4x, y + p4y, 4, activeColor, activeColor, false);
		}
		draw_primitive_end();
		break;
}