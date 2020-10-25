
// Lingering projectile hitboxes spawn flickering snow effects
if ( player_id.anim_do_draw_twinkle &&
	 ( (attack == AT_BAIR && hbox_num == 2)
    || (attack == AT_FAIR && hbox_num == 2)
    || (attack == AT_DTILT && hbox_num == 2)
    || (attack == AT_DATTACK && hbox_num == 2) ))
{
	with (player_id) // Assume circular: WIDTH == HEIGHT
	{ other.radius = get_hitbox_value(other.attack, other.hbox_num, HG_WIDTH); }
	
	var kx = x - (radius / 2) + player_id.anim_rand_x * radius;
	var ky = y - (radius / 2) + player_id.anim_rand_y * radius;
    
    var k = spawn_hit_fx(kx, ky, player_id.vfx_snow_twinkle);
	k.depth = depth - 1;
}

//Air friction needs to apply vertically (in case of bashing)
if ( (attack == AT_BAIR && hbox_num == 2)
  || (attack == AT_FAIR && hbox_num == 2) )
{
  	vsp =  (vsp < 0) ? min( 0.001, vsp + air_friction)
  	                 : max(-0.001, vsp - air_friction);
}