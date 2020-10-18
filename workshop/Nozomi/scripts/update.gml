
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
    	create_hitbox(AT_DAIR, 3, 0, 0); 
    	at_dair_need_landing_lag_hitbox = false;
    }
}

//Pratfall gravity dampening
//==============================================================================
if (state == PS_PRATFALL && vsp > noz_pratfall_max_vsp)
{ 
	vsp = noz_pratfall_max_vsp;
}

//Respawn resets
//==============================================================================
//TODO: Move to death.gml?
if (state == PS_RESPAWN)
{
	at_dspecial_damage_block = noz_dspecial_damage_max;
	
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
		!(state == PS_ATTACK_AIR && attack == AT_USPECIAL && 
		  (window == 5 || window == 6 && window_timer < 6)) )
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
			var hover_cost_mult = 1.2;
			if (!joy_pad_idle)
			{
	            target_hsp = lengthdir_x(noz_uspecial_hover_hspeed, joy_dir);
	            target_vsp = lengthdir_y(noz_uspecial_hover_vspeed, joy_dir);
	            hover_cost_mult -= lengthdir_y(0.5, joy_dir);
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
	var recharge = (!free ? 1 : 0.5) * noz_uspecial_hover_recharge;
	at_uspecial_hover_meter = (at_uspecial_hover_meter >= noz_uspecial_hover_max) ? 
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
//TODO at_dspecial_fizzle? when not enough charge; only shines weakly


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

//DEFINES
//==============================================================================
#define trueground
/// trueground()
return !free && 
       (noone != instance_place( x, y+1, asset_get("solid_32_obj")) ||
        noone != instance_place( x, y+1, asset_get("obj_stage_article_solid")) ||
        noone != instance_place( x, y+1, asset_get("obj_stage_article_platform")) ||
        noone != instance_place( x, y+1, asset_get("jumpthrough_32_obj")) );
        