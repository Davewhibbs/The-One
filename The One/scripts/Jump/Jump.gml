// You can only jump if you have jumps
if(jumps > 0)
{
	jumps -= 1;
	
	// Wall jump	
	if (place_meeting(x + 11, y, o_solid))
	{
		speed_[h] = -wall_jump_speed;
	}
	else if (place_meeting(x-11, y, o_solid))
	{
		speed_[h] = wall_jump_speed;
	}
		
	speed_[v] = jump_height;
	
	
	
	
	//audio_play_sound(snd_jump, 1, 0);
	//instance_create_depth(x, y, -1, o_dust);
}

