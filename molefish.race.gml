#define init
// character select button
global.sprMenuButton = sprite_add("sprites/selectIcon/sprMolefishSelect.png", 1, 0, 0);
// character select portrait
global.sprPortrait = sprite_add("/sprites/portrait/sprPortraitMolefish.png", 1, 15, 198);

global.sprIcon = sprite_add("sprites/mapIcon/LoadOut_MoleFish.png", 1, 10, 10);

// character select sounds
global.sndSelect = sound_add("sounds/sndMolefishSelect.ogg");
var _race = [];
for(var i = 0; i < maxp; i++) _race[i] = player_get_race(i);
while(true){
 	//character selection sound
 	for(var i = 0; i < maxp; i++){
 		var r = player_get_race(i);
 		if(_race[i] != r && r = "molefish"){
 			sound_play(global.sndSelect);
 		}
 		_race[i] = r;
 	}
	wait 1;
}


#define create
bwep = wep_screwdriver;
// player instance creation of this race
// https://bitbucket.org/YellowAfterlife/nuclearthronetogether/wiki/Scripting/Objects/Player

// sprites
spr_idle = sprMolefishIdle;
spr_walk = sprMolefishWalk;
spr_hurt = sprMolefishHurt;
spr_dead = sprMolefishDead;
spr_sit1 = spr_idle;
spr_sit2 = spr_idle;

// sounds
snd_hurt = sndMolefishHurt;
snd_dead = sndMolefishDead;

// stats
maxspeed = 3.1;
team = 2;
maxhealth = 6;
melee = 0;	// can melee or not


#define game_start
// executed after picking race and starting for each player picking this race
// player-specific global variable init


#define step
// executed within each player instance of this race after step
// most actives and passives handled here
canswap = 0;
canpick = 0;


#define race_name
// return race name for character select and various menus
return "MOLEFISH";


#define race_text
// return passive and active for character selection screen
return "HAS MOLEFISH GUN";


#define race_portrait
// return portrait for character selection screen and pause menu
return global.sprPortrait;


#define race_mapicon
// return sprite for loading/pause menu map
return global.sprIcon;


#define race_swep
// return ID for race starting weapon
return "molefish";


#define race_avail
// return if race is unlocked
return 1;


#define race_menu_button
// return race menu button icon
sprite_index = global.sprMenuButton;

#define race_skins
// return number of skins the race has
return 1;


#define race_skin_avail
// return if skin is unlocked
return 1;

#define race_skin_button
// return skin switch button sprite
return global.sprIcon;


#define race_soundbank
// return build in race id for default sounds
return 0;


#define race_tb_text
// return description for Throne Butt
return "DOES NOTHING";


#define race_tb_take
// run when Throne Butt is taken
// player of race may not be alive at the time

#define race_ultra_name
// return a name for each ultra
// determines how many ultras are shown
switch(argument0){
	case 1: return "NOTHING";
	default: return "";
}


#define race_ultra_text
// recieves ultra mutation index and returns description
switch(argument0){
	case 1: return "DOES NOTHING";
	default: return "";
}


#define race_ultra_button
// called by ultra mutation button on creation
// recieves ultra mutation index
switch(argument0){
	case 1: return mskNone;
}


#define race_ultra_take
// recieves ultra mutation index
// called when ultra for race is picked
// player of race may not be alive at the time


#define race_ttip
// return character-specific tooltips
return false;