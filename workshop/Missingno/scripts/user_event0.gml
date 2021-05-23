//user_event0.gml
//aka. unsafe_animation.gml
if ("msg_unsafe_random" not in self) exit;

var RNG = msg_unsafe_random;
var INT = 0;
var FRQ = 0;


//================================================================
// BITWISE RANDOM UINT32 MAP = 0x00000000 00000000 00000000 00000000
// Effects:        Using bits: 
//  - Shudder                                                 XXXXXX
//  - VSync                                              XX XXXX
//  - wrong image_index
//'M- wrong sprite_index
//  - trail
//================================================================

with (msg_unsafe_effects)
{
//===========================================================
// SHUDDER 
// type: PARAMETER
    if (shudder.freq > GET_RNG(RNG, 8, 0x3F))
    {
        other.draw_x += shudder.horz_max * GET_INT(RNG, 0, 0x0F, true);
        other.draw_y += shudder.vert_max * GET_INT(RNG, 4, 0x0F, true);
    }
//===========================================================
// BAD VSYNC
// type: REDRAW
    if (bad_vsync.timer > 0)
    {
        bad_vsync.timer--;
        var height_max = sprite_get_height(other.sprite_index);
        bad_vsync.clipbot = floor(GET_INT(RNG, 0, 0xFF, false) * height_max);
        bad_vsync.cliptop = bad_vsync.clipbot + GET_INT(RNG, 2, 0x0F, false) * height_max/3;
        bad_vsync.horz = bad_vsync.horz_max * 2 * GET_INT(RNG, 4, 0x0F, true);
    }
    if (bad_vsync.freq > GET_RNG(RNG, 8, 0x3F))
    {
        bad_vsync.timer = 2;
    }
//===========================================================
}

//===========================================================
#define GET_RNG(RNG, offset, mask)
{
    return ((RNG >> offset) & mask);
}
//===========================================================
// returns an intensity for the effect, between 0 and 1.
// if centered is true, this will be between -0.5 and +0.5 instead.
#define GET_INT(RNG, offset, mask, centered)
{
    if (mask == 0) return 0;
    return ((RNG >> offset) & mask) * (1.0/mask) - (centered * 0.5);
}