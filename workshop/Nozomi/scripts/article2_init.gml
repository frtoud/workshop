//article2_init

//Rendering
sprite_index = asset_get("empty_sprite");
image_index = 0;
spr_dir = player_id.spr_dir;
uses_shader = true;

shine_spr = player_id.vfx_shine_spr;
flake_spr = player_id.vfx_dspecial_flake_spr;
zone_spr = player_id.vfx_dspecial_zone_spr;

//Physics
hitstop = 0;
hsp = 0;
vsp = 0;
can_be_grounded = false;
//free = true;
ignores_walls = true;
hit_wall = false;
through_platforms = true;

//grab values from player
anim_timer = player_id.at_dspecial_zone_timer;
//constants
max_radius = player_id.noz_dspecial_zone_radius;
max_timer = player_id.noz_dspecial_zone_time;
//calculated
draw_angle = 0;
radius = 0;
x = 0;
y = 0;

shine_cooldown = 0;
shine_cooldown_max = player_id.noz_dspecial_remote_shine_cooldown;