/// @description Initialize weapon variables and statistics


enum weaponType {
	ASSAULT, 
	BATTLE,
	LMG,
	MELEE,
	PISTOL,
	SHOTGUN,
	SMG, 
	SNIPER
}


// Create weapon array that will store the stats of each weapon, each weapon is represented as an array of maps
// Each map corresponds to a stat of that weapon.


weapons[0] = ds_map_create();