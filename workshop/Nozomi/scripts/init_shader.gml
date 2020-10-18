//shader shenanigans

//EarlyAccess + Bootleg
if ( (get_player_color(player) == 7)
  || (get_player_color(player) == 8) )
{
    set_character_color_shading( 0, 0.0 ); 
    set_character_color_shading( 1, 0.0 );
    set_character_color_shading( 2, 0.0 );
    set_character_color_shading( 3, 0.0 );
    set_character_color_shading( 4, 0.0 );
    set_character_color_shading( 5, 0.0 );
    set_character_color_shading( 6, 0.5 );
}

//Madeline Hair color effect
if ( (get_player_color(player) == 9)
  && ("at_uspecial_was_hovering" in self) )
{
    var hair_color = [get_color_profile_slot_r(9, 0),
                      get_color_profile_slot_g(9, 0), 
                      get_color_profile_slot_b(9, 0)];
    if (at_uspecial_was_hovering)
    {
        //Fade to blue
        hair_color[0] = ease_linear(hair_color[0], 60, 
           anim_hairblink_timer, anim_hairblink_max); //R
        hair_color[1] = ease_linear(hair_color[1], 240, 
           anim_hairblink_timer, anim_hairblink_max); //G
        hair_color[2] = ease_linear(hair_color[2], 255, 
           anim_hairblink_timer, anim_hairblink_max); //B
    }
    else
    {
        //White flash
        hair_color[0] = ease_linear(hair_color[0], 255, 
           anim_hairblink_timer, anim_hairblink_max); //R
        hair_color[1] = ease_linear(hair_color[1], 255, 
           anim_hairblink_timer, anim_hairblink_max); //G
        hair_color[2] = ease_linear(hair_color[2], 255, 
           anim_hairblink_timer, anim_hairblink_max); //B
    }
    
    set_character_color_slot( 0, floor(hair_color[0]), 
                                 floor(hair_color[1]), 
                                 floor(hair_color[2]));
    set_article_color_slot( 0, floor(hair_color[0]), 
                               floor(hair_color[1]), 
                               floor(hair_color[2]));
}