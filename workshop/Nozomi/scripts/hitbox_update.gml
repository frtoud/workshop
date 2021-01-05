
// Lingering projectile hitboxes 
if ( (attack == AT_BAIR && hbox_num == 2 && !has_rune("B"))
    || (attack == AT_FAIR && hbox_num == 2)
    || (attack == AT_DTILT && hbox_num == 2)
    || (attack == AT_DATTACK && hbox_num == 2) )
{ 
	if ( (attack == AT_BAIR) 
	  || (attack == AT_FAIR) )
	{
	    // Air friction needs to apply vertically (in case of bashing)
	  	vsp =  (vsp < 0) ? min( 0.001, vsp + air_friction)
	  	                 : max(-0.001, vsp - air_friction);
	}
	
	// Animating cloud
	// sprites: 0-1 2-3-4 5-6
	if (hitbox_timer > length - (2.0 / img_spd)) //end
	{
		image_index = max(5, image_index);
	}
	else if (hitbox_timer > (2.0 / img_spd)) && (image_index >= 5) //loop
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