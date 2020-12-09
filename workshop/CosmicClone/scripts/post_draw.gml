//post_draw

if !("clones_array" in self) exit; // let clones initialize first
for (var i = 0; i < array_length(clones_array); i++)
{
    var clone = clones_array[i];
    if (instance_exists(clone) && clone.true_sprite_index != null_sprite)
    {
        draw_sprite_ext(clone.true_sprite_index, clone.image_index, 
                       clone.x, clone.y, clone.spr_dir, 1, 0, c_black, 
                       ease_linear(1, 0, clone.lockout_timer, clone_hit_lockout));
    }
}