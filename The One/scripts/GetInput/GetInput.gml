///@param max_speed
		
// Get the input from the user
right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
jump_key = keyboard_check_pressed(ord("W"));
jump_key_held = keyboard_check(ord("W"));
dash_key = mouse_check_button_pressed(mb_left);
dashdir = point_direction(x, y, mouse_x, mouse_y);

// Get the axis of movement
xaxis = (right_key - left_key);
		
// hinput = 1-0 or 0-1 or 0
var hinput = xaxis;
if hinput == 1 // Moving Right
{
	speed_[h] = Approach(speed_[h], argument0, acceleration);
}
else if hinput == -1 // Moving Left
{
	speed_[h] = Approach(speed_[h], -argument0, acceleration);
}
else // Stopping
{
	speed_[h] = Approach(speed_[h], 0, friction_);
}

// Apply change to dir
if(speed_[h] != 0)
{
	dir = sign(speed_[h]);	// dir is positive or negative 1
}

// Switch sprite direction based on the dir
image_xscale = dir;

return hinput;
