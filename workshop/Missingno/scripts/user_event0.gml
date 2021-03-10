//user_event0.gml
//aka. unsafe_update.gml
if ("msg_unsafe_random" not in self) exit;

var RNG = msg_unsafe_random.rng;
var INT = msg_unsafe_random.intensity;
var FRQ = msg_unsafe_random.frequency;


//================================================================
// BITWISE RANDOM UINT32 MAP = 0x00000000 00000000 00000000 00000000
// Effects:        Using bits: 
//  - Shudder                                                 XXXXXX
//================================================================

with (msg_unsafe_effects)
{
//===========================================================

    if (shudder.timer > 0)
    {
        shudder.timer--;
        other.draw_x += INT/16.0 *  ((RNG & 0x0F) - 0x08);
        other.draw_y += INT/16.0 * (((RNG >> 0x0F) & 0x0F) - 0x08);
    }
    else if ((RNG & 0x3F) < FRQ)
    {
        shudder.timer = (((RNG >> 4) & 0x03) + 1);
    }
//===========================================================
    if (vsync.timer > 0)
    {
        var hmax = sprite_get_height(other.sprite_index);
        vsync.clipbot = GET_RNG(RNG, 8, 0xFF) * 1.0/(0xFF) * hmax;
        vsync.cliptop = vsync.clipbot + GET_RNG(RNG, 0, 0x0F);
        vsync.offset = INT/16 * (((RNG >> 0x0F) & 0x0F) - 0x08);
    }
    else if (GET_RNG(RNG, 4, 0x0F) < FRQ)
    {
        vsync.timer = 16;
    }
//===========================================================
}

#define GET_RNG(RNG, offset, mask)
{
    return ((RNG >> offset) & mask);
}