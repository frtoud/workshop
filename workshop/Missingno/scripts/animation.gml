//animation.gml

//==================================================================
// BSPECIAL must consider the small_sprites parameter of the stolen sprites!
// note: regular draw event needs this to happen before pre_draw, apparently.
if (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) && (attack == AT_DSPECIAL_2)
{
    small_sprites = at_bspecial_last_move.small_sprites;
}
else { small_sprites = 1; }

//==================================================================
// Glitch unsafe effects timer
msg_unsafe_handler_id = self; //missingnos always handle themselves
with (oPlayer) if (msg_unsafe_handler_id == other)
{
    if (msg_unsafe_effects.master_effect_timer <= 0)
    {
        msg_unsafe_effects.master_effect_timer = 0;
        //reset all frequencies
        msg_unsafe_effects.shudder.freq = 0;
        msg_unsafe_effects.bad_vsync.freq = 0;
        msg_unsafe_effects.bad_axis.freq = 0;
        msg_unsafe_effects.bad_crop.freq = 0;
    }
    else
    {
        msg_unsafe_effects.master_effect_timer--;
    }
}
//==================================================================

switch (state)
{
//==================================================================
    case PS_WALK:
    {
        sprite_index = sprite_get("idle");
        if (state_timer == 0)
        {
            msg_walk_start_x = x;
        }
        else
        {
            var distance_walked = x - msg_walk_start_x;
            draw_x = -floor(distance_walked/2);
            
            msg_unsafe_effects.shudder.freq = 999;
            msg_unsafe_effects.shudder.horz_max = abs(distance_walked);
            msg_unsafe_effects.shudder.vert_max = 0;
        }
    }
//==================================================================
    default: break;
}