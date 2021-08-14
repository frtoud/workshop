
#macro CLONES_INIT    0
#macro CLONES_READY   1
#macro CLONES_RUNNING 2
#macro CLONES_WAITING 3

sprite_index = null_sprite;
image_index = 0;
if !("clones_array" in self)
{
    for (var i = (num_clones -1); i >= 0; i--)
    {
        clones_array[i] = noone;
    }
    
    clone_state = CLONES_INIT;
}

if ( (clone_state == CLONES_INIT) || ((clone_state != CLONES_READY) && 
     (owner.state == PS_SPAWN || owner.state == PS_RESPAWN)) )
{
    //Kill all previous clone hitboxes
    for (var i = 0; i < num_clones; i++)
    {
        if instance_exists(clones_array[i])
        {
            clones_array[i].destroyed = true; 
        }
        clones_array[i] = noone;
        
    }
    
    //reset rolling buffer
    for (var i = buffer_size -1; i >= 0; i--)
    {
        buffer_position[i] = 
        { sprite:null_sprite, mask:null_sprite, index:0, dir:0, posx:0, posy:0 };
    }
    
    //Get ready for next life's clones
    clone_state = CLONES_READY;
    buffer_pointer = buffer_size - 1;
}
else if (clone_state == CLONES_READY)
{
    if (!owner.free && !(owner.state == PS_SPAWN || owner.state == PS_RESPAWN))
    {
        //ready to spawn more clones.
        x = owner.x;
        y = owner.y;
        clone_state = CLONES_WAITING;
    }
}
else if (clone_state == CLONES_WAITING)
{
    if (point_distance(x, y, owner.x, owner.y) > start_distance)
    {
        //pre-fill buffer from start to current position (eased)
        for (var i = 1; i < start_ease_time; i++)
        {
            var bufpos = (buffer_pointer + i) % buffer_size;
            buffer_position[bufpos].sprite = owner.sprite_index;
            buffer_position[bufpos].mask = owner.mask_index;
            buffer_position[bufpos].index = owner.image_index;
            buffer_position[bufpos].posx = ease_quadOut(owner.x, x, i, start_ease_time);
            buffer_position[bufpos].posy = ease_quadOut(owner.y, y, i, start_ease_time);
            buffer_position[bufpos].dir = owner.image_xscale;
        }
        
        //prespawn the clone hitboxes
        for (var i = 0; i < num_clones; i++)
        {
            var hbx;
            with (owner)
            {
                hbx = create_hitbox(0, 0, 0, 0);
            }
            
            hbx.type = 2;
            hbx.hbox_group = -1;
            hbx.length = 5; // HG_LIFETIME
            hbx.sprite_index = null_sprite;
            hbx.mask_index = null_sprite;
            hbx.visible = true; //< controls mask visibility. dan pls
            hbx.image_xscale = 1;
            hbx.image_yscale = 1;
            
            hbx.hit_priority = 2;
            hbx.damage = 10;
            hbx.kb_angle = 90;
            hbx.kb_value = 6;
            hbx.kb_scale = 0.5;
            hbx.hitpause = 6;
            hbx.proj_break = 1; // HG_IGNORES_PROJECTILES
            hbx.throws_rock = 2; // ignored
            
            hbx.hit_effect = 67;
            hbx.sound_effect = 67;
            hbx.destroy_fx = 67;
            
            hbx.walls = 1;
            hbx.grounds = 1;
            hbx.enemies = 1;
            hbx.unbashable = true;
            hbx.plasma_safe = true;
            hbx.transcendent = true;
            hbx.does_not_reflect = true;
            
            hbx.can_hit_self = true;
            for (var p = 0; p < array_length(hbx.can_hit); p++)
            {
                hbx.can_hit[p] = true;
            }
            hbx.image_yscale = 1;
            clones_array[i] = hbx;
            clones_array[i].true_sprite_index = null_sprite;
            clones_array[i].lockout_timer = 0;
        }
        
        //clones start appearing soon
        clone_state = CLONES_RUNNING;

        sound_play(sound_get("clone_appear"));
    }
}
else if (clone_state == CLONES_RUNNING)
{
    if (!owner.hitpause)
    {
        //filling buffer with current position
        buffer_position[buffer_pointer].sprite = owner.sprite_index;
        buffer_position[buffer_pointer].index = owner.image_index;
        buffer_position[buffer_pointer].mask = owner.hurtboxID.sprite_index;
        buffer_position[buffer_pointer].posx = owner.x;
        buffer_position[buffer_pointer].posy = owner.y;
        buffer_position[buffer_pointer].dir = owner.image_xscale;
        
        buffer_pointer--;
        if (buffer_pointer < 0) { buffer_pointer = buffer_size - 1; }
        
        for (var i = 0; i < num_clones; i++)
        {
            if (clones_array[i].lockout_timer > 0)
            {
                clones_array[i].lockout_timer--;
                if (clones_array[i].lockout_timer == 0)
                {
                    clones_array[i].has_hit = false;
                    for (var p = 0; p < array_length(clones_array[i].can_hit); p++)
                    {
                        clones_array[i].can_hit[p] = true;
                    }
                }
            }
        }
    }
    
    for (var i = 0; i < num_clones; i++)
    {
        var bufpos = (buffer_pointer + (i + 1) * time_between_clones) % buffer_size;
        var buffer_data = buffer_position[bufpos];
        var clone_hbx = clones_array[i];
        
        clone_hbx.x = buffer_data.posx;
        clone_hbx.y = buffer_data.posy;
        clone_hbx.hitbox_timer = 0;
        clone_hbx.true_sprite_index = buffer_data.sprite;
        clone_hbx.sprite_index = null_sprite;
        clone_hbx.mask_index = buffer_data.mask;
        clone_hbx.image_index = buffer_data.index;
        clone_hbx.true_image_index = buffer_data.index;
        clone_hbx.spr_dir = buffer_data.dir;
        clone_hbx.image_xscale = clone_hit_scaling * spr_dir;
        clone_hbx.image_yscale = clone_hit_scaling;
        
        if (clone_hbx.lockout_timer == 0 && clone_hbx.has_hit)
        {
            clone_hbx.lockout_timer = clone_hit_lockout;
            for (var p = 0; p < array_length(clone_hbx.can_hit); p++)
            {
                clone_hbx.can_hit[p] = false;
            }
        }
    }
}