#macro NICE 69
#macro RANGE 2

//catches playtest objects and Abyss mode!
#macro NUM_PLAYERS 8

sprite_index = null_sprite;

if (nice_buddy_redundant) exit;

if ("nice_status" not in self)
{
    //initialize status arrays
    nice_status = [];
    for (var i = 0; i <= NUM_PLAYERS; i++)
    {
        nice_status[i] = { niced:false, prev_dmg:0 };
    }
    
    with (asset_get("pet_obj")) if (self != other)
    {
        nice_buddy_redundant = true;
    }
}
else
{
    var need_sfx = false;
    for (var p = 0; p <= NUM_PLAYERS; p++)
    {
        var player_status = nice_status[p];
        var new_dmg = get_player_damage(p);
        
        if (player_status.prev_dmg != new_dmg)
        {
            var diff = new_dmg - player_status.prev_dmg;
            var digits = abs(new_dmg) % 100;
            //damage correction
            if (abs(digits - NICE) <= RANGE)
            {
                if (abs(diff) > 1 && !player_status.niced)
                {
                    //correct damage to land more easily on the nice number
                    var correction = (NICE - digits) * sign(new_dmg);
                    take_damage(p, -1, correction);
                }
                
                player_status.niced = true;
            }
            else
            {
                player_status.niced = false;
            }
            //=================
            
            new_dmg = get_player_damage(p);
            if ((abs(new_dmg) % 100) == NICE) 
            {
                need_sfx = true;
            }
            //keep track
            player_status.prev_dmg = new_dmg;
        }
    }
    if (need_sfx)
    {
        sound_play(sound_get("nice"), false, 0, 1, 1);
    }
}
