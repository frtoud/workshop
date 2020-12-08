
#macro CLONES_INIT    0
#macro CLONES_READY   1
#macro CLONES_RUNNING 2
#macro CLONES_WAITING 3

#macro AT_CLONES     48
#macro HB_CLONES      8





if !("clones_array" in self)
{
    for (var i = (num_clones -1); i >= 0; i--)
    {
        with (owner)
        {
            other.clones_array[i] = instance_create(0, 0, "obj_article3");
            other.clones_array[i].player_id = self;
            other.clones_array[i].num = "_cosmicclonebuddy";
            other.clones_array[i].uses_shader = true;
        }
        clones_array[i].hitbox = noone;
    }
    
    clone_state = CLONES_INIT;
}
/*
if !("fubar" in self) fubar = 0;
var array = variable_instance_get_names(clones_array[0])
print_debug(array[fubar++ % array_length(array)])
exit;*/

if (!("has_initialized_cosmic_clones_flag" in owner))
{
    //Need to latch onto the owner to set the hitbox data
    set_hitbox_data();
    clone_state = CLONES_INIT;
    owner.has_initialized_cosmic_clones_flag = true;
}

sprite_index = null_sprite;
image_index = 0;

if ( (clone_state == CLONES_INIT) || ((clone_state != CLONES_READY) && 
     (owner.state == PS_SPAWN || owner.state == PS_RESPAWN)) )
{
    //Kill all previous clone hitboxes
    for (var i = 0; i < num_clones; i++)
    {
        if instance_exists(clones_array[i].hitbox)
        {
            clones_array[i].hitbox.destroyed = true; 
        }
        clones_array[i].hitbox = noone;
        clones_array[i].sprite_index = null_sprite;
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
                hbx = create_hitbox(AT_CLONES, HB_CLONES, 0, 0);
            }
            hbx.can_hit_self = true;
            for (var p = 0; p < array_length(hbx.can_hit); p++)
            {
                hbx.can_hit[p] = true;
            }
            hbx.image_yscale = 1;
            clones_array[i].hitbox = hbx;
            clones_array[i].lockout_timer = 0;
        }
        
        //clones start appearing soon
        clone_state = CLONES_RUNNING;
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
                    clones_array[i].hitbox.has_hit = false;
                    for (var p = 0; p < array_length(clones_array[i].hitbox.can_hit); p++)
                    {
                        clones_array[i].hitbox.can_hit[p] = true;
                    }
                }
            }
        }
    }
    
    for (var i = 0; i < num_clones; i++)
    {
        var bufpos = (buffer_pointer + (i + 1) * time_between_clones) % buffer_size;
        var clone_id = clones_array[i];
        var clone_hbx = clone_id.hitbox;
        clone_id.x = buffer_position[bufpos].posx;
        clone_id.y = buffer_position[bufpos].posy;
        clone_id.sprite_index = buffer_position[bufpos].sprite;
        clone_id.image_index = buffer_position[bufpos].index;
        clone_id.image_xscale = buffer_position[bufpos].dir;
        clone_id.image_alpha = (clone_id.lockout_timer > 0) ? 0.4 : 0.8;
        clone_id.image_blend = c_black;
        
        clone_hbx.x = clone_id.x;
        clone_hbx.y = clone_id.y;
        clone_hbx.hitbox_timer = 0;
        clone_hbx.sprite_index = null_sprite;
        clone_hbx.mask_index = buffer_position[bufpos].mask;
        clone_hbx.image_index = buffer_position[bufpos].index;
        clone_hbx.spr_dir = buffer_position[bufpos].dir;
        clone_hbx.image_xscale = clone_hit_scaling * clone_id.image_xscale;
        clone_hbx.image_yscale = clone_hit_scaling * clone_id.image_yscale;
        
        if (clone_id.lockout_timer == 0 && clone_id.hitbox.has_hit)
        {
            clone_id.lockout_timer = clone_hit_lockout;
            for (var p = 0; p < array_length(clone_hbx.can_hit); p++)
            {
                clone_hbx.can_hit[p] = false;
            }
        }
    }
    
}

#define set_hitbox_data()
{
    with (owner)
    {
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_HITBOX_TYPE, 2);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_LIFETIME, 4);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_WIDTH, 40);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_HEIGHT, 40);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_PRIORITY, 2);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_DAMAGE, 10);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_ANGLE, 90);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_BASE_KNOCKBACK, 6);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_KNOCKBACK_SCALING, .5);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_BASE_HITPAUSE, 6);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_IGNORES_PROJECTILES, 1);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_VISUAL_EFFECT_X_OFFSET, 0);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_VISUAL_EFFECT_Y_OFFSET, 0);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_VISUAL_EFFECT, 6);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_THROWS_ROCK, 2);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_HIT_SFX, 67);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_VISUAL_EFFECT, 67);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_PROJECTILE_DESTROY_EFFECT, 67);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_PROJECTILE_SPRITE, other.null_sprite);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_PROJECTILE_MASK, other.null_sprite);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_PROJECTILE_ANIM_SPEED, 0);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_PROJECTILE_MASK, -1);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_PROJECTILE_WALL_BEHAVIOR, 1);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_PROJECTILE_UNBASHABLE, 1);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_PROJECTILE_PARRY_STUN, 0);
        set_hitbox_value(AT_CLONES, HB_CLONES, HG_PROJECTILE_IS_TRANSCENDENT, 1);
    }
}