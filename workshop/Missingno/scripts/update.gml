//update.gml

at_prev_dir_buffer = clamp(at_prev_dir_buffer + spr_dir, -6, 6);

with (oPlayer) if (self != other)
{
    other.at_bspecial_last_move.target = self;
}

/*

if !("t" in self) t = 0;
var array = variable_instance_get_names(id);
t = (t + 1) % (array_length(array))
str = array[t] + ":" + string(variable_instance_get(id, array[t]));
print_debug(str);
*/

//print_debug(string(owner));
//print_debug(string(temp_string));
//print_debug(string(temp_comp_player));

if (gfx_glitch_death)
{
    gfx_glitch_death = false;
    set_player_stocks(player, 0);
    
    //detect if glitch-death ended match
    //things to try:
    //- moving setplayerstocks in death directly
    //-setting to zero stocks if winning (detect other players death)
    //
    var alive_players = 0;
    for (var p = 1; p <= 4 && !(alive_players > 1); p++)
    {
        if (is_player_on(p) && get_player_stocks(p) > 0)
        {
            alive_players++;
        }
    }
    if (alive_players == 1)
    {
        end_match();
    }
}

/*
if !("t" in self) {
    t = noone;
var count = 0;
    //with (asset_get("solid_32_obj"))
    with (asset_get("par_block"))
    {
        other.t = self;
        count++;
    //var array = variable_instance_get_names(self);
    //other.t = (other.t + 1) % (array_length(array))
    //str = array[other.t] + ":" + string(variable_instance_get(id, array[other.t]));
    //print_debug(str);
    }
print_debug(string(count));

}
if (t != noone) with (t)
{
    move_towards_point( 500, 300, distance_to_point(500, 300));
    //instance_change(asset_get("par_jumpthrough"))
}
//object_set_solid(t, false);
    

//var obj = instance_place( x, y+1, all);
//var zzz = obj.zuwsw;
*/