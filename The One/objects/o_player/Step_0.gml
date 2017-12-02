
#region MOVEMENT
if state == states.free{
	// Get the player input
	var hinput = GetInput(max_speed);
	
	// Check if we are NOT on the floor
	if !place_meeting(x, y+1, o_solid)
	{
		
		jumps = 0;
		
		// Use Jump sprite while off the ground
		// index 0 while moving up
		if(speed_[v] < 0)
		{	
			sprite_index = jump_sprite;
			image_index = 0;
		}
		// index 1 while moving down
		else if(speed_[v] > 0)
		{
			sprite_index = jump_sprite;
			image_index = 1;
		}
		
		// Slide and cling to wall
		if (place_meeting(x + 6, y, o_solid)) || (place_meeting(x-6, y, o_solid))
		{
			sprite_index = cling_sprite;
			speed_[v] = 1
			
			
			jumps= max_jumps;
		}
		
		else
		{
			speed_[v] = Approach(speed_[v], max_speed_v, gravity_);
		}
		
	}
	
	// If on the floor, reset jumps, use ground sprites
	else 
	{
		jumps = max_jumps;
		
		// If moving, use Run Sprite
		if(hinput != 0 )
		{
			sprite_index = run_sprite;
		}
		// If not moving, use Run Sprite at image_index 0
		else
		{
			sprite_index = idle_sprite;
		}
	}
	
	// Jump
	if jump_key
	{
		Jump();
	}
	
	// Variable jump height, stop moving up if not holding jump key
	if speed_[v] < 0 && !jump_key_held
	{
		speed_[v] = max(speed_[v], 0);
	}
	
	// Move the player based on the current x and y speed for this frame
	Move(speed_);
	
	// DASH
	if dash_key
	{
		if (alarm[0] < 0)
		{
			speed_ = [0,0];
			sprite_index = dash_sprite;
			image_index = 0;
			alarm[1] = dash_duration;
			state = states.dash;
		}
		
	}
	
}
#endregion
#region DASHING
if state == states.dash{
	
	// Dash for dash duration
	if alarm[1] > 0{
		image_angle = dashdir;
		
		
			
		// Set speed to dash speed
		speed_[h] = lengthdir_x(dash_speed, dashdir);
		speed_[v] = lengthdir_y(dash_speed, dashdir);
		
		Move(speed_);
	}
	
	else{
		// reset image angle
		image_angle = dir
		
		// reset cooldown
		alarm[0] = dash_cd;
		
		// Return to free state
		state = states.free;
	}
}
#endregion
