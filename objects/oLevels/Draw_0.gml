draw_set_color(c_red);
draw_set_alpha(0.05);

//TOP
draw_rectangle(0, 0, room_width, 500, false);
//LEFT
draw_rectangle(0, 500, 400, room_height - 500, false);
//RIGHT
draw_rectangle(room_width - 400, 500, room_width, room_height - 500, false);
//BOT
draw_rectangle(0, room_height - 500, room_width, room_height, false);

draw_set_color(c_white);
draw_set_alpha(1);