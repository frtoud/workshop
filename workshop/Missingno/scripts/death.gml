//death.gml

if (get_player_stocks(player) == 1)
{
    set_player_stocks(player, 2);
    gfx_glitch_death = true;
}

