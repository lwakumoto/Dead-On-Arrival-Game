/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if (menu_active){

	draw_sprite_ext(sprite_index,image_index,0,0,menu_width div sprite_width + 1, menu_height div sprite_height,0,c_white,1)

	draw_set_valign(fa_center)
	draw_set_halign(fa_center)
	draw_set_font(fnt_Tier)
	var tier_text = ""
	switch(curr_menu){
		case 0:
			draw_set_color(c_white)
			tier_text = "Tier I"
			break;
		case 1:
			tier_text = "Tier II"
			draw_set_color(c_blue)
			break;
		case 2:
			tier_text = "Tier III"
			draw_set_color(c_orange)
			break;
	}
	
	draw_text(global.camera_width*(3/4),global.camera_height/7," < Q     " + tier_text + "     E >")
	
	draw_set_color(c_white)

	draw_set_font(fnt_menu)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)

	hovering = -1
	

	window_set_cursor(cr_arrow)	
	
	
	// draw the text, check if its selected by the mouse

	
	#region // draw weapon buttons
	for (var i = 0; i < array_length(menu_item[curr_menu]); i ++){
		var weapon_name = menu_item[curr_menu][i][? "wep_name"]
		var button_start_y = global.camera_height/3
		var button_height = string_height("Test") + 25
		var padding = 10
		curr_selected_weapon = i
		
		if (scr_player_has_weapon(menu_item[curr_menu][i][? "wep_id"])){
			draw_set_color(c_green)
		}
		
		scr_draw_clickable_button_absolute(fa_middle,fa_middle,global.camera_width*(3/4),button_start_y + button_height*i + padding*i,weapon_name,
		fnt_menu,200,button_height,
		function(){selected_item = curr_selected_weapon})
	
	}
	
	#endregion
		


	
	var offset = 50
	
	// draw the icon of the selected item
	if (selected_item != noone){

		if (!scr_player_has_weapon(menu_item[curr_menu][selected_item][? "wep_id"])){
			scr_draw_icon(10,offset,global.camera_width/4,menu_item[curr_menu][selected_item][? "wep_silhouette"])
		} else{
			scr_draw_icon(10,offset,global.camera_width/4,menu_item[curr_menu][selected_item][? "wep_icon"])
		}
		draw_text(offset,offset,menu_item[curr_menu][selected_item][? "wep_name"])

		
	}
	#region // draw weapon stats	
	offset += global.camera_width/4 + 25;
	var bar_offset_x = 180;
	var bar_offset_y = 20;
	var damage = obj_player_weapon.calibers[menu_item[curr_menu][selected_item][? "caliber"]][? "damage"];
	var damage_str = string(damage)
	if (obj_player_weapon.calibers[menu_item[curr_menu][selected_item][? "caliber"]][? "number_of_shot"] > 1){
		damage *= obj_player_weapon.calibers[menu_item[curr_menu][selected_item][? "caliber"]][? "number_of_shot"]/2 
		damage_str = damage_str + "x" + string(obj_player_weapon.calibers[menu_item[curr_menu][selected_item][? "caliber"]][? "number_of_shot"])
		
	}
	
	var penetration = obj_player_weapon.calibers[menu_item[curr_menu][selected_item][? "caliber"]][? "penetration"];
	
	var text_height = string_height("test");
	
	draw_text(10, offset, "Damage: " + damage_str);
	//draw_healthbar(bar_offset_x,offset + bar_offset_y,bar_offset_x + 120,offset+text_height-bar_offset_y, (damage/30)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height, "Penetration: " + string(penetration));
	//draw_healthbar(bar_offset_x,offset+text_height+bar_offset_y,bar_offset_x + 120,offset+text_height*2-bar_offset_y, (penetration/4)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height*2, "Fire Rate: " + string(room_speed/menu_item[curr_menu][selected_item][? "fire_delay"]));
	//draw_healthbar(bar_offset_x,offset+text_height*2+bar_offset_y,bar_offset_x + 120,offset+text_height*3-bar_offset_y, (1/menu_item[curr_menu][selected_item][? "fire_delay"]/15)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height*3, "Spread: " + string(menu_item[curr_menu][selected_item][? "spread"]) );
	//draw_healthbar(bar_offset_x,offset+text_height*3+bar_offset_y,bar_offset_x + 120,offset + text_height*4-bar_offset_y, (1/menu_item[curr_menu][selected_item][? "spread"]/3.5)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height*4, "Reload Time: " + string(menu_item[curr_menu][selected_item][? "reload_time"]));
	//draw_healthbar(bar_offset_x,offset+text_height*4+bar_offset_y,bar_offset_x + 120,offset + text_height*5-bar_offset_y, (1/menu_item[curr_menu][selected_item][? "reload_time"]/1.5)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height*5, "Magazine Size: " + string(menu_item[curr_menu][selected_item][? "mag_capacity"]));
	//draw_healthbar(bar_offset_x,offset+text_height*5+bar_offset_y,bar_offset_x + 120,offset + text_height*6-bar_offset_y, (menu_item[curr_menu][selected_item][? "mag_capacity"]/50)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height*6, "Maneuverability: " + string(menu_item[curr_menu][selected_item][? "wep_weight"]));
	//draw_healthbar(bar_offset_x,offset+text_height*6+bar_offset_y,bar_offset_x + 120,offset + text_height*7-bar_offset_y, ((menu_item[curr_menu][selected_item][? "wep_weight"] - .25)/1.00)*100,c_black,c_red,c_lime,0,true,true );
#endregion	

	// draw weapon description
	draw_set_color(c_grey)
	draw_set_alpha(0.5)
	draw_rectangle(0,offset + text_height*7.5, 450, global.camera_height,false)

	draw_set_color(c_white)
	draw_set_alpha(1.0)
	draw_text_ext(10,offset + text_height*8,string(menu_item[curr_menu][selected_item][? "wep_description"]),text_height, 440)
	// Draw the weapon statistics and the buy button

	if (selected_item != noone){
		if (!scr_player_has_weapon(menu_item[curr_menu][selected_item][? "wep_id"])){ // If the player already has the weapon, sell ammo instead
			
			
			draw_text_transformed(global.camera_width/3,offset, "Cost: " + scr_money_format(menu_item[curr_menu][selected_item][? "wep_cost"]) , 1.5,1.5,0)

			draw_set_color(c_white)
			
			scr_draw_clickable_button(global.camera_width*(2/5),global.camera_height*(3/5),"BUY", fnt_menu, 32, 16, function(){
				scr_buy_weapon(menu_item[curr_menu][selected_item], menu_item[curr_menu][selected_item][? "wep_cost"])})
				
		} else{
			var mag_size = menu_item[curr_menu][selected_item][? "mag_capacity"]
			var mag_cost = obj_player_weapon.calibers[menu_item[curr_menu][selected_item][? "caliber"]][? "cost_per_shot"] * mag_size
			
			draw_text_transformed(global.camera_width/3,offset, "1 magazine: " + scr_money_format(mag_cost) , 1.5,1.5,0)
			
			scr_draw_clickable_button(global.camera_width*(2/5),offset + text_height + 32,"BUY AMMO", fnt_menu, 32, 16, function(){
				var mag_size = menu_item[curr_menu][selected_item][? "mag_capacity"]
				var mag_cost = obj_player_weapon.calibers[menu_item[curr_menu][selected_item][? "caliber"]][? "cost_per_shot"] * mag_size

				if (scr_drain_money(mag_cost)){
					obj_player_weapon.ammunition[menu_item[curr_menu][selected_item]][1] += mag_size
				}
					
				
			})
			
			draw_text_transformed(global.camera_width/3,offset + (text_height + 32)*2, "3 magazines: " + scr_money_format(mag_cost*3) , 1.5,1.5,0)
			
			scr_draw_clickable_button(global.camera_width*(2/5),offset + (text_height + 32)*3,"BUY AMMO", fnt_menu, 32, 16, function(){
				var mag_size = menu_item[curr_menu][selected_item][? "mag_capacity"]
				var mag_cost = obj_player_weapon.calibers[menu_item[curr_menu][selected_item][? "caliber"]][? "cost_per_shot"] * mag_size

				if (scr_drain_money(mag_cost*3)){
					obj_player_weapon.ammunition[menu_item[curr_menu][selected_item]][1] += mag_size*3
				}
	
				
			})
			draw_text_transformed(global.camera_width/3,offset + (text_height + 32)*4, "5 magazines: " + scr_money_format(mag_cost*5) , 1.5,1.5,0)
			
			scr_draw_clickable_button(global.camera_width*(2/5),offset + (text_height + 32)*5,"BUY AMMO", fnt_menu, 32, 16, function(){
				var mag_size = menu_item[curr_menu][selected_item][? "mag_capacity"]
				var mag_cost = obj_player_weapon.calibers[menu_item[curr_menu][selected_item][? "caliber"]][? "cost_per_shot"] * mag_size
				if (scr_drain_money(mag_cost*5)){
					obj_player_weapon.ammunition[menu_item[curr_menu][selected_item]][1] += mag_size*5
				}
				
				
			})
			
		}
	}
}
else{ 
	window_set_cursor(cr_none)	
	hovering = -1
	selected_item = 0
}

