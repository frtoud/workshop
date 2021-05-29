
#macro IMPOSSIBLY_LONG_TIME 999999999999999999999999999999999999999999999

//========================================================================
// initialization
if (!msb_initialized)
{
    //find existing object...
    with asset_get("hit_fx_obj") if ("milestones_bot_buddy" in self)
    {
        other.msb_data = self; break;
    }
    
    //...else create one
    if (msb_data == noone)
    {
        with (owner) other.msb_data = spawn_hit_fx(0, 0, 0);
        msb_data.milestones_bot_buddy = true;
        msb_data.player = 0;
        msb_data.persistent = true;
        msb_data.visible = false;
        
        //initialize data values for each player
        for (var p = 0; p <= 4; p++)
        {
            msb_data.player_milestones[p] = { kills:0, deaths:0 }
        }
    
    if (max(msb_data.player_milestones[player].kills, 
            msb_data.player_milestones[player].deaths) > 99)
    {
        msb_reward_active = true;
        msb_reward_playsound = false;
    }
    
    msb_initialized = true;
}

//making data last "forever"
msb_data.pause = IMPOSSIBLY_LONG_TIME;
msb_data.hit_length = IMPOSSIBLY_LONG_TIME;
msb_data.pause_timer = 0;
msb_data.step_timer = 0;

//========================================================================
// death tracking

//states used in abyss mode
#macro PS_ABYSS_DROPLET 17
#macro PS_ABYSS_MORPH   39

var death_status = msb_player_death_counted;
var last_hit_by = msb_player_last_hit_by;
var data = msb_data.player_milestones;

var milestones_strong_override = false;

with (oPlayer)
{
    var is_dead = (state == PS_DEAD || state == PS_RESPAWN
                || state == PS_ABYSS_DROPLET || state == PS_ABYSS_MORPH)
    
    // if any Adam uses USTRONG, milestones bar retracts
    if ("url" in self && url == other.msb_adam_url) &&
       (state == PS_ATTACK_GROUND && attack == AT_USTRONG)
    {
        milestones_strong_override = true;
    }

    if (death_status[player] && !is_dead)
    {
        //detect respawn to unset flag
        death_status[player] = false;
    }
    else if (!death_status[player] && is_dead)
    {
        //detect new deaths
        death_status[player] = true;
        
        //owner dies
        if (player == other.owner.player) 
        {
            data[player].deaths++;
            other.msb_pulse_timer = other.msb_pulse_timer_max;
            other.msb_pulse_kill = false;
        }

        //owner kills
        if (last_hit_by[player] == other.owner.player)
        {
            data[last_hit_by[player]].kills++;
            other.msb_pulse_timer = other.msb_pulse_timer_max;
            other.msb_pulse_kill = true;
        }
    }
    
    //resets on death, but needed the frame after to check who killed you.
    //update this tracker so it's one frame late & this buddy can check.
    last_hit_by[player] = last_player_hit_me;
}

//========================================================================
// movement
var target_x = clamp(owner.x, stage_x_min, stage_x_max);
var target_y = min(stage_y, owner.y - owner.char_height/2);

var distance = point_distance(msb_true_x, msb_true_y, owner.x, target_y);
var distangle = point_direction(msb_true_x, msb_true_y, target_x, target_y);
if (distance > max_run_dist)
{
    msb_hspeed += lengthdir_x(msb_accel, distangle);
    msb_vspeed += lengthdir_y(msb_accel, distangle);
}
var cur_speed = point_distance(0, 0, msb_hspeed, msb_vspeed);
var cur_angle = point_direction(0, 0, msb_hspeed, msb_vspeed);
if (distance < max_run_dist)
{
    cur_speed = max(0, cur_speed - msb_friction);
}
msb_hspeed = lengthdir_x(min(cur_speed, msb_top_speed), cur_angle);
msb_vspeed = lengthdir_y(min(cur_speed, msb_top_speed), cur_angle);

msb_true_x += msb_hspeed;
msb_true_y += msb_vspeed;

msb_sine_timer = (msb_sine_timer + 1) % msb_sine_time;
var sine = msb_sine_height * sin(2 * pi * msb_sine_timer/msb_sine_time);

//movement adjusted to not consider the waving sine function
x = msb_true_x;
y = msb_true_y + sine;

//========================================================================
// bargraph update
if (data[player].kills != msb_kills)
|| (data[player].deaths != msb_deaths)
{
    msb_kills = data[player].kills;
    msb_deaths = data[player].deaths;

    var highest_stat = max(msb_kills, msb_deaths, 1);
    if (highest_stat > 99) { msb_reward_active = true; }
    //halfway to maximum at 9, maximum height at 99
    var highest_bar = msb_bar_max * 0.5 * min(log10(max(1, highest_stat + 1)), 2);
    var bar_ratio = (highest_bar/highest_stat);
    msb_bar_kills_target = floor(msb_kills*bar_ratio);
    msb_bar_deaths_target = floor(msb_deaths*bar_ratio);
}

var kill_target = milestones_strong_override ? 0 : msb_bar_kills_target;
var death_target = milestones_strong_override ? 0 : msb_bar_deaths_target;

if (kill_target != msb_bar_kills_height)
{
    var diff = (kill_target - msb_bar_kills_height);
    if (abs(diff) < 2)
    { msb_bar_kills_height = kill_target; }
    else
    { msb_bar_kills_height += msb_bar_update_speed * diff; }
}

if (death_target != msb_bar_deaths_height)
{
    var diff = (death_target - msb_bar_deaths_height);
    if (abs(diff) < 2)
    { msb_bar_deaths_height = death_target; }
    else
    { msb_bar_deaths_height += msb_bar_update_speed * diff; }
}

//pulsing
if (msb_pulse_timer > 0) msb_pulse_timer--;

//bonus
if (msb_reward_active)
{
    if (msb_reward_playsound)
    {
        msb_reward_playsound = false;
        sound_play(asset_get("mfx_levelup"));
    }
    if (msb_twinkle.timer == 0)
    {
        msb_twinkle.posx = x + random_func(0, pet_w, true) - floor(pet_w/2);
        msb_twinkle.posy = y - random_func(1, floor(pet_w/3), true);
    }
    msb_twinkle.timer = (msb_twinkle.timer + 1) % 9;
    
    idle_spr = gold_spr;
    run_spr = gold_spr;
    turn_spr = gold_spr;
    ledge_spr = gold_spr;
    wait_spr = gold_spr;
    taunt_spr = gold_spr;
}