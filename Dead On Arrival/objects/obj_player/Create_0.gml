/// @description Insert description here
// You can write your code in this editor


#region // create and initialize player weapon
player_weapon = instance_create_layer(x,y,"Instances",obj_player_weapon)
player_weapon.owner = id
weapon_inventory = ds_list_create()

ds_list_add(weapon_inventory,weapon.HI_POINT)

//ds_list_add(weapon_inventory,weapon.DEAGLE,weapon.STONER,weapon.G3A1,weapon.INTERVENTION,weapon.MK18,weapon.MP5K,weapon.SPAS)

//weapon_inventory = [weapon.DEAGLE, weapon.MK18, weapon.G3A1, weapon.SPAS, weapon.MP5K,weapon.INTERVENTION, weapon.STONER]
current_weapon = 0

with (player_weapon){
	scr_change_weapon(other.weapon_inventory[| other.current_weapon])
}
#endregion

max_hp = 250
curr_hp = max_hp
regen_health_rate = 5 // health regenerated per second

player_spd = 5


// create audio emitter for 3D sounds
audio_listener_set_position(0,x,y,0);
audio_listener_set_orientation(0,0,1,0,0,0,1);

walk_timer = 20
curr_walk_timer = walk_timer

mainEmitter = audio_emitter_create()
