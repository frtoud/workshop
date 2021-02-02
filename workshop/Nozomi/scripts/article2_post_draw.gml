
if (radius > 0)
{
    var zone_scale = radius/56;
    draw_sprite_ext(zone_spr, 2, x, y, zone_scale, zone_scale, draw_angle, c_white, 0.6)
    
    var flake_scale = radius/(60 - ease_sineIn(0, 8, shine_cooldown, shine_cooldown_max));
    var alpha = (shine_cooldown > 0) ? ease_backIn(6, 10, shine_cooldown, shine_cooldown_max, 4)/10.0 : 0.6;
    draw_sprite_ext(flake_spr, 2, x, y, flake_scale, flake_scale, draw_angle, c_white, alpha)
    
    if (shine_cooldown > shine_cooldown_max - 8)
    {
        var shine_frame = floor((shine_cooldown_max - shine_cooldown) / 2);
        var shine_scale = flake_scale;
        draw_sprite_ext(shine_spr, shine_frame, x, y, shine_scale, shine_scale, draw_angle, c_white, alpha)
    }
}