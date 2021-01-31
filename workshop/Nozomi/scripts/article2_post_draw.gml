
if (radius > 0)
{
    var zone_scale = radius/56;
    draw_sprite_ext(zone_spr, 2, x, y, zone_scale, zone_scale, draw_angle, c_white, 0.35)
    
    var flake_scale = radius/(60 - ease_sineIn(0, 8, shine_cooldown, shine_cooldown_max));
    var alpha = (shine_cooldown > 0) ? ease_backIn(4, 10, shine_cooldown, shine_cooldown_max, 2)/10.0 : 0.4;
    draw_sprite_ext(flake_spr, 2, x, y, flake_scale, flake_scale, draw_angle, c_white, alpha)
}