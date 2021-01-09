
// Lingering projectile hitboxes 
if ( is_a_cloud )
{
	// Air friction needs to apply vertically (in case of bashing or other shenans)
	vsp = (vsp < 0) ? min( 0.001, vsp + frict)
	                : max(-0.001, vsp - frict);
	
	if (attack == AT_DATTACK && dattack_speedcheck_timer > 0)
	{
		if (abs(player_id.hsp) > abs(hsp)) { hsp = player_id.hsp; }
		dattack_speedcheck_timer++;
	}
	
	// [RUNE H] -- Kicking clouds
	if (has_rune("H"))
	{
		if (kick_cooldown > 0) 
		{
			kick_cooldown--;
		}
		else
		{
		    try_getting_kicked();
		    
			if (kick_boosted > 0)
			{
				kick_boosted--;
				frict = boosted_friction;
				air_friction = frict;
			}
			else
			{
				frict = saved_friction;
				air_friction = frict;
			}
		}
	}
	
	// Animating cloud
	// sprites: 0-1 2-3-4 5-6
	if (hitbox_timer > length - anim_fade_frames) //end
	{
		image_index = max(5, image_index);
	}
	else if (hitbox_timer > anim_fade_frames) && (image_index >= 5) //loop
	{
		image_index = 2;
	}
	
    // spawn flickering snow effects
	spawn_twinkle();
}
//still needs snow flickers
else if (attack == AT_BAIR && hbox_num == 2)
{
	spawn_twinkle();
}

//==================================================================
//DSPECIAL's counter shards
if ( (attack == AT_DSPECIAL && hbox_num == 4) )
{
	//Homing to target
	if (do_homing)
	{
		if (homing_target == noone || hitbox_timer > player_id.noz_dspecial_homing_time
		|| (hitbox_timer > player_id.noz_dspecial_pre_homing_time 
		    && point_distance(x, y, homing_target.x, homing_target.y - homing_target.char_height/2) < 30))
		{
			do_homing = false;
		}
		else
		{
			//adjust hsp/vsp
			var lookat_angle = point_direction(x, y, homing_target.x, homing_target.y - homing_target.char_height/2);
			
			var target_hsp = lengthdir_x(player_id.noz_dspecial_top_speed, lookat_angle);
			var target_vsp = lengthdir_y(player_id.noz_dspecial_top_speed, lookat_angle);
			
			var time_fraction = min(1, (1/100.0) * 
			    ease_quadIn(0, 100, hitbox_timer, player_id.noz_dspecial_homing_time/2));
			hsp = hsp * (1.0 - time_fraction) + target_hsp * (time_fraction);
			vsp = vsp * (1.0 - time_fraction) + target_vsp * (time_fraction);
		}
	}
	
	if (hitbox_timer == player_id.noz_dspecial_pre_homing_time )
	{
		//reactivate destructibility
		transcendent = false;
	}
	
	//visuals
	proj_angle = point_direction(0, 0, hsp, vsp);
	if (player_id.anim_do_draw_twinkle)
    {
    	var k = spawn_hit_fx(x-5, y-5, player_id.vfx_snow_twinkle);
	    k.depth = depth + 1;
    }
}

//====================================================================
#define spawn_twinkle()
if ( player_id.anim_do_draw_twinkle)
{
	var radius = image_xscale*200; // Assume circular: WIDTH == HEIGHT
	var kx = x - (radius / 2) + player_id.anim_rand_x * radius;
	var ky = y - (radius / 2) + player_id.anim_rand_y * radius;
    
    var k = spawn_hit_fx(kx, ky, player_id.vfx_snow_twinkle);
	k.depth = depth - 1;
}
//====================================================================
#define try_getting_kicked()
{
	var top_priority = 0;
	var top_damage = 0;
	var top_hitbox = noone;
	with (pHitBox)
	{
		if (self != other && (top_priority < hit_priority || 
		 top_priority == hit_priority && top_damage < damage)
		   && (("is_a_cloud" not in self) || (!is_a_cloud))
		   && place_meeting(x, y, other) )
		{
			top_priority = hit_priority;
			top_damage = damage;
			top_hitbox = self;
		}
	}
	
	//best hitbox for being kicked
	if instance_exists(top_hitbox)
	{
		var angle = get_muno_angle(top_hitbox);
		//simulating kb calculations with cloud
		var force = player_id.noz_cloudkick_mult * 
		 (top_hitbox.kb_value + player_id.noz_cloudkick_scale * top_hitbox.kb_scale * 0.12)
		
		hsp += lengthdir_x(force, angle);
		vsp += lengthdir_y(force, angle);
		//recalculated additive force clamped to a maximum
		force = clamp(point_distance(0, 0, hsp, vsp), 0, player_id.noz_cloudkick_speed);
		angle = point_direction(0, 0, hsp, vsp);
		hsp = lengthdir_x(force, angle);
		vsp = lengthdir_y(force, angle);
		
	    //reset cloud's timer to start of loop
		hitbox_timer = anim_fade_frames;
		
		//boosts friction!
		kick_boosted = 8;
	}
}

//==============================================================================
// returns the angle of an hitbox while considering HG_MUNO_OBJECT_LAUNCH_ANGLE
#define get_muno_angle(hitbox)
{
	var angle = 0;
	//MUNO compat
    if ("HG_MUNO_OBJECT_LAUNCH_ANGLE" in hitbox.player_id) with (hitbox.player_id) 
    { angle = get_hitbox_value(hitbox.attack, hitbox.hbox_num, HG_MUNO_OBJECT_LAUNCH_ANGLE); }
    switch(angle)
    {
		// Special values:
		//  0: use normal angles
		// -1: Horizontal Away (simulates Angle 0 flipper 3)
		// -2: Radial Away (resembles flipper 8)
    	case 0: 
    	   angle = get_hitbox_angle(hitbox);
    	   break;
    	case -1:
    	   angle = (x > hitbox.x) ? 0 : 180;
    	   break;
    	case -2:
    	   angle = point_direction(hitbox.x, hitbox.y, x, y);
    	   break;
    	default:
    	   // flips angle horizontally based on spr_dir
    	   // ±90° rotates the angle and cancel themselves
    	   // negative spr_dir flips it vertically (but rotated back)
    	   // modulo 360 to stay in usual ranges
    	   angle = ((hitbox.spr_dir * (angle - 90)) + 90 + 360) % 360;
    	   break;
    }
    return angle;
}