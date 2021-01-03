//Precalculate this for all projectile snow effects
//==============================================================================
anim_do_draw_twinkle = (get_gameplay_time() % 3 == 0);
anim_rand_x = random_func(0, 100, true) / 100.0;
anim_rand_y = random_func(1, 100, true) / 100.0;
anim_rand_twinkle = random_func(2, 32, true);

//Hud meter animation
//==============================================================================
if (anim_hud_fadeout > 0)
{
    anim_hud_fadeout--;
}
if ((at_uspecial_hover_meter < noz_uspecial_hover_max || anim_hud_rollin > 0)
     && anim_hud_rollin < anim_hud_timers_max)
{
     anim_hud_rollin++;
}
if (at_uspecial_hover_meter >= noz_uspecial_hover_max
    && anim_hud_rollin >= anim_hud_timers_max)
{
    anim_hud_rollin = 0;
    anim_hud_fadeout = anim_hud_timers_max;
}

//Hair hoverframe calculation
//==============================================================================
if (at_uspecial_hovering)
{
    var hair_animspeed_index = 0;
    
    if (at_uspecial_exhausted)
    { hair_animspeed_index = 0; }
    else if (0.33 > at_uspecial_hover_meter/noz_uspecial_hover_max)
    { hair_animspeed_index = 1; }
    else if (0.66 > at_uspecial_hover_meter/noz_uspecial_hover_max) 
    { hair_animspeed_index = 2; }
    else 
    { hair_animspeed_index = 3; }
    
    if (!at_uspecial_exhausted && !joy_pad_idle 
     && !(state == PS_ATTACK_AIR && attack == AT_USPECIAL))
    {
        if ( (joy_dir >  40 && joy_dir < 140)
         || (state == PS_ATTACK_AIR && attack == AT_NAIR))
        { hair_animspeed_index++; }
        else if (joy_dir > 220 && joy_dir < 310) 
        { hair_animspeed_index--; }
    }
    
    anim_hover_hair_frame += anim_hover_hair_rates[hair_animspeed_index];
    
    if (anim_hover_hair_frame >= 4)
    {
        anim_hover_hair_frame %= 4;
        //Sound effect tied to animation
        sound_play(asset_get("sfx_birdflap"), false, noone, 1, 
        0.75 + anim_hover_hair_rates[hair_animspeed_index]);
    }
}

//Bonus
if (anim_hairblink_timer < anim_hairblink_max &&
   (!at_uspecial_hovering && at_uspecial_was_hovering || at_uspecial_exhausted ))
{
    anim_hairblink_timer++;
}
else if (anim_hairblink_timer > 0 && !at_uspecial_was_hovering)
{
    anim_hairblink_timer--;
}
//==============================================================================
switch (state)
{
    case PS_PRATLAND:
    {
        if (!was_parried)
        {
            sprite_index = pratland_spr;
            image_index = floor(image_number * (state_timer/prat_land_time));
        }
    } break;
    case PS_HITSTUN:
    case PS_HITSTUN_LAND:
    {
        image_index = hitpause ? 0 : 1;
    } break;
    case PS_IDLE_AIR:
    {
        if (at_uspecial_hovering)
        {
            sprite_index = idle_hover_spr;
            
            //Exhausted -> Uses DOWNWARD
            if (at_uspecial_exhausted) 
                    { image_index = 4; }
            //NEUTRAL
            else if (joy_pad_idle) 
                    { image_index = 0; }
            //BACKWARD
            else if ( (spr_dir > 0 && (joy_dir >= 130 && joy_dir <= 230))
                   || (spr_dir < 0 && (joy_dir <=  50 || joy_dir >= 310)) )
                    { image_index = 1; }
            //UPWARD
            else if (joy_dir >  50 && joy_dir < 130) 
                    { image_index = 2; }
            //FORWARD
            else if ( (spr_dir > 0 && (joy_dir <=  50 || joy_dir >= 310))
                   || (spr_dir < 0 && (joy_dir >= 130 && joy_dir <= 230)) )
                    { image_index = 3; }
            //DOWNWARD
            else    { image_index = 4; }
        }
        else if (prev_state == PS_ATTACK_AIR)
        { 
            image_index = 5;
        }
    } break;
    case PS_WALL_JUMP:
    {
        if (state_timer < 4)
        { 
            image_index = 0;
        }
    } break;
    case PS_ATTACK_GROUND:
    case PS_ATTACK_AIR:
    {
        //Moved this logic in parallel to not clog up attack_update
        switch (attack)
        {
//==================================================================
            case AT_FSTRONG:
            {
                if (window == 1 && strong_charge > 0)
                {
                    image_index = 1 + (strong_charge / 6) % 4;
                    
                    if (get_gameplay_time() % 4 == 0)
                    {
                        spawn_twinkle(vfx_snow_twinkle, x - (20 * spr_dir),
                                      y - 20, 10, true);
                    }
                }
                else if (window == 2 && 
                (  window_timer == get_hitbox_value(AT_FSTRONG, 2, HG_WINDOW_CREATION_FRAME) -1
                || window_timer == get_hitbox_value(AT_FSTRONG, 3, HG_WINDOW_CREATION_FRAME) -1 ))
                { 
                    spawn_hit_fx(x + (32 * spr_dir), y-20, vfx_ice_small);
                    sound_play(sound_get("sfx_noz_ice_small"));
                }
                else if (!hitstop && window == 3 && window_timer == 0)
                {
                    spawn_hit_fx(x + (40 * spr_dir), y-20, vfx_ice_big);
                }
                else if ((get_gameplay_time() % 2 == 0) && ( window == 3 || (window == 2 && 
                window_timer > get_hitbox_value(AT_FSTRONG, 2, HG_WINDOW_CREATION_FRAME)) ))
                {
                    spawn_twinkle(vfx_snow_twinkle, x + (32 * spr_dir), y - 20, 
                                  get_hitbox_value(AT_FSTRONG, 2, HG_WIDTH), false);
                }
                
            }break;
//==================================================================
            case AT_USTRONG:
            {
                if (window == 1 && strong_charge > 0
                     && (get_gameplay_time() % 4 == 0) )
                {
                    spawn_twinkle(vfx_snow_twinkle, x, y - 6, 10, true);
                }
                if (!hitstop && window == 2 && window_timer == 
                (get_hitbox_value(AT_USTRONG, 1, HG_WINDOW_CREATION_FRAME)) )
                { 
                    spawn_hit_fx(x, y + get_hitbox_value(AT_USTRONG, 2, HG_HITBOX_Y), vfx_ice_big);
                }
                else if ((get_gameplay_time() % 2 == 0)
                 && window == 2 && window_timer > 
                get_hitbox_value(AT_USTRONG, 1, HG_WINDOW_CREATION_FRAME))
                {
                    spawn_twinkle(vfx_snow_twinkle, x,
                                  y + get_hitbox_value(AT_USTRONG, 2, HG_HITBOX_Y), 
                                  get_hitbox_value(AT_USTRONG, 2, HG_WIDTH), false);
                }
            }break;
//==================================================================
            case AT_DSTRONG:
            {
                if (window == 1 && strong_charge > 0
                    && (get_gameplay_time() % 4 == 0) )
                {
                    spawn_twinkle(vfx_snow_twinkle, x - (spr_dir * 20),
                                                    y - 48, 10, true);
                }
            }break;
//==================================================================
            case AT_NSPECIAL:
            {
                if (window_timer == 0) && (window == 2 || window == 4)
                {
                    var which_fx = spr_dir * (window == 2 ? 1 : -1);
                    var k = spawn_hit_fx(x, y-24, (which_fx < 0 ? vfx_rnotes 
                                                                : vfx_lnotes) );
                    k.spr_dir = 1;
                    k.depth = depth - 1;
                }
            }break;
//==================================================================
            case AT_FSPECIAL:
            {
                if ((window == 2 || window == 3) && get_gameplay_time() % 2 == 0)
                {
                    spawn_twinkle(vfx_snow_twinkle, x - (spr_dir * 8), y - 16,
                                  get_hitbox_value(AT_FSPECIAL, 2, HG_WIDTH), false);
                }
            }break;
//==================================================================
            case AT_USPECIAL:
            {
                if (window == 1) 
                {
                    if (free) { image_index = 1; }
                    if (window_timer % 8 >= 4)
                    {
                        strong_flashing = true;
                    }
                }
                else if (image_index == 15
                && get_window_value(AT_USPECIAL, 5, AG_WINDOW_TYPE) == 7) 
                { image_index = 22; } //Exhausted frame; going to pratfall
            }break;
//==================================================================
            case AT_DSPECIAL:
            {
                //Counter success hitpause frame
                if (window == 5 && window_timer < 1) 
                   { image_index = 8; }
            }break;
//==================================================================
            case AT_NAIR:
                if !(at_uspecial_hovering && !at_uspecial_exhausted) 
                    break; // Landed NAIR case
            case AT_FAIR:
            case AT_BAIR:
            case AT_UAIR:
            {
                //Hover-Aerial variants!
                //Uses index 55 to generalize logic
                if (at_uspecial_hovering) 
                { sprite_index = get_attack_value(attack, 55); }
            }break;
//==================================================================
            default:
            break;
        }
    }break;
    default:
    break;
};

if (anim_dspecial_shockwave_frame > 0) 
    { anim_dspecial_shockwave_frame -= 1; }
if (anim_fakeparry_timer > 0) 
    { anim_fakeparry_timer -= 1; }
    
    
#define spawn_twinkle(vfx, pos_x, pos_y, radius, front)
{
    var kx = pos_x - (radius / 2) + anim_rand_x * radius;
    var ky = pos_y - (radius / 2) + anim_rand_y * radius;
    
    var k = spawn_hit_fx(kx, ky, vfx);
    if (front)
    {
        k.depth = depth - 1;
    }
}