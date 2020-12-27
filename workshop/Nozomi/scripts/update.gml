
// Lingering projectile for DTILT has a cooldown; avoids spamming too many at once
if (at_dtilt_proj_cooldown > 0)
{
	at_dtilt_proj_cooldown--;
	if (at_dtilt_proj_cooldown == 0)
	{ 
		set_num_hitboxes(AT_DTILT, 2); 
	}
}

//Extra landing hitbox for DAIR
//==============================================================================
if (state == PS_LANDING_LAG)
{ 
	off_edge = false;
    //Extra landing hitbox for DAIR when landing (if needed)
    if (attack == AT_DAIR && at_dair_need_landing_lag_hitbox)
    { 
    	create_hitbox(AT_DAIR, 4, 0, 0); 
    	at_dair_need_landing_lag_hitbox = false;
    }
}

//Pratfall gravity dampening
//==============================================================================
if (state == PS_PRATFALL && vsp > noz_pratfall_max_vsp)
{ 
	vsp = noz_pratfall_max_vsp;
}

//USPECIAL hover logic
//==============================================================================
if (at_uspecial_hovering)
{
	//TODO: disallow fastfalling but make it fallthrough platforms?
	fall_through = false;
	
	//Those states pull you out of Hover
	if (!free || state == PS_HITSTUN   || state == PS_WALL_JUMP
	          || state == PS_AIR_DODGE || state == PS_DOUBLE_JUMP)
	{
		at_uspecial_hovering = false;
		at_nair_hover_need_grid_adjust = true;
	}
	else if ( !at_uspecial_exhausted &&
	    //exception: no control during USPECIAL window 5 and 6
		!( state == PS_ATTACK_AIR && attack == AT_USPECIAL && 
		  (window == 5 || (window == 6 && window_timer < 6))) )
	{
		if (fast_falling)
		{
			at_uspecial_exhausted = true;
			at_nair_hover_need_grid_adjust = true;
		}
		else
		{
			//Hovermode movement logic!
			var target_hsp = 0;
			var target_vsp = 0;
			var hover_cost_mult = 1.1;
			if (!joy_pad_idle)
			{
	            target_hsp = lengthdir_x(noz_uspecial_hover_hspeed, joy_dir);
	            target_vsp = lengthdir_y(noz_uspecial_hover_vspeed, joy_dir);
	            hover_cost_mult -= lengthdir_y(0.8, joy_dir);
			}
			
			//dampen vertical control depending on meter level
			var exhaustion_factor = 
			   0.01 * ease_cubeOut(noz_uspecial_hover_exhaustion_base, 100,
			                       floor(at_uspecial_hover_meter), noz_uspecial_hover_max);
			 
			target_vsp = (target_vsp * exhaustion_factor) 
			           + noz_uspecial_hover_vspeed * (1 - exhaustion_factor);
			
			if (hsp > target_hsp)
			{
				hsp = (hsp - noz_uspecial_hover_hstrength > target_hsp) ? 
				       hsp - noz_uspecial_hover_hstrength : target_hsp;
			}
			else
			{
				hsp = (hsp + noz_uspecial_hover_hstrength < target_hsp) ? 
				       hsp + noz_uspecial_hover_hstrength : target_hsp;
			}
			
			if (vsp > target_vsp)
			{
				vsp = (vsp - noz_uspecial_hover_vstrength > target_vsp) ? 
				       vsp - noz_uspecial_hover_vstrength : target_vsp;
			}
			//else: gravity handles it
	
			at_uspecial_hover_meter -= hover_cost_mult * 2;
		}
	}
}
else if (!at_uspecial_was_hovering 
      && !(state == PS_ATTACK_AIR && attack == AT_USPECIAL))
{
	//recharges meter
	at_uspecial_exhausted = false;
	var recharge = (trueground() ? noz_uspecial_hover_recharge 
	                             : noz_uspecial_hover_recharge_air);
	at_uspecial_hover_meter = 
	   (at_uspecial_hover_meter >= noz_uspecial_hover_max) ? 
	    noz_uspecial_hover_max : at_uspecial_hover_meter + recharge;
}
else if (!free || state == PS_HITSTUN || state == PS_WALL_JUMP)
{
	//reallows specials in those circumstances
    at_uspecial_cooldown_override = false;
}

if (!free)
{
    at_uspecial_cooldown_override = false;
	if (trueground())
	{
		at_uspecial_was_hovering = false;
        at_fspecial_cooldown_override = false;
	}
}

if (at_uspecial_hover_meter < 0) 
{
	at_uspecial_hover_meter = 0;
    at_uspecial_exhausted = true;
    at_nair_hover_need_grid_adjust = true; 
}

//DSPECIAL recharging
//==============================================================================
if ( (at_dspecial_damage_block <= noz_dspecial_damage_max) &&
    !((attack == AT_DSPECIAL) && (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND)))
{
	//recharges the damage buffer for DSPECIAL
	at_dspecial_damage_block += noz_dspecial_recharge_rate;
}


//Cooldown overrides
//==============================================================================
if (at_uspecial_cooldown_override)
{ //Prevents SPECIALS while hovering
    move_cooldown[AT_DSPECIAL] += (move_cooldown[AT_DSPECIAL] > 2) ? 0 : 2;
    move_cooldown[AT_NSPECIAL] += (move_cooldown[AT_NSPECIAL] > 2) ? 0 : 2;
    move_cooldown[AT_FSPECIAL] += (move_cooldown[AT_FSPECIAL] > 2) ? 0 : 2;
    move_cooldown[AT_USPECIAL] += (move_cooldown[AT_USPECIAL] > 2) ? 0 : 2;
}
if (at_fspecial_cooldown_override)
{
    move_cooldown[AT_FSPECIAL] += (move_cooldown[AT_FSPECIAL] > 2) ? 0 : 2;
}

//other_update.gml
//==============================================================================
user_event(0);

//Compat specific
//==============================================================================
//Wall-e
if (walle_taunt_playing)
{
	walle_taunt_buffer = 60 * 12;
}
if (walle_taunt_buffer > 0)
{
	walle_taunt_buffer--;
	suppress_stage_music(0.1, 0.2);
}

//Kirby
if (swallowed && instance_exists(enemykirby))
{
	var ability_spr = sprite_get("cmp_kirby");
	var ability_hurt = sprite_get("cmp_kirby_hurt")
	var ability_icon = sprite_get("cmp_kirby_icon")
	var kirby_sleep_sfx = sound_get("cmp_kirby_sleep")
	with (enemykirby) 
	{
		//Define AT_EXTRA_3 for Kirby
		set_attack_value(AT_EXTRA_3, AG_CATEGORY, 2);
        set_attack_value(AT_EXTRA_3, AG_SPRITE, ability_spr);
        set_attack_value(AT_EXTRA_3, AG_AIR_SPRITE, ability_spr);
        set_attack_value(AT_EXTRA_3, AG_NUM_WINDOWS, 3);
        set_attack_value(AT_EXTRA_3, AG_OFF_LEDGE, 1);
        set_attack_value(AT_EXTRA_3, AG_HURTBOX_SPRITE, ability_hurt);
        
        set_window_value(AT_EXTRA_3, 1, AG_WINDOW_TYPE, 0);
        set_window_value(AT_EXTRA_3, 1, AG_WINDOW_LENGTH, 8);
        set_window_value(AT_EXTRA_3, 1, AG_WINDOW_ANIM_FRAMES, 1);
        
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_TYPE, 0);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_LENGTH, 48);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAMES, 5);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAME_START, 1);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_HAS_SFX, 1);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_SFX_FRAME, 12);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_SFX, kirby_sleep_sfx);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.5);
        
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_TYPE, 0);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_LENGTH, 40);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAMES, 8);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAME_START, 6);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.5);
        
        //absurd values, but prevents movement during the move
        //can_move cannot be set to false for kirby... I suspect update order is at fault
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_CUSTOM_AIR_FRICTION, 999);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_CUSTOM_AIR_FRICTION, 999);
        
        set_num_hitboxes(AT_EXTRA_3, 0);
		
		newicon = ability_icon;
		//Nozomi will track this Kirby to handle sleep debuff shenanigans
		noz_handler_id = other;
		noz_has_kirby_ability = true;
	}
	swallowed = false;
}

//DEFINES
//==============================================================================
#define trueground()
return !free && 
   (noone != collision_rectangle( bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, asset_get("solid_32_obj"), false, true) ||
    noone != collision_rectangle( bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, asset_get("obj_stage_article_solid"), false, true) ||
    noone != collision_rectangle( bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, asset_get("obj_stage_article_platform"), false, true) ||
    noone != collision_rectangle( bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, asset_get("jumpthrough_32_obj"), false, true) );
        