/// @description Draw input box
draw_set_font(fnt12);
draw_set_halign(fa_center);
draw_text(halfWidth, halfHeight - 32, "Enter your server name here.");
draw_set_valign(fa_top);
InputBoxDraw(true,true,c_black,c_white,c_gray,c_ltgray,c_black,c_dkgray,make_colour_rgb(37,168,250),string_height(displayText),1);
draw_set_valign(fa_middle);