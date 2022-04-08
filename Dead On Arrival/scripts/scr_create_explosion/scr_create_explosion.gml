// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// create an explosion and hurt players and enemies within its radius
function scr_create_explosion(xx,yy,explosion_radius,explosion_damage, damage_fallof){
	
	var _damage_done = 0
	scr_create_explosion_particle(xx,yy)
	// we get the list of all enemies and calculate how much damage each take
	var _list = ds_list_create()
	var _num  = collision_circle_list(xx,yy,explosion_radius,obj_enemy_parent,true,false,_list,false)
	if (_num > 0){
		for (var i = 0; i < _num; i ++){
			var _entity = _list[| i]
			if (!collision_line(xx,yy,_entity.x,_entity.y,obj_obstacle,true,true)){
				var _distance_from_explosion = point_distance(_entity.x,_entity.y,xx,yy)
				_damage_done = abs(-damage_fallof * power(_distance_from_explosion,2) + explosion_damage) // damage is subject to damage fallof
				if (_entity.hp <= _damage_done){
					scr_enemy_die(xx,yy,_entity,true)
				}
				else{
					scr_enemy_hurt(_entity,_damage_done)
				}
				
			}
		}
	}
	
	// now calculate damage for the player
	if (instance_exists(obj_player)){
		if (collision_circle(xx,yy,explosion_radius,obj_player,true,true) && !collision_line(xx,yy,obj_player.x,obj_player.y,obj_obstacle,true,true)){
			var _distance_from_explosion = point_distance(obj_player.x,obj_player.y,xx,yy)
			_damage_done = -damage_fallof * power(_distance_from_explosion,2) + explosion_damage // damage is subject to damage fallof
			scr_player_hurt(obj_player,abs(_damage_done))
		}
	}
	
	ds_list_destroy(_list)
	return _damage_done
}