//hitbox_update


//==========================================================
if (attack == AT_FSPECIAL)
{
    image_index = clamp(2 + (vsp/2), 0, 6)
    if (!free) { destroyed = true; }
}

//==========================================================
if (attack == AT_FSPECIAL_2)
{
    for (var p = 0; p < array_length(can_hit); p++)
    {
        if (can_hit[p] < 1) can_hit[p]++;
    }
}


//==========================================================
if (attack == AT_DSPECIAL_2)
{
    //All copied projectiles fall under here
    if (grounds == 0) && (!free) { destroyed = true; }
}

