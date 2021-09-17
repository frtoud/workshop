//post_draw

if !("clones_array" in self) exit; // let clones initialize first


if (cloud_anim_visible)
{
    var cloud_subimg = 0;
    if (cloud_anim_timer < cloud_anim_intro)
    {
        cloud_subimg = floor(cloud_anim_timer / cloud_anim_rate);
    }
    else if (cloud_anim_timer < cloud_anim_ending)
    {
        cloud_subimg = floor((cloud_anim_intro + (cloud_anim_timer - cloud_anim_intro) % cloud_anim_loop_length) / cloud_anim_rate);
    }
    else
    {
        cloud_subimg = floor((cloud_anim_intro + cloud_anim_timer - cloud_anim_ending + cloud_anim_loop_length) / cloud_anim_rate);
    }

    draw_sprite_ext(cloud_sprite, cloud_subimg, x, y, 2, 2, 0, c_white, 1);
}



gpu_push_state();

for (var i = 0; i < array_length(clones_array); i++)
{
    var base_scale = 1 + owner.small_sprites;
    var clone = clones_array[i];
    if (instance_exists(clone) && clone.true_sprite_index != null_sprite)
    {
        var alpha_black = ease_linear(1, 0, clone.lockout_timer, clone_hit_lockout);
        var alpha_red = ease_quintOut(1, 0, clone.lockout_timer, clone_hit_lockout);
        
        var scale = base_scale * 1.0;
        gpu_set_fog(true, c_black, 0, 0);
        draw_sprite_ext(clone.true_sprite_index, clone.true_image_index, 
                       clone.x, clone.y, scale*clone.spr_dir, scale, 0, c_black, 
                       alpha_black);
                       
        var scale = base_scale * 0.975;
        gpu_set_fog(true, c_red, 0, 0);
        draw_sprite_ext(clone.true_sprite_index, clone.true_image_index, 
                       clone.x, clone.y, scale*clone.spr_dir, scale, 0, c_red, 
                       alpha_red);
                       
        var scale = base_scale * 0.95;
        gpu_set_fog(true, c_black, 0, 0);
        draw_sprite_ext(clone.true_sprite_index, clone.true_image_index, 
                       clone.x, clone.y, scale*clone.spr_dir, scale, 0, c_black, 
                       alpha_black);
                       
        gpu_set_fog(false, c_black, 0, 0);
    }
}
gpu_pop_state();