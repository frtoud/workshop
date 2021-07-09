//other_pre_draw.gml

save_sprite_index = sprite_index;
if (msg_unsafe_effects.master_effect_timer > 0)
{
    gpu_set_colorwriteenable(true, true, true, true);
    //sprite_index = asset_get("empty_sprite");
}