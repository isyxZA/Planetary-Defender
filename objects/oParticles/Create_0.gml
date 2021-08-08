/// @description Insert description here
global.particleSystem = part_system_create_layer("Level", true);

partCircle = part_type_create();
//This defines the particles shape
part_type_shape(partCircle, pt_shape_disk);
//This is for the size
part_type_size(partCircle, 0.5, 0.5, -0.01, 0);
//This sets its colour. There are three different codes for this
part_type_color1(partCircle, c_white);
//This is its alpha. There are three different codes for this
part_type_alpha1(partCircle, 1);
//The particles speed
part_type_speed(partCircle, 4, 5, -0.02, 0);
//The direction
part_type_direction(partCircle, 0, 359, 0, 1);
//This changes the rotation of the particle
part_type_orientation(partCircle, 0, 0, 0, 0, true);
//This is the blend mode, either additive or normal
part_type_blend(partCircle, true);
//this is its lifespan in steps
part_type_life(partCircle, 200, 220);

partSquare = part_type_create();
//This defines the particles shape
part_type_shape(partSquare, pt_shape_square);
//This is for the size
part_type_size(partSquare, 0.5, 0.5, -0.01, 0);
//This sets its colour. There are three different codes for this
part_type_color1(partSquare, c_white);
//This is its alpha. There are three different codes for this
part_type_alpha1(partSquare, 1);
//The particles speed
part_type_speed(partSquare, 4, 5, -0.02, 0);
//The direction
part_type_direction(partSquare, 0, 359, 0, 1);
//This changes the rotation of the particle
part_type_orientation(partSquare, 0, 0, 0, 0, true);
//This is the blend mode, either additive or normal
part_type_blend(partSquare, true);
//this is its lifespan in steps
part_type_life(partSquare, 200, 220);

partStar = part_type_create();
//This defines the particles shape
part_type_shape(partStar, pt_shape_star);
//This is for the size
part_type_size(partStar, 0.5, 0.5, -0.01, 0);
//This sets its colour. There are three different codes for this
part_type_color1(partStar, c_white);
//This is its alpha. There are three different codes for this
part_type_alpha1(partStar, 1);
//The particles speed
part_type_speed(partStar, 4, 5, -0.02, 0);
//The direction
part_type_direction(partStar, 0, 359, 0, 1);
//This changes the rotation of the particle
part_type_orientation(partStar, 0, 0, 0, 0, true);
//This is the blend mode, either additive or normal
part_type_blend(partStar, true);
//this is its lifespan in steps
part_type_life(partStar, 200, 220);

partLine = part_type_create();
//This defines the particles shape
part_type_shape(partLine, pt_shape_line);
//This is for the size
part_type_size(partLine, 0.5, 0.5, -0.01, 0);
//This sets its colour. There are three different codes for this
part_type_color1(partLine, c_white);
//This is its alpha. There are three different codes for this
part_type_alpha1(partLine, 1);
//The particles speed
part_type_speed(partLine, 4, 5, -0.02, 0);
//The direction
part_type_direction(partLine, 0, 359, 0, 1);
//This changes the rotation of the particle
part_type_orientation(partLine, 0, 0, 0, 0, true);
//This is the blend mode, either additive or normal
part_type_blend(partLine, true);
//this is its lifespan in steps
part_type_life(partLine, 200, 220);