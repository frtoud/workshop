//update.gml

at_prev_dir_buffer = clamp(at_prev_dir_buffer + spr_dir, -6, 6);

//==============================================================
// BSPECIAL "Last move used" detection
var target_is_missingno = false;
var target_is_clone = false;
var target = noone;
with (oPlayer)
{
    if (state_timer == 1)
    && (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND)
    {
        var is_clone = (clone || custom_clone);
        var is_missingno = (url == other.url);
        if ( target == noone )
        || ( target_is_clone && !is_clone )
        || ( target_is_clone == is_clone  && !target_is_missingno && is_missingno)
        || ((target_is_clone == is_clone) && (target_is_missingno == is_missingno) 
            && (target.player > player))
        { 
            target = self;
            target_is_clone = is_clone;
            target_is_missingno = is_missingno;
        }
    }
}

if (target != noone) && !(target_is_missingno && target.attack == AT_DSPECIAL_2)
{
    //shortcut: if target is another missingno; consider yourself the target
    at_bspecial_last_move.target = (target_is_missingno ? self : target);
    at_bspecial_last_move.move = target.attack;
    at_bspecial_last_move.small_sprites = target.small_sprites;
}

if (gfx_glitch_death)
{
    gfx_glitch_death = false;
    set_player_stocks(player, 0);
    
    //detect if glitch-death ended match
    //things to try:
    //- moving setplayerstocks in death directly
    //-setting to zero stocks if winning (detect other players death)
    //
    var alive_players = 0;
    for (var p = 1; p <= 4 && !(alive_players > 1); p++)
    {
        if (is_player_on(p) && get_player_stocks(p) > 0)
        {
            alive_players++;
        }
    }
    if (alive_players == 1)
    {
        end_match();
    }
}

/*
//=============================================================================
//Move-stage experimental code
if !("t" in self) {
    t = noone;
var count = 0;
    //with (asset_get("solid_32_obj"))
    with (asset_get("par_block"))
    {
        other.t = self;
        count++;
    //var array = variable_instance_get_names(self);
    //other.t = (other.t + 1) % (array_length(array))
    //str = array[other.t] + ":" + string(variable_instance_get(id, array[other.t]));
    //print_debug(str);
    }
print_debug(string(count));

}
if (t != noone) with (t)
{
    move_towards_point( 500, 300, distance_to_point(500, 300));
}
//instance_change(asset_get("par_jumpthrough"))
//object_set_solid(t, false);
*/