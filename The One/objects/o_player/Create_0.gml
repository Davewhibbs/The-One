/// @description Player Variables

#region Initialize Variables
dir = 1;
speed_ = [0,0];
max_speed = 17;
max_speed_v = 20;
acceleration = 7;
wall_friction = 1.7;
friction_ = 2;
jump_height = -20;
max_jumps = 1;
jumps = max_jumps;
wall_jump_speed = 7;

max_health = 3;
health_ = max_health;
max_charge = 2;
charge = 0;
damage = 1;

// Sprites
idle_sprite = s_player;
cling_sprite = s_player_cling;
jump_sprite = s_player_jump;
run_sprite = s_player_run;
hurt_sprite = noone;
dash_sprite = s_player_dash;

sprite = idle_sprite;

// Dash variables
dash_speed = 30;
dashdir = point_direction(x, y, mouse_x, mouse_y);
dash_cd = room_speed / 30;
dash_duration = 6;
alarm[0] = 0;
alarm[1] = 0;
#endregion

#region Input for mouse/keyboard and controller
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
jump_key = keyboard_check(vk_space);
dash_key = mouse_check_button_pressed(mb_left);
#endregion

#region STATES
enum states
{
	free,
	dash,
	hurt
}
state = states.free;
#endregion