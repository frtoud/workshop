//DEFAULT COLOR (R,G,B)

//RGB - HSV
//121:132:159 - 222: 23: 62
// 93:102:122 - 221: 23: 47
// 55: 60: 72 - 222: 23: 28 - Main color
// 37: 40: 48 - 223: 22: 18
// 22: 24: 29 - 222: 24: 11
set_color_profile_slot(0, 0,  55,  60,  72); //Body
set_color_profile_slot_range(0,  2,  2, 36);

//RGB - HSV
//195:195:219 - 240: 10: 85
//118:118:158 - 240: 25: 61
// 60: 60:109 - 240: 44: 42 - Main color
// 45: 45: 86 - 240: 47: 33
// 28: 28: 68 - 240: 58: 26
// 17: 17: 38 - 240: 55: 14
set_color_profile_slot(0, 1,  60,  60, 109); //Lens
set_color_profile_slot_range(1,  1, 36, 44);

//RGB - HSV
//209:199:192 -  24:  8: 81
//199:178:133 -  40: 33: 78
//160:145:130 -  30: 18: 62 - Main color
//117:106: 75 -  44: 35: 45
set_color_profile_slot(0, 2, 160, 145, 130); //CD
set_color_profile_slot_range(2, 15, 20, 20);

//RGB - HSV
//232:237:239 - 197:  2: 93
//158:171:178 - 201: 11: 69 - Main color
set_color_profile_slot(0, 3, 158, 171, 178); //Paper
set_color_profile_slot_range(3,  5, 10, 25);


//RGB - HSV
//255: 25: 25 -   0: 90:100 - Main color
//232: 34: 34 -   0: 85: 90
//211:  0:  0 -   0:100: 82
set_color_profile_slot(0, 4, 255,  25,  25); //Blinker light (Red)
set_color_profile_slot_range(4,  1, 12, 20);

//==============================================================
//Technical shades
// For use by shaders only to create spin effect
// No visible influence for alts

//RGB - HSV
//117:255: 63 - 103: 75:100
//  8:242:  0 - 118:100: 94
// 68:204: 30 - 107: 85: 80 - "Main" color
set_color_profile_slot(0, 5,  68, 204,  30); //CD Spin 1 (Green)
set_color_profile_slot_range(5, 16, 16, 22);

//RGB - HSV
//207: 63:255 - 285: 75:100
//239:  0:239 - 300:100: 94
//169: 30:204 - 289: 85: 80 - "Main" color
set_color_profile_slot(0, 6, 169,  30, 204); //CD Spin 2 (Pink)
set_color_profile_slot_range(6, 16, 16, 22);

//RGB - HSV
// 63:111:255 - 225: 75:100
//  0:  0:239 - 240:100: 94
// 30: 62:204 - 229: 85: 80 - "Main" color
set_color_profile_slot(0, 7,  30,  62, 204); //CD Spin 3 (Blue)
set_color_profile_slot_range(7, 16, 16, 22);
//==============================================================

set_num_palettes(4);

// Retro -- too similar...
set_color_profile_slot(1, 0,  70,  70,  70); //Body
set_color_profile_slot(1, 1, 120, 120, 160); //Lens
set_color_profile_slot(1, 2, 205, 180, 160); //CD
set_color_profile_slot(1, 3, 190, 180, 160); //Paper
set_color_profile_slot(1, 4, 255,  25,  25); //Blinker 

// Unrestrained
set_color_profile_slot(2, 0,  40,  40,  40); //Body -- needs shading x0.5
set_color_profile_slot(2, 1, 255,  25,  35); //Lens
set_color_profile_slot(2, 2,  45,  45,  45); //CD
set_color_profile_slot(2, 3,  65,  65,  65); //Paper -- needs shading x0.0
set_color_profile_slot(2, 4, 255,  25,  25); //Blinker

// Nice
set_color_profile_slot(3, 0, 110,  50,  35); //Body
set_color_profile_slot(3, 1, 120, 150, 115); //Lens
set_color_profile_slot(3, 2,  25,  90,  25); //CD
set_color_profile_slot(3, 3, 200, 150,   0); //Paper
set_color_profile_slot(3, 4, 255,  25,  25); //Blinker

//SANDBERT STUFF
/*
//DEFAULT COLOR (R,G,B)
set_color_profile_slot(0, 8, 255, 255, 255); //SKIN

//COLOR RANGE (H,S,V)
set_color_profile_slot_range(8, 4, 10, 41);

//Blue Color
set_color_profile_slot(1, 8, 157, 159, 255);

//Red Color
set_color_profile_slot(2, 8, 255, 75, 75);

//Green Color
set_color_profile_slot(3, 8, 120, 255, 120);

//Black Color
set_color_profile_slot(4, 8, 180, 180, 180);

//Yellow Color
set_color_profile_slot(5, 8, 235, 248, 69);
*/