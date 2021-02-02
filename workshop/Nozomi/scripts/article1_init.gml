//article1_init

//Rendering
sprite_index = player_id.article1_spr;
image_index = 3;
spr_dir = player_id.spr_dir;
uses_shader = true;

sprite_spawn = player_id.article1_spawn_spr;
sprite_spike = player_id.article1_spike_spr;

//Physics
hitstop = 0;
hsp = 0;
vsp = 0.00001;
can_be_grounded = true;
//free = true;
ignores_walls = false;
hit_wall = false;
through_platforms = false;

//partnered Platform collider & flag
plat_collider = noone;

anim_timer = 0;
article_timer = 0;
random_twinkle = player_id.anim_rand_twinkle;

//death flags
should_die = false; //set to trigger death animation
dying = false; //is this in the process of dying?

//Runes
does_not_decay = false;
was_airborne = false;
random_proj_timer = 0;
has_proj = false; //set to spawn the falling projectile on death

spike_timer = 0; //controls the DSTRONG spike; going down
spike_timer_max = 3 * 8; 
spike_hitbox_frame = spike_timer_max - 3;
spike_spread_frame = spike_timer_max - 1;
spike_dir = 1; //direction (-1 for left 1 for right)

//find & greet neighbors

var overlapping = instance_place(x, y, obj_article1);
if (overlapping != noone && overlapping.player_id != player_id
    && overlapping.player_id.url == player_id.url //only check for Nozomi Snow
    && !overlapping.dying && !overlapping.should_die)
{ 
    with (overlapping)
    {
        //farewell to the neighbors
        if (instance_exists(left_plat))
        { left_plat.right_plat = noone; }
        if (instance_exists(right_plat))
        { right_plat.left_plat = noone; }
        
        instance_destroy(plat_collider);
    }
    instance_destroy(overlapping);
}

left_plat = noone;
left_plat = instance_place(x-1, y, obj_article1);
if (left_plat != noone && left_plat.player_id == player_id
    && !left_plat.dying && !left_plat.should_die)
{ left_plat.right_plat = id; }

right_plat = noone;
right_plat = instance_place(x+1, y, obj_article1);
if (right_plat != noone && right_plat.player_id == player_id
    && !right_plat.dying && !right_plat.should_die)
{ right_plat.left_plat = id; }

