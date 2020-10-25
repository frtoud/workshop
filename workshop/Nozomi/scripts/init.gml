hurtbox_spr = sprite_get("idle_hurt");
crouchbox_spr = sprite_get("crouch_hurt");
air_hurtbox_spr = -1;
hitstun_hurtbox_spr = -1;

char_height = 52;
//each game frame uses X anim frames
idle_anim_speed = 0.15;
walk_anim_speed = 0.15;
dash_anim_speed = .3;

crouch_anim_speed = 2;
pratfall_anim_speed = .2;

walk_speed = 3.25;
walk_accel = 0.2;
walk_turn_time = 6;
initial_dash_time = 10;
initial_dash_speed = 8;
dash_speed = 7.5;
dash_turn_time = 10;
dash_turn_accel = 1.5;
dash_stop_time = 16;
dash_stop_percent = .55; //the value to multiply your hsp by when going into idle from dash or dashstop
ground_friction = .45;
moonwalk_accel = 1.4;

jump_start_time = 5;
jump_speed = 11;
short_hop_speed = 7;
djump_speed = 9;
leave_ground_max = 6.5; //the maximum hsp you can have when you go from grounded to aerial without jumping
max_jump_hsp = 5.5; //the maximum hsp you can have when jumping from the ground
air_max_speed = 5.5; //the maximum hsp you can accelerate to when in a normal aerial state
jump_change = 3; //maximum hsp when double jumping. If already going faster, it will not slow you down
air_accel = .3;
prat_fall_accel = .85; //multiplier of air_accel while in pratfall
air_friction = .06;
max_djumps = 1;
double_jump_time = 32; //the number of frames to play the djump animation. Can't be less than 31.
walljump_hsp = 6;
walljump_vsp = 11;
walljump_time = 32;
max_fall = 9; //maximum fall speed without fastfalling
fast_fall = 13; //fast fall speed
gravity_speed = .45;
hitstun_grav = .45;
knockback_adj = 1.2; //the multiplier to KB dealt to you. 1 = default, >1 = lighter, <1 = heavier

land_time = 8; //normal landing frames
prat_land_time = 20;
wave_land_time = 8;
wave_land_adj = 1.35; //the multiplier to your initial hsp when wavelanding. Usually greater than 1
wave_friction = .04; //grounded deceleration when wavelanding

//crouch animation frames
crouch_startup_frames = 2;
crouch_active_frames = 1;
crouch_recovery_frames = 2;

//parry animation frames
dodge_startup_frames = 1;
dodge_active_frames = 1;
dodge_recovery_frames = 3;

//tech animation frames
tech_active_frames = 2;
tech_recovery_frames = 1;

//tech roll animation frames
techroll_startup_frames = 1
techroll_active_frames = 4;
techroll_recovery_frames = 3;
techroll_speed = 10;

//airdodge animation frames
air_dodge_startup_frames = 1;
air_dodge_active_frames = 3;
air_dodge_recovery_frames = 3;
air_dodge_speed = 7.5;

//roll animation frames
roll_forward_startup_frames = 1;
roll_forward_active_frames = 4;
roll_forward_recovery_frames = 3;
roll_back_startup_frames = 1;
roll_back_active_frames = 4;
roll_back_recovery_frames = 3;
roll_forward_max = 9; //roll speed
roll_backward_max = 9;

land_sound = asset_get("sfx_land_light");
landing_lag_sound = asset_get("sfx_land");
waveland_sound = asset_get("sfx_waveland_zet");
jump_sound = asset_get("sfx_jumpground");
djump_sound = asset_get("sfx_jumpair");
air_dodge_sound = asset_get("sfx_quick_dodge");

//visual offsets for when you're in Ranno's bubble
bubble_x = 0;
bubble_y = 4;

//=================================================
//Custom vfx & sprites

anim_dspecial_shockwave_frame = 0;
anim_do_draw_twinkle = false;
anim_rand_x = 0;
anim_rand_y = 0;

vfx_snow_twinkle = hit_fx_create(sprite_get("vfx_snow_twinkle"), 9);
vfx_ice_small = hit_fx_create(sprite_get("vfx_ice_small"), 12);
vfx_ice_big = hit_fx_create(sprite_get("vfx_ice_big"), 20);
vfx_sleep = hit_fx_create(sprite_get("vfx_sleep"), 25);
vfx_lnotes = hit_fx_create(sprite_get("vfx_nspecial_notes_left"), 24);
vfx_rnotes = hit_fx_create(sprite_get("vfx_nspecial_notes_right"), 24);

vfx_frozen_sprite = sprite_get("vfx_frozen");

anim_hover_hair_frame = 0;
anim_hover_hair_rates = [0.15,0.25,0.35,0.5,0.75];
idle_hover_spr = sprite_get("idle_hover");
vfx_hair_hover_spr = sprite_get("vfx_hair_hover");
vfx_hair_exhausted_spr = sprite_get("vfx_hair_exhausted");

anim_hud_rollin = 0;
anim_hud_fadeout = 0;
anim_hud_timers_max = 16;
hud_hovermeter_spr = sprite_get("hud_hovermeter");

pratland_spr = sprite_get("pratland");

article1_spr = sprite_get("article1");
article1_spawn_spr = sprite_get("article1_spawn");
article1_col_spr = sprite_get("article1_col");

anim_hairblink_timer = 0;
anim_hairblink_max = anim_hud_timers_max;

//=================================================
//Balancing variables

noz_snowstack_timer_max = 60 * 5;
noz_snowimmune_timer_max = 60 * 2;

noz_freeze_grav = 0.1;
noz_freeze_base_stun = 45;
noz_freeze_base_vsp = 5;
noz_freeze_mult_vsp = 0.010;
noz_freeze_max_hsp = 5;
noz_freeze_anim_speed = 6; //degrees per frame

noz_pratfall_max_vsp = 5.5;

noz_dtilt_proj_cooldown_max = 24;

noz_dspecial_damage_max = 40;
noz_dspecial_damage_min = 10;
noz_dspecial_recharge_rate = 0.05;
noz_dspecial_breaking_mult = 2;

noz_nspecial_sleep_max = 90;
noz_nspecial_sleepimmune_max = 45;

noz_fspecial_airtime = 120;
noz_fspecial_lifetime = 600;
noz_fspecial_cooldown = noz_fspecial_airtime;

noz_uspecial_hover_max = 480;
noz_uspecial_short_cost = 60; // 1/8
noz_uspecial_long_cost = 120; // 1/4
noz_uspecial_hover_recharge = 3;
noz_uspecial_hover_vspeed = 2 + air_max_speed;
noz_uspecial_hover_exhaustion_base = 30;
noz_uspecial_hover_hspeed = 1.5 + air_max_speed;
noz_uspecial_hover_vstrength = 0.80;
noz_uspecial_hover_hstrength = 1.5 * air_accel;

//=================================================
// Move variables/flags initialized here

at_jab_infinite = false;
at_jab_inf_count = 3;
at_jab_finisher = false;
at_dtilt_proj_cooldown = 0;
at_nair_hover_need_grid_adjust = false;
at_dair_need_landing_lag_hitbox = false;

at_dspecial_done = false;
at_dspecial_has_parried = false;
at_dspecial_damage_block = noz_dspecial_damage_max;

at_nspecial_flagforimmune = false;

at_uspecial_long = false;
at_uspecial_hovering = false;
at_uspecial_was_hovering = false;
at_uspecial_exhausted = false;
at_uspecial_hover_meter = noz_uspecial_hover_max;

at_fspecial_cooldown_override = false;
at_uspecial_cooldown_override = false;

//=================================================
// Compatibility Zone

//Pokémon Stadium
pkmn_stadium_front_img = sprite_get("cmp_stadium_front");
pkmn_stadium_back_img = sprite_get("cmp_stadium_back");
pkmn_stadium_name_override = "Nozomi";

//Mt. Dedede Stadium
arena_title = "Idol Figment";

//Hikaru
Hikaru_Title = "Idol Figment";

//Wall-E
walle_taunt_sound = sound_get("cmp_walle");
walle_taunt_type = 2;
walle_taunt_playing = false;
walle_taunt_buffer = 0;



