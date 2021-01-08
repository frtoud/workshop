//on death
//reset status
at_dspecial_damage_block = noz_dspecial_damage_max;
at_dspecial_zone_timer = 0;

at_uspecial_hover_meter = noz_uspecial_hover_max;
at_uspecial_was_hovering = false;
at_uspecial_hovering = false;
at_uspecial_exhausted = false;

move_cooldown[AT_DSPECIAL] = 0;
move_cooldown[AT_NSPECIAL] = 0;
move_cooldown[AT_FSPECIAL] = 0;
move_cooldown[AT_USPECIAL] = 0;
at_uspecial_cooldown_override = false;
at_fspecial_cooldown_override = false;


//destroy articles
with (obj_article1)
{
    if (player_id == other)
    {
        should_die = true;
    }
}