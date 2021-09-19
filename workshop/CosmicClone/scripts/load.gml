sprite_change_offset("puff", 8, 8);
sprite_change_offset("cloud", 18, 48);
null_sprite = asset_get("empty_sprite");

//================================================================
//default variables
pet_w = 0;			// Default: 36 (The buddy's width)
run_speed = 0;		// Default: 3
max_run_dist = 0;	// Default: 100 (The buddy will follow the player once their distance exceeds this value)

//================================================================
//balancing variables
num_clones = 3;
time_between_clones = 60;
start_distance = 50;
start_ease_time = 16;
clone_hit_lockout = 60;
clone_hit_scaling = 0.8;

//================================================================
// custom variables
buffer_size = (num_clones) * time_between_clones + 1;
buffer_pointer = 0;
clone_state = 0;

//================================================================
// animation variables for spawn cloud
cloud_sprite = sprite_get("cloud");

cloud_anim_timer = 0;
cloud_anim_timer_max = buffer_size;
cloud_anim_rate = 5; //time per frame (1/60 seconds)

cloud_anim_intro = 3 * cloud_anim_rate;
cloud_anim_loop_length = 5 * cloud_anim_rate
cloud_anim_ending = cloud_anim_timer_max - (3 * cloud_anim_rate);
cloud_anim_visible = false;

//use this to control apparition of cloud
cloud_should_start = false;
cloud_should_stop = false;

//puffs
puff_sprite = sprite_get("puff");
puff_anim_rate = 4;
puff_anim_frames = 6;
puff_spawn_rate = 2;

puff_anim_length = puff_anim_rate * puff_anim_frames;
puff_buffer_size = ceil(puff_anim_rate * puff_anim_frames / puff_spawn_rate);

for (var i = (puff_buffer_size -1); i >= 0; i--)
{
    puff_buffer[i] = { x:0, y:0, t:-1 }
}
puff_buffer_pointer = 0;
