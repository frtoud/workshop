sprite_change_offset("idle", 23, 16);
sprite_change_offset("pulse_red", 23, 16);
sprite_change_offset("pulse_green", 23, 16);

//================================================================
//default variables
type = 1; //flying

pet_w = 40;			// Default: 30 (The buddy's width)
run_speed = 0;		// Default: 3
max_run_dist = 160;	// Default: 200 (The buddy will follow the player once their distance exceeds this value)

idle_spr = sprite_get("idle");
run_spr = idle_spr;
turn_spr = idle_spr;
ledge_spr = idle_spr;
wait_spr = idle_spr;
taunt_spr = idle_spr;

//================================================================
//movement variables
msb_hover_height = 40;

stage_y = get_stage_data(SD_Y_POS) - msb_hover_height;
stage_x_min = get_stage_data(SD_X_POS);
stage_x_max = stage_x_min + get_stage_data(SD_WIDTH);

msb_true_x = x;
msb_true_y = y - msb_hover_height;
msb_sine_height = 8;
msb_sine_timer = 0;
msb_sine_time = 300;
msb_accel = 0.05;
msb_friction = 0.03;
msb_hspeed = 0;
msb_vspeed = 0;
msb_top_speed = 2;

//================================================================
//bargraph variables
msb_bar_max = 120;
msb_bar_update_speed = 0.2;

bar_green_spr = sprite_get("milebar_g");
bar_red_spr = sprite_get("milebar_r");

text_red = sprite_get("text_red");
text_blue = sprite_get("text_blue");
text_green = sprite_get("text_green");

msb_kills = 0;
msb_deaths = 0;
//where to draw
msb_bar_kills_height = 0;
msb_bar_deaths_height = 0;
//where to animate to
msb_bar_kills_target = 0;
msb_bar_deaths_target = 0;

//pulse
pulse_green_spr = sprite_get("pulse_green");
pulse_red_spr = sprite_get("pulse_red");

msb_pulse_kill = false;
msb_pulse_timer = 0;
msb_pulse_timer_max = 60;

//================================================================
//special variables
msb_adam_url = "2475052776";

msb_initialized = false;
msb_data = noone;

for (var p = 20; p >= 0; p--)
{ 
    msb_player_death_counted[p] = false; 
    msb_player_last_hit_by[p] = 0; 
}