sprite_change_offset("idle", 0, 0);
sprite_change_offset("run", 0, 0);
sprite_change_offset("taunt", 72, 94);
sprite_change_offset("wait", 72, 94);
sprite_change_offset("ledge", 72, 94);
sprite_change_offset("turn", 72, 94);
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

