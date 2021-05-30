//==============================================================
//Clean up data structures
if ("uhc_blade_spr_map" in self && ds_map_valid(uhc_blade_spr_map))
{
    ds_map_destroy(uhc_blade_spr_map);
}
//==============================================================
//prevent this from looping in the CSS
if (uhc_taunt_current_video != noone)
{
    sound_stop(uhc_taunt_current_video.song);
}

//==============================================================
//Sending win quotes to result screen
if (!uhc_handled_victory_quote)
{
    //default values
    var transfer_array = [];
    for (var p = 1; p <= 4; p++)
    { 
        transfer_array[p] = 
        {
            order: 99999,
            team: get_player_team(p),
            priority: 0, 
            quote:"", 
            held_cd_color:-1
        }
    }
    
    with (oPlayer) if (player <= 4)
    {
        var data = transfer_array[player];
        if (url == other.url) // Hypercam-specific
        //&& (test all player teams?)
        {
            //playtest mode breaks this, somehow
            var temp_holding_blade = (uhc_has_cd_blade) && instance_exists(uhc_current_cd);
            
            //only one Hypercam has to handle this for everyone: notify them.
            uhc_handled_victory_quote = true;
            
            data.priority = 1;
            data.quote = uhc_victory_quote;
            
            if (get_match_setting(SET_RUNES))
            {
                data.priority = 2;
                data.quote = "thank u 4 watching my king for a day speedrun, sucribe for more content :)";
            }
            //else... >:]
            
            //blade color
            if (temp_holding_blade) && (uhc_current_cd.player_id != self)
            { data.held_cd_color = get_player_color(uhc_current_cd.player_id.player); }
        }
        else if ("uhc_victory_quote" in self)
        {
            data.priority = 1;
            data.quote = uhc_victory_quote;
        }
        else
        {
            var builtin_quote = try_get_quote(url);
            if (string_length(builtin_quote) > 0)
            {
                data.priority = 1;
                data.quote = builtin_quote;
            }
        }
        
        transfer_array[player] = data;
    }
    
    //Hackiest of hacks: smuggle into victory screen using a persistent hitbox!
    var smuggler = instance_create(0, 0, "pHitBox");
    smuggler.persistent = true; //survive room end
    smuggler.type = 2;
    smuggler.length = 60; //will destroy itself automatically after one second.
    
    smuggler.uhc_victory_screen_array = transfer_array;
}

//==============================================================
#define try_get_quote(char_url)
{
    //=========================================================
    // Approximate maximum line:
    // "aaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaa";
    //=========================================================
    var quote = "";
    switch (char_url)
    {
        //=================================================================
        // Hi!
        // If you see your mod's URL in here, feel free to copy/edit
        // the victory quotes into your own mod with:
        //    uhc_victory_quote = "Helo yutub";
        // This will override the built in behavior!
        //=================================================================
        // KFAD
        //=================================================================
        case "2218690857": // King Dedede
           quote = "if this tutoriel helped you pls subscribe for more kirby videos"; 
           break;
        case "2263955842": // Reimu (ZUN stand-in)
           quote = "2hu lets play #948539 ZUN FINAL BOSS"; 
           break;
        case "2318304706": // Geno
           quote = "https://www.latlmes.com/ opinion/free-snes-emulator -no-survey-1"; 
           break;
        case "2177081326": // Nico Nico
           quote = "i would have lovd to tem up with u!! lets hang out more sometime!"; 
           break;
        //=================================================================
        // Bonus
        //=================================================================
        case "2108835464": // Take a guess
           quote = "lmaoooooo ahahahshahajh he said it he said tit im piickle woodmaaaan!!!!11!!"; 
           break;
        //=================================================================
        // Base cast
        //=================================================================
        case CH_ZETTERBURN: 
           quote = "Thx 4 wathcing Lion King streaming 240p suscribe for mre movies"; 
           break;
        case CH_FORSBURN:
           quote = "gta san adreas walkthru #51 final mission vs big smoke"; 
           break;
        case CH_CLAIREN: 
           quote = "future gen. consels wii2 ps4 xbox720?"; 
           break;

        case CH_WRASTOR:
           quote = "u got sent rigt into the danger zone xd"; 
           break;
        case CH_ABSA:
           quote = "finger eleven - paralyser (special goat remix thx 4 wathing"; 
           break;
        case CH_ELLIANA:
           quote = "tf2 2008 in 2012+ download (no steam)"; 
           break;

        case CH_ORCANE:
           quote = "i dont remeber this pokemon??? pls comment if you know whos that"; 
           break;
        case CH_ETALUS: 
           quote = "Club Pengun lets play (part 4 final boss & endig)"; 
           break;
        case CH_RANNO:
           quote = "Frogger's adventire (gcn) title theme & ending"; 
           break;

        case CH_KRAGG: 
           quote = "How 2 get mincraft free no virus 100% workign 2011"; 
           break;
        case CH_MAYPUL:
           quote = "ending theme: badgerbadgerbadgre remix by weebl"; 
           break;
        case CH_SYLVANOS:
           quote = "THIS VIDEO CONTAINS SNOOP DOGG"; 
           break;

        case CH_ORI:
           quote = "How 2 get double NP in neopets (Updated 2008)"; 
           break;
        case CH_SHOVEL_KNIGHT:
           quote = "duck tales was better on nes anyway"; 
           break;

        default: break;
    }
    return quote;
}
