//shader shenanigans

var color_alt = get_player_color(player);

//EarlyAccess + Bootleg
if ( (color_alt == 7) || (color_alt == 14) )
{
    set_character_color_shading( 0, 0.0 ); 
    set_character_color_shading( 1, 0.0 );
    set_character_color_shading( 2, 0.0 );
    set_character_color_shading( 3, 0.0 );
    set_character_color_shading( 4, 0.0 );
    set_character_color_shading( 5, 0.0 );
    set_character_color_shading( 6, 0.5 );
}

//Hair color effects
if (("at_uspecial_was_hovering" in self) )
{
    var hair_color = [get_color_profile_slot_r(color_alt, 0),
                      get_color_profile_slot_g(color_alt, 0), 
                      get_color_profile_slot_b(color_alt, 0)];
    if (at_uspecial_was_hovering && (color_alt == 12))
    {
        //Fade to blue (only for Madeline)
        hair_color[0] = ease_linear(hair_color[0], 60, 
           anim_hairblink_timer, anim_hairblink_max); //R
        hair_color[1] = ease_linear(hair_color[1], 240, 
           anim_hairblink_timer, anim_hairblink_max); //G
        hair_color[2] = ease_linear(hair_color[2], 255, 
           anim_hairblink_timer, anim_hairblink_max); //B
    }
    else if (anim_hud_fadeout > 0)
    || (!at_uspecial_was_hovering && (color_alt == 12))
    {
        //White flash 
        var flash_value = max(anim_hairblink_timer, anim_hud_fadeout);
        hair_color[0] = ease_linear(hair_color[0], 250, 
           flash_value, anim_hairblink_max); //R
        hair_color[1] = ease_linear(hair_color[1], 255, 
           flash_value, anim_hairblink_max); //G
        hair_color[2] = ease_linear(hair_color[2], 255, 
           flash_value, anim_hairblink_max); //B
    }
    
    set_character_color_slot( 0, floor(hair_color[0]), 
                                 floor(hair_color[1]), 
                                 floor(hair_color[2]));
    set_article_color_slot( 0, floor(hair_color[0]), 
                               floor(hair_color[1]), 
                               floor(hair_color[2]));
}