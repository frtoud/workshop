//post_draw
#macro BAR_WIDTH   18
#macro BAR_OFFSET  12
#macro TEXT_OFFSET  4
#macro TEXT_HEIGHT 14

if (msb_data == noone) exit; // let buddy initialize first

var data = msb_data.player_milestones[player];

//==============================================================================
//PULSES
if (msb_pulse_timer > 0)
{
    var alpha = ease_quadOut(0, 100, msb_pulse_timer, msb_pulse_timer_max) / 100.0;
    var spr = msb_pulse_kill ? pulse_green_spr : pulse_red_spr;
    draw_sprite_ext(spr, 0, x, y, 1, 1, 0, c_white, alpha);
}

//LINE
if (!msb_reward_active)
{
    draw_sprite(bar_line_spr, 0, x, y - BAR_OFFSET - msb_bar_max);
}

//==============================================================================
//KILLS
var kills_x = -17;
draw_sprite_part(bar_green_spr, 0, 0, 0, BAR_WIDTH, msb_bar_kills_height, 
                 x + kills_x, y - BAR_OFFSET - msb_bar_kills_height);

draw_vertical_number(text_green, text_blue, x + kills_x + TEXT_OFFSET,
                     y - BAR_OFFSET - TEXT_HEIGHT, msb_kills, msb_bar_kills_height);

//DEATHS
var deaths_x = -1;
draw_sprite_part(bar_red_spr, 0, 0, 0, BAR_WIDTH, msb_bar_deaths_height, 
                 x + deaths_x, y - BAR_OFFSET - msb_bar_deaths_height);
                 
draw_vertical_number(text_red, text_blue, x + deaths_x + TEXT_OFFSET,
                     y - BAR_OFFSET - TEXT_HEIGHT, msb_deaths, msb_bar_deaths_height);

//==============================================================================
//TWINKLES
if (msb_reward_active)
{
    draw_sprite(twinkle_spr, msb_twinkle.timer/3, msb_twinkle.posx, msb_twinkle.posy);
}

//BONUS
if (msb_reward_timer > 0)
{
    draw_sprite_part(reward_spr, 0, 0, 0, min(msb_reward_timer*25, 400), 172, x + 20, y - 200)
    
    if (msb_reward_timer > 15)
    {
        draw_debug_text(round(x + 195), round(y - 90), "https://steamcommunity.com/");
        draw_debug_text(round(x + 140), round(y - 72), "sharedfiles/filedetails/?id=" + msb_reward_string);
    }
}

//TEXTS
//==============================================================================
#define draw_vertical_number(font_spr, blue_font_spr, xpos, ypos, value, height)
{
    #macro NUM_HEIGHT 14
    
    value = clamp(value, 0, 999);
    
    var h = floor(value / 100);
    var t = floor((value % 100) / 10);
    var u = value % 10;
    //does the number fit in the bar?
    var req_digits = (h > 0 ? 3 : (t > 0 ? 2 : 1 ));
    
    var font = font_spr;
    if (req_digits * (2 + NUM_HEIGHT) > height)
    {
        font = blue_font_spr;
        ypos -= height;
    }
    
    draw_sprite(font, u, xpos, ypos);
    if (req_digits > 1) draw_sprite(font, t, xpos, ypos - NUM_HEIGHT);
    if (req_digits > 2) draw_sprite(font, h, xpos, ypos - (2*NUM_HEIGHT));
    
}