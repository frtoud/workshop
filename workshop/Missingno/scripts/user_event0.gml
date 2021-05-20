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
    if (shudder.freq > GET_RNG(RNG, 0, 0x3F))
    {
        other.draw_x += shudder.horz_max *  ((RNG & 0x0F) - 0x08);
        other.draw_y += shudder.vert_max * (((RNG >> 0x0F) & 0x0F) - 0x08);
    }
//===========================================================
// BAD VSYNC
    if (bad_vsync.timer > 0)
    {
        bad_vsync.timer--;
        var height_max = sprite_get_height(other.sprite_index);
        bad_vsync.clipbot = GET_RNG(RNG, 8, 0xFF) * 1.0/(0xFF) * height_max;
        bad_vsync.cliptop = bad_vsync.clipbot + GET_RNG(RNG, 0, 0x0F);
        bad_vsync.horz = bad_vsync.horz_max * (((RNG >> 0x0F) & 0x0F) - 0x08);
    }
    else if (bad_vsync.freq > GET_RNG(RNG, 4, 0x3F))
    {
        bad_vsync.timer = 2;
    }
//===========================================================
}

#define GET_RNG(RNG, offset, mask)
{
    return ((RNG >> offset) & mask);
}