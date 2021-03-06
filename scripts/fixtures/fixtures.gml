/// @description FixtureCreateBox(fwidth, fheight, mass, bounce, slide, ldamp, adamp)
function FixtureCreateBox(fwidth, fheight, mass, bounce, slide, ldamp, adamp)
{
	var fixture = physics_fixture_create();
	w = (fwidth * 0.5);
	h = (fheight * 0.5);
	physics_fixture_set_box_shape(fixture, w, h);
	physics_fixture_set_density(fixture, mass);
	physics_fixture_set_restitution(fixture, bounce);
	physics_fixture_set_friction(fixture, slide);
	physics_fixture_set_linear_damping(fixture, ldamp);
	physics_fixture_set_angular_damping(fixture, adamp);
	physics_fixture_set_collision_group(fixture, -2);
	physics_fixture_bind(fixture, id);
	physics_fixture_delete(fixture);
}

/// @description FixtureCreateBox(fwidth, mass, bounce, slide, ldamp, adamp)
function FixtureCreateCircle(fwidth, mass, bounce, slide, ldamp, adamp)
{
	var fixture = physics_fixture_create();
	r = (fwidth * 0.5);
	rCurrent = r;
	//rTarget = choose(r*-2, r*2);
	timer = 0;
	duration = room_speed;
	easeIn = true;
	physics_fixture_set_circle_shape(fixture, r);
	physics_fixture_set_density(fixture, mass);
	physics_fixture_set_restitution(fixture, bounce);
	physics_fixture_set_friction(fixture, slide);
	physics_fixture_set_linear_damping(fixture, ldamp);
	physics_fixture_set_angular_damping(fixture, adamp);
	physics_fixture_set_collision_group(fixture, -2);
	physics_fixture_bind(fixture, id);
	physics_fixture_delete(fixture);
}

/// @description FixtureCreateTriangle(fwidth, fheight, mass, bounce, slide, ldamp, adamp)
function FixtureCreateTriangle(fwidth, fheight, mass, bounce, slide, ldamp, adamp)
{
	var fixture = physics_fixture_create();
	physics_fixture_set_polygon_shape(fixture);
	
	p1x = -(fwidth * 0.5);
	p1y = (fheight * 0.5);
	physics_fixture_add_point(fixture, p1x, p1y);
	
	p2x = 0;
	p2y = -(fheight * 0.5);
	physics_fixture_add_point(fixture, p2x, p2y);
	
	p3x = (fwidth * 0.5);
	p3y = (fheight * 0.5);
	physics_fixture_add_point(fixture, p3x, p3y);

	physics_fixture_set_density(fixture, mass);
	physics_fixture_set_restitution(fixture, bounce);
	physics_fixture_set_friction(fixture, slide);
	physics_fixture_set_linear_damping(fixture, ldamp);
	physics_fixture_set_angular_damping(fixture, adamp);
	physics_fixture_set_collision_group(fixture, -2);
	physics_fixture_bind(fixture, id);
	physics_fixture_delete(fixture);
}

/// @description FixtureCreateStar(fwidth, fheight, mass, bounce, slide, ldamp, adamp)
function FixtureCreateStar(fwidth, fheight, mass, bounce, slide, ldamp, adamp)
{
	var fixture = physics_fixture_create();
	physics_fixture_set_polygon_shape(fixture);
	
	p1x = 0;
	p1y = -(fheight * 0.5);
	physics_fixture_add_point(fixture, p1x, p1y);
	p2x = (fwidth * 0.5);
	p2y = 8;
	physics_fixture_add_point(fixture, p2x, p2y);
	p3x = -(fwidth * 0.5);
	p3y = 8;
	physics_fixture_add_point(fixture, p3x, p3y);
	
	physics_fixture_set_density(fixture, mass);
	physics_fixture_set_restitution(fixture, bounce);
	physics_fixture_set_friction(fixture, slide);
	physics_fixture_set_linear_damping(fixture, ldamp);
	physics_fixture_set_angular_damping(fixture, adamp);
	physics_fixture_set_collision_group(fixture, -2);
	physics_fixture_bind(fixture, id);
	physics_fixture_delete(fixture);
	
	fixture = physics_fixture_create();
	physics_fixture_set_polygon_shape(fixture);
	
	p4x = 0;
	p4y = (fheight * 0.5);
	physics_fixture_add_point(fixture, p4x, p4y);
	p5x = -(fwidth * 0.5);
	p5y = -8;
	physics_fixture_add_point(fixture, p5x, p5y);
	p6x = (fwidth * 0.5);
	p6y = -8;
	physics_fixture_add_point(fixture, p6x, p6y);
	
	physics_fixture_set_density(fixture, mass);
	physics_fixture_set_restitution(fixture, bounce);
	physics_fixture_set_friction(fixture, slide);
	physics_fixture_set_linear_damping(fixture, ldamp);
	physics_fixture_set_angular_damping(fixture, adamp);
	physics_fixture_set_collision_group(fixture, -2);
	physics_fixture_bind(fixture, id);
	physics_fixture_delete(fixture);
}