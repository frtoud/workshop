//animation.gml


//==================================================================
// BSPECIAL must consider the small_sprites parameter of the stolen sprites!
// note: regular draw event needs this to happen before pre_draw, apparently.
if (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) && (attack == AT_DSPECIAL_2)
{
    small_sprites = at_bspecial_last_move.small_sprites;
}