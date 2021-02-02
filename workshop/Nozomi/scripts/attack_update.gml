//B - Reversals
if ( attack == AT_NSPECIAL || attack == AT_FSPECIAL 
  || attack == AT_DSPECIAL || attack == AT_USPECIAL)
{
    trigger_b_reverse();
}

switch (attack) {
//==============================================================
case AT_JAB:
{
    switch (window)
    {
        case 1: 
        {
            if (window_timer == 1)
            {
                at_jab_infinite = false;
                at_jab_inf_count = 3;
                at_jab_finisher = false;
                clear_button_buffer(PC_ATTACK_PRESSED);
            }
            else if (attack_pressed)
            { 
                at_jab_infinite = true;
            }
        } break;
        case 2: 
        {
            if (at_jab_infinite && 
            window_timer > get_window_value(AT_JAB, 2, AG_WINDOW_CANCEL_FRAME))
            {
                window = 3;
                window_timer = 0;
                //Manually applying HSP from move data
                hsp += spr_dir * get_window_value(AT_JAB, 3, AG_WINDOW_HSPEED);
            }
            else if (attack_pressed)
            { 
                at_jab_infinite = true;
            }
        } break;
        case 3:
        case 4:
        case 5: 
        {
            move_cooldown[AT_JAB] = 8;
            can_attack = has_hit && (at_jab_inf_count < 2);
            if (window_timer == get_window_value(AT_JAB, 3, AG_WINDOW_LENGTH))
            {
                window_timer = 0;
                if (at_jab_inf_count > 0)
                { 
                    at_jab_inf_count--;
                    // Windows 3, 4, 5 loop into each other
                    window += (window == 5) ? -2 : 1;
                }
                else
                { 
                    window = 6; 
                    at_jab_finisher = has_hit;
                }
            }
            else if (at_jab_inf_count < 2 && (attack_pressed || attack_down))
            { 
                at_jab_inf_count++;
            }
        } break;
        case 6:
        {
            can_attack = true;
            move_cooldown[AT_JAB] = 1;
            if ((at_jab_finisher)
            || (attack_pressed && window_timer > 6))
            {
                window = 7;
                window_timer = 0;
                //Manually applying HSP from move data
                hsp += spr_dir * get_window_value(AT_JAB, 7, AG_WINDOW_HSPEED);
            }
        } break;
        case 7:
        {
            if (window_timer == get_window_value(AT_JAB, 7, AG_WINDOW_LENGTH))
            {
                window = 8;
                window_timer = 0;
            }
        } break;
        default: break;
    }
} break;
//==============================================================
case AT_DTILT: 
{
    if (has_hit && window == 3)
    { 
        move_cooldown[AT_DTILT] = 2;
        can_attack = true;
    }
} break;
//==============================================================
case AT_FSTRONG:
{
    if (window == 2 && window_timer < 6)
    {
    	//first windbox does not count as a "hit"
        has_hit_player = false;
    }
    else if (window == 2 && !has_hit_player
    && window_timer == get_window_value(AT_FSTRONG, 2, AG_WINDOW_LENGTH))
    {
        //Skip window 3
        //Final hit only happens if the previous two hits connected
        window = 4;
        window_timer = 0;
    }
    else if (window == 4 && has_hit_player)
    {
        can_jump = true;
    }
} break;
//==============================================================
case AT_DSTRONG:
{
    if (has_hit) { can_jump = true; }
    
    //dstrong spreads through ice
    if (noz_rune_flags.dstrong_spread
    && window ==  get_hitbox_value(AT_DSTRONG, 3, HG_WINDOW)
    && window_timer == get_hitbox_value(AT_DSTRONG, 3, HG_WINDOW_CREATION_FRAME))
    {
    	var half_width = get_hitbox_value(AT_DSTRONG, 3, HG_WIDTH) / 2;
    	//try finding ice
    	var left_ice = collision_line(x - half_width, y+2, x - half_width, y-2, 
    	                              obj_article1, false, true);
    	if (left_ice != noone && left_ice.player_id == self)
    	{
    		left_ice.spike_timer = left_ice.spike_timer_max;
    		left_ice.spike_dir = -1;
    	}
    	
    	var right_ice = collision_line(x + half_width, y+2, x + half_width, y-2, 
    		                           obj_article1, false, true);
    	if (right_ice != noone && right_ice.player_id == self)
    	{
    		right_ice.spike_timer = right_ice.spike_timer_max;
    		right_ice.spike_dir = +1;
    	}
    }
} break;
//==============================================================
case AT_USTRONG:
{
    if (has_hit) { can_jump = true; }
} break;
//==============================================================
case AT_NAIR: 
{
    if (at_nair_hover_need_grid_adjust)
    {
        //Adjust NAIR's data values to make the "hover" variants
        if (at_uspecial_hovering && !at_uspecial_exhausted)
        {
            set_hitbox_value(AT_NAIR, 1, HG_HITBOX_Y, -46);
            set_hitbox_value(AT_NAIR, 2, HG_HITBOX_Y, -46);
            set_hitbox_value(AT_NAIR, 3, HG_HITBOX_Y, -46);
        }
        else
        {
            reset_hitbox_value(AT_NAIR, 1, HG_HITBOX_Y);
            reset_hitbox_value(AT_NAIR, 2, HG_HITBOX_Y);
            reset_hitbox_value(AT_NAIR, 3, HG_HITBOX_Y);
        }
        at_nair_hover_need_grid_adjust = false;
        destroy_hitboxes();
        attack_end();
    }
    
    //Slightly slows fall
    if (free && window == 2 && attack_down)
    { 
    	vsp *= (vsp > 2) ? 0.8 : 1; 
    	
    	if (noz_rune_flags.nair_boost
    	    && !hitpause && vsp > -5)
    	{
    		vsp -= 1.5;
    	}
    }
    else if (window == 4 && (has_hit || !free))
    {
    	iasa_script();
    }
} break;
//==============================================================
case AT_DAIR: 
{
	if (window == 1)
	{
	    //Cancels hover!
	    at_uspecial_hovering = false;
	    at_dair_early_cancel = false;
	}
    
    //see update.gml for the extra hitbox when landing.
    at_dair_need_landing_lag_hitbox = (window == 2 || window == 3);
    can_wall_jump = (window > 2);
    can_move = (window > 3);
    
    //Can cancel early if any hitbox hit
    if (has_hit && (window == 4))
    { 
        iasa_script();
    }
    //Can jump-cancel if the strong hitbox hit something
    else if ( (has_hit && window == 2) || at_dair_early_cancel)
    {
        at_dair_early_cancel = true;
        can_jump = true;
    }
    
    if (window <= 2 && !has_hit)
    {
        fall_through = attack_down;
    }
} break;
//==============================================================
case AT_FAIR:
{
    //half the recovery animation can be skipped
    if (window == 4 
    && window_timer >= get_window_value(AT_FAIR, 4, AG_WINDOW_LENGTH) / 2)
    {
        iasa_script();
    }
} break;
//==============================================================
case AT_DSPECIAL:
{
    switch (window)
    {
    	case 1: //Startup
    	{
    		if (window_timer == get_window_value(AT_DSPECIAL, 1, AG_WINDOW_LENGTH))
        	{
	            at_dspecial_has_reflected = false;
                at_dspecial_counter_target = noone;
                at_dspecial_countered_damage = 0;
	            at_dspecial_damage_block = floor(at_dspecial_damage_block);
	            
	            if (special_down && (at_dspecial_zone_timer < 1)
	            && (at_dspecial_damage_block > noz_dspecial_damage_min))
	            {
	                window = 3;
	                window_timer = 0;
	            }
	            else
	            {
	                anim_dspecial_shockwave_frame = 6;
	            }
        	}
    	} break;
    	case 2: //Shine
    	{
    		if (at_dspecial_zone.radius > 0) && (at_dspecial_zone.shine_cooldown == 0)
    		&& window_timer == get_hitbox_value(AT_DSPECIAL, 5, HG_WINDOW_CREATION_FRAME)
    		{
    			//Remote shining
    			var hb = create_hitbox(AT_DSPECIAL, 5, at_dspecial_zone.x, at_dspecial_zone.y);
                hb.image_xscale = at_dspecial_zone.radius/100;
                hb.image_yscale = hb.image_xscale;
    			at_dspecial_zone.shine_cooldown = noz_dspecial_remote_shine_cooldown;
    			with (at_dspecial_zone) 
    			{ sound_play(asset_get("sfx_zetter_shine_charged"), false, noone, 0.9, 1.4); }
    		}
    		
	        //Dampen momentum
	        hsp *= 0.8;
	        vsp *= (vsp > 0) ? 0.2 : 0.9;
    	} break;
    	case 3: //Counter
    	{
	        can_move = false;
	        can_fast_fall = false;
	        
	        if (window_timer < 6)
	        {
		        //Dampen momentum
		        hsp *= 0.8;
		        vsp *= (vsp > 0) ? 0.2 : 0.9;
	        }
	        
    		user_event(2);
	        
    		
    		if (window_timer == get_window_value(AT_DSPECIAL, 3, AG_WINDOW_LENGTH))
    		{
    		   window = (special_down && noz_rune_flags.reflector) ? 6 : 9; // >:]
    		   window_timer = 0;
    		}
    	} break;
    	case 4: //Shine Endlag window
    	{
    		can_jump = !was_parried;
            can_attack = !was_parried && 
                         (at_dspecial_has_reflected || has_hit_player);
    	} break;
    	case 5: //Counter success
    	{
	        can_fast_fall = false;
	        if (window_timer == get_hitbox_value(AT_DSPECIAL, 4, HG_WINDOW_CREATION_FRAME))
	        {
	        	//Helps visuals
	            invincible = true;
	            invince_time = noz_dspecial_invince_time;
	            at_dspecial_zone_timer = noz_dspecial_zone_time;
	            at_dspecial_zone_position.x = x;
	            at_dspecial_zone_position.y = y - (char_height/2);
	            
	        	if (at_dspecial_countered_damage > 0)
	        	{
	                sound_play(asset_get("sfx_may_arc_hit"), false, noone, 2, 1.1);
		        	//spawn ring of projectiles
		        	for (var i = 0; i < 6; i++)
		        	{
		        		var angle = 30 + (i * 60);
		        		var k = create_hitbox(AT_DSPECIAL, 4, x, y - 24);
		        		k.hsp = lengthdir_x(noz_dspecial_top_speed, angle);
		        		k.vsp = lengthdir_y(noz_dspecial_top_speed, angle);
		        		k.x += k.hsp;
		        		k.y += k.vsp;
		        		k.damage = 1 + floor(at_dspecial_countered_damage/6);
		        		k.depth = depth + 1;
		        		k.spr_dir = 1;
		        		
		        		k.homing_target = at_dspecial_counter_target;
		        	}
		        	at_dspecial_countered_damage = 0;
	            }
	        }
    	} break;
    	case 6: //Reflector
    	{
            can_move = false;
            can_fast_fall = false;
    		user_event(1);
    		
            if (!special_down)
            {
                window = 4;
                window_timer = 0; 
            }
            else if (window_timer == get_window_value(AT_DSPECIAL, 2, AG_WINDOW_LENGTH))
            {
                window_timer = 0; 
            }
    	} break;
    	case 7: //Instaparry window
    	{
            window = 2;
            window_timer = 0;
            init_shader();
    	}
    	case 8: //Vulnerable window
    	{
            window = 2;
            window_timer = 0;
    	} break;
    	case 9: //Counter Endlag window
    	default:
    	break;
    }
    
} break;
//==============================================================
case AT_NSPECIAL: 
{
    can_move = false;
    suppress_stage_music(0.5, 0.01);
    //Dampen fallspeeds
    vsp *= (vsp > 3) ? 0.25 : 1;
    
    if (window == 2 || window == 4)
    {
    	// use a collision test because singing somehow hurts RockWall's pillars
    	with (oPlayer)
    	{
    	    if (self != other && (get_player_team(self.player) != get_player_team(other.player))
    	        && (!free || other.noz_rune_flags.air_sleep) && noz_sleepimmune_timer == 0 && 
    	    	hurtboxID == collision_circle(other.x, other.y-25, 50, hurtboxID, true, false))
    	    {
		        noz_handler_id = other;
				noz_sleep_anim_timer = 0;
				noz_sleepimmune_timer = other.noz_nspecial_sleepimmune_max;
				
				// base + early hit bonus + (damage * mult) & capped
		        noz_sleep_timer = floor( min( (other.noz_nspecial_sleep_base 
		           + (other.window == 2 ? other.noz_nspecial_sleep_early : 0)
		           + get_player_damage(player) * other.noz_nspecial_sleep_mult)
		           , other.noz_nspecial_sleep_max) );
    	    }
    	}
    }
} break;
//==============================================================
case AT_FSPECIAL: 
{
    can_jump = (window > 2 && !was_parried);
    off_edge = (window < 4);
    at_fspecial_cooldown_override = true;
    
    if (window == 1)
    {
        if (window_timer == 1)
        {
            move_cooldown[AT_FSPECIAL] = noz_fspecial_cooldown;
            if (free)
            {
                at_fspecial_ylock = max(noz_fspecial_ylock_max, (y - (y % 16)));
                if (!noz_rune_flags.ice_longer)
                { set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HSPEED, 6); }
            }
            else
            {
                at_fspecial_ylock = y;
                reset_window_value(AT_FSPECIAL, 2, AG_WINDOW_HSPEED);
            }
            
            //remove previous ice
            if (noz_rune_flags.ice_longer)
            {
				with (obj_article1) if (player_id == other)
				{
				    should_die = true;
				}
            }
        }
        else if (free)
        {
        	//lengthen easing
            if (abs(y - at_fspecial_ylock) > 48)
            {
            	y += 16 * sign(at_fspecial_ylock - y);
            	window_timer--;
            }
            else
            {
	            y = ease_linear(y, at_fspecial_ylock, window_timer, 
	            get_window_value(AT_FSPECIAL, 1, AG_WINDOW_LENGTH));
            }
        }
    }
    else if (window == 2 || window == 3)
    {
        if (free) 
        { y = at_fspecial_ylock; }
        else
        { at_fspecial_ylock = y; }
        
        if (!joy_pad_idle)
		{
            var hsp_mult = lengthdir_x(1, joy_dir);
            if (hsp_mult * spr_dir >= 0)
            {
            	//dampen friction
                hsp += hsp_mult * 0.1;
            }
            else
            {
            	//reverse direction
                hsp += hsp_mult * 0.6;
            }
		}
        
        //Create new ice as you go
        var plat = collision_line(x, y-1, x, y+1, obj_article1, false, true);
        if (plat != noone && plat.player_id == id && !plat.should_die)
        {
            plat.article_timer = 0;
        }
        else
        {
            var k = instance_create(x + 8 - (x % 16), y, "obj_article1");
            if (noz_rune_flags.ice_dripping)
            {
            	k.has_proj = true;
            }
            if (noz_rune_flags.ice_longer)
            { 
            	k.does_not_decay = true;
            	k.random_proj_timer = noz_fspecial_airtime + 
            	random_func(5, noz_fspecial_lifetime-noz_fspecial_airtime, true);
            }
        }
        
        if (window == 3 && was_parried)
        {
        	window = 4;
        	window_timer = 0;
        }
    }
    else if (!was_parried) //window 4
    {
    	if (hsp == 0 && window_timer == 5 && !joy_pad_idle
    	    && (spr_dir * lengthdir_x(1, joy_dir)) > 0)
    	{
    		set_state(PS_IDLE_AIR); //set hurtbox
    	    state = PS_DOUBLE_JUMP;
    	    state_timer = 1; //avoid doublejump SFX
    	    vsp = -3;
    	    hsp = spr_dir * 3;
    	    off_edge = true;
    	}
    	else if (window_timer >= 5)
    	{
    		iasa_script();
    	}
    }
    
} break;
//==============================================================
case AT_USPECIAL: 
{
    switch (window)
    {
        case 1:
        {
            anim_hover_hair_frame = 0;
            at_uspecial_long = true;
            if (!special_down || at_uspecial_was_hovering)
            {
                if (window_timer < 8) && 
                (!at_uspecial_was_hovering || noz_rune_flags.enhanced_hover)
                {
                    //Tap: Smaller attack, activates hover directly
                    window = 6;
                    window_timer = 0;
                    //Manually applying VSP from move data
                    vsp += get_window_value(AT_USPECIAL, window, AG_WINDOW_VSPEED);
                    
                    if (at_uspecial_was_hovering) 
                    { 
                    	at_uspecial_hover_meter -= noz_uspecial_short_cost; 
                    	at_uspecial_exhausted = false;
                    }
                }
                else
                {
                    window = 2;
                    window_timer = 0;
                    at_uspecial_long = false;
                    if (free)
                    { at_uspecial_hover_meter -= noz_uspecial_short_cost; }
                }
            }
            //special was held; transitions normally to the longest attack
            else if (free && window_timer == get_window_value(AT_USPECIAL, window, AG_WINDOW_LENGTH))
            {
                at_uspecial_hover_meter -= noz_uspecial_long_cost;
            }
        } break;
        case 2:
        {
            if (window_timer == 1)
            {
                if (at_uspecial_was_hovering || at_uspecial_hover_meter <= 0)
                && (!noz_rune_flags.enhanced_hover)
                { 
                    at_uspecial_hover_meter = -1;
                    set_window_value(AT_USPECIAL, 5, AG_WINDOW_TYPE, 7);
                }
                else
                {
                    reset_window_value(AT_USPECIAL, 5, AG_WINDOW_TYPE);
                }
            }
        } break;
        case 3:
        {
            //Skip window for shorter variant
            if (!at_uspecial_long)
            {
                window = 4;
                window_timer = 0;
            }
        } break;
        case 4:
        {
            can_move = false;
            sound_stop(asset_get("sfx_ori_stomp_spin"));
            vsp = min(vsp, 0);
        }break;
        case 5:
        {
            can_move = false;
            vsp = min(vsp, 0);
            
            //initiate HoverMode!
            //See update.gml for the rest of this logic
            if (window_timer <= 1)
            {
	            at_uspecial_hovering = true;
	            at_uspecial_was_hovering = true;
	            at_uspecial_cooldown_override = true;
	            at_nair_hover_need_grid_adjust = true;
            }
        }break;
        case 6:
        {
            if (window_timer > 6)
            {
            	iasa_script();
            }
            //initiate HoverMode!
            //See update.gml for the rest of this logic
            else if (window_timer <= 1)
            {
	            at_uspecial_hovering = true;
	            at_uspecial_was_hovering = true;
	            at_uspecial_cooldown_override = true;
	            at_nair_hover_need_grid_adjust = true;
	            clear_button_buffer(PC_SPECIAL_PRESSED);
            }
            
        }break;
        default: break;
    }
} break;
//==============================================================
case AT_TAUNT:
{
    can_move = false;
    if (window == 4 && window_timer == get_window_value(AT_TAUNT, 4, AG_WINDOW_LENGTH))
    {
        //This taunt preserves momentum or could be performed on a moving platform.
        //Nozomi should usually reach the ground before the end of this window.
        set_state(PS_IDLE_AIR);
    }
} break;
//==============================================================
default: break;
}

//universal jumpcancelling
var is_aerial = (attack == AT_NAIR || attack == AT_DAIR || attack == AT_UAIR
              || attack == AT_FAIR || attack == AT_BAIR)
if (noz_rune_flags.jumpcancels && is_aerial && has_hit_player)
{
	can_jump = true;
	if (jump_pressed && djumps >= max_djumps)
	{
		//free simulated jump
		set_state(PS_DOUBLE_JUMP);
		move_cooldown[attack] = 5;
		if (hitpause) old_vsp = -djump_speed;
		else vsp = -djump_speed;
	}
}


