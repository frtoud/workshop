//init_shader.gml

//============================================
//remove all shading
set_character_color_shading(0, 0.0);
set_character_color_shading(1, 0.0);
set_character_color_shading(2, 0.0);
set_character_color_shading(3, 0.0);
//set 0-alpha to pixelblock zones
set_character_color_slot( 7, 0, 0, 0, 0);
set_article_color_slot( 7, 0, 0, 0, 0);
//============================================


if (object_index == asset_get("draw_result_screen"))
{
    //if !("sound_id" in self) { sound_id = true; print_debug("initshadered " + test_string) }
    var ty;
    draw_debug_text(400, 20*ty, "winner_name: " + string(winner_name)); ty++;
    //draw_debug_text(400, 20*ty, "winner: " + string(winner)); ty++;
    //draw_debug_text(400, 20*ty, "player: " + string(player)); ty++;
    //results_theme_enabled = false;
    
    //box_exit_x = (floor(results_timer/10));
    //player = 2;//(winner % 4);
    
    //winner_name = "Hey look what I did";
    
    with asset_get("result_screen_box")
    {
        if (player == other.player)
        {
            draw_sprite(sprite_get("glitch_bg"), 1, 400, 500);
        }
    }
    
    draw_debug_text(400, 20*ty, "kb: " + string(keyboard_string)); ty++;
    /* if !("t" in self) t = 0;
    t = (t + 1) % (60 * array_length(array))
    str = array[floor(t/60)] + ":" + string(variable_instance_get(id, array[floor(t/60)]));
    print_debug(str);*/
}

//if object_index == asset_get("result_screen_box")
//{
    //if !("sound_id" in self) { sound_id = true; print_debug("initshadered " + test_string) }
    
    //draw_debug_text(400, 20*ty, "player: " + string(player)); ty++;
    //print_debug(string(player));
//}
