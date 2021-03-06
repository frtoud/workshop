//article1_init.gml -- CD

//Rendering
spr_article_cd_mask = sprite_get("article_cd_mask");
spr_article_cd_idle_fast = sprite_get("article_cd_idle");
spr_article_cd_idle_half = sprite_get("article_cd_idle2");
spr_article_cd_idle_slow = sprite_get("article_cd_idle3");

spr_article_cd_roll = sprite_get("article_cd_roll");
spr_article_cd_shoot = sprite_get("article_cd_shoot");
spr_article_cd_dstrong = sprite_get("article_cd_dstrong");

sprite_index = spr_article_cd_idle_fast;
image_index = 0;
mask_index = spr_article_cd_mask;
spr_dir = 1;
uses_shader = true;

visible = false;

//death sound
sfx_cd_death = player_id.sfx_cd_death;
sfx_cd_catch = player_id.sfx_cd_catch;

//=====================================================
//Standard Physics
hitstop = 0;
hsp = 0;
vsp = 0;
can_be_grounded = true;
//free = true;
ignores_walls = false;
hit_wall = false;
through_platforms = false;

//Constants
cd_grav_force  = 0.35;
cd_frict_force = 0.07;
cd_accel_force = 0.35;
cd_roll_speed = 6;
cd_fall_speed = 9;
cd_dspecial_force = 0.75;
cd_dspecial_speed = 24;
cd_dstrong_air_min_speed_for_hitbox = 5.5;
cd_dstrong_air_spiking_time = 10;

cd_dstrong_ground_min_speed = 12;
cd_dstrong_ground_max_speed = 16;
cd_dstrong_rotation_speed_base = 10; //degrees per frame
cd_dstrong_rotation_speed_bonus = 2; //per lap
cd_dstrong_ground_min_laps = 2;
cd_dstrong_ground_max_laps = 5;

cd_multihit_speed_bonus = 0.75;

//=====================================================
// state variables
buffered_state = -1; //AR_STATE_BUFFER
state = 0; //AR_STATE_HOLD
state_timer = 0;

//=====================================================
// current holder
player_id = player_id; //to not confuse with below
current_owner_id = player_id; //whoever is currently using the blade

//=====================================================
// gameplay relevant flags
uhc_cd_spin_max = player_id.uhc_cd_spin_max; //forward this constant

cd_spin_meter = floor(uhc_cd_spin_max / 2); //current charge of blade
cd_saved_spin_meter = cd_spin_meter; //charge of blade at the beginning of current move (for hitboxes)

has_hit = false; //if a cd-hitbox connected on this move
pickup_priority = 0; //time where only current_owner_id can grab this CD
has_dstrong_hitbox = false; //checks if air DSTRONG spawned already

was_parried = false; // if the CD was just parried
last_parried_by_player = 0; // which player needs to not be hit by the CD (0 meaning owner)

death_timer = 0;
death_timer_max = 90; //time it takes before a CD dies for good
death_anim_timer_max = 30; //time it takes for the death animation
pre_dspecial_immunity = 0; //prevents CD from dying while AT_DSPECIAL_2 is in progress
can_recall = false; //if true, CD is available to be recalled
can_priority_recall = false; //if true, can be recalled (but only by current_owner_id)

dstrong_charge_percent = 0; // matched (strong_charge / 60), % of charge when thrown by AT_DSTRONG
dstrong_current_speed = cd_dstrong_ground_min_speed;
dstrong_remaining_laps = 0;
dstrong_need_gravity = false;
dstrong_angular_timer = 0;
dstrong_angular_timer_prev = 0;
dstrong_hitbox = noone;

//=====================================================
// animation variables
cd_anim_blade_spin = 0; //animation speed for the blade when held
cd_anim_color = get_player_color(player_id.player) //color of CD
