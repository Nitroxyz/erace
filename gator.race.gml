#define init
// character select button
global.sprMenuButton = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAYAAADzoH0MAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACOSURBVDhPYwCC/9jw231BRGGgWgoNmNua9B8bJtYgyg24cHTLf3yYkEGUG4DN+dgwLoMoNwCbs5Ex7Q2ASaDjPxaoGCZOPwNIwFgFice2GvL/QTjfw5IkTD0DsEkSgzFcgAtj0wzC1DMAmyQ+DDOYegbA0jxMApsmEEbXCE+JFBsAy23oGKYBl0YIDvoPABoXHHo1+L+9AAAAAElFTkSuQmCCAAAAAAAAAA==", 1, 0, 0);

global.sprPortrait = sprite_add("sprites/sprPortraitGator.png", 1, 20, 205);

#define create
// player instance creation of this race
// https://bitbucket.org/YellowAfterlife/nuclearthronetogether/wiki/Scripting/Objects/Player

// sprites
spr_idle = sprGatorIdleSmoke;
spr_walk = sprGatorWalk;
spr_hurt = sprGatorHurt;
spr_dead = sprGatorDead;
spr_sit1 = sprMutant15GoSit;
spr_sit2 = sprMutant15Sit;

// sounds
snd_hurt = sndGatorHit;
snd_dead = sndGatorDie;

// stats
maxspeed = 2.8;
team = 2;
maxhealth = 12;
melee = 0;	// can melee or not
weapon_custom_delay = -1; //for shotgun delay
s = 45; //smoking

#define game_start
// executed after picking race and starting for each player picking this race
// player-specific global variable init


#define step
// executed within each player instance of this race after step
// most actives and passives handled here
canswap = 0;
canpick = 0;

// smoking at the start of the level
s--;
if(sprite_index = sprGatorIdleSmoke){
	if(s <= 0){
		spr_idle = sprGatorSmoke;
	}
}

if(sprite_index = sprGatorWalk){
	spr_idle = sprGatorIdle;
}

// ULTRA A: EVOLUTION - BUFF GATOR
if (ultra_get("gator",1) = 1){
	if (player_get_race(index) == "gator"){
		player_set_race(index, "buffgator");
		race = "buffgator";
		wep = "gator_flakcannon"
	}
}

// ULTRA B: SHOOTIER SHOTGUN
if (ultra_get("gator",2) = 1){
	wep = "gator_autoshotgun";
}

#define race_name
// return race name for character select and various menus
return "Gator";


#define race_text
// return passive and active for character selection screen
return "GREEN AND MEAN";


#define race_portrait
// return portrait for character selection screen and pause menu
return global.sprPortrait;


#define race_mapicon
// return sprite for loading/pause menu map
return sprMapIconChickenHeadless;


#define race_swep
// return ID for race starting weapon
return "gator_shotgun";


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
return sprMapIconChickenHeadless;


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
	case 1: return "BUFF";
	case 2: return "ARSENAL";
	default: return "";
}


#define race_ultra_text
// recieves ultra mutation index and returns description
switch(argument0){
	case 1: return "MAXIMUM MUSCULATURE";
	case 2: return "RAPID FIRE";
	default: return "";
}


#define race_ultra_button
// called by ultra mutation button on creation
// recieves ultra mutation index
switch(argument0){
	case 1: return mskNone;
	case 2: return mskNone;
}


#define race_ultra_take
// recieves ultra mutation index
// called when ultra for race is picked
// player of race may not be alive at the time


#define race_ttip
// return character-specific tooltips
return choose("Chomp", "Smells like home", "Tail whip", "Watch the tail");