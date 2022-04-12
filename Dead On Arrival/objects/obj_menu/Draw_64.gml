/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if (menu_active){

	draw_sprite_ext(sprite_index,image_index,0,0,menu_width div sprite_width + 1, menu_height div sprite_height,0,c_white,1)

	draw_set_font(fnt_menu)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)

	hovering = -1
	// draw the text, check if its selected by the mouse
	#region // draw weapon buttons
	for (var i = 0; i < array_length(menu_item); i ++){
		
		var weapon_name = menu_item[i][? "wep_name"]
		
		var text_x_percent = (3/4)
		var text_x = menu_width*text_x_percent - string_width(weapon_name)/2
		var text_y = op_border_height*2*i + op_space * i + op_y_offset
		var button_color = c_white
		var button_width = op_border_width*2
		var text_scale = 1
		
		
		
		// check if the player is hovering over a menu item
		if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
			menu_width*text_x_percent - op_border_width, text_y - op_border_height, menu_width*text_x_percent + op_border_width, text_y + string_height(weapon_name ) + op_border_height)
			){ //&& !scr_player_has_weapon(menu_item[i][? "wep_id"])){
			
			hovering = i
		}
		
		// if the mouse is hovering over the option, color the text and the button yellow
		if (hovering == i){
				draw_set_color(c_yellow)	
				button_width = op_border_width * 2.5
				text_scale = 1.1
		}
		
		draw_sprite_ext(spr_buy_menu_button,image_index,menu_width * text_x_percent - button_width/2,text_y - op_border_height,
		button_width / sprite_get_width(spr_buy_menu_button),  (op_border_height * 2 + op_space) / sprite_get_width(spr_buy_menu_button),0,button_color,1)
		
		if (scr_player_has_weapon(menu_item[i][? "wep_id"])){
			draw_set_color(c_green)
		}
			
		draw_text_transformed(text_x,text_y,weapon_name,text_scale,text_scale,0)
		draw_set_color(c_white)
		
	}
	#endregion
		

	if (hovering != -1){
		window_set_cursor(cr_handpoint)	
	} else{
		window_set_cursor(cr_arrow)	
	}
	
	var offset = 50
	
	// draw the icon of the selected item
	if (selected_item != noone){

		if (!scr_player_has_weapon(menu_item[selected_item][? "wep_id"])){
			scr_draw_icon(10,offset,global.camera_width/4,menu_item[selected_item][? "wep_silhouette"])
		} else{
			scr_draw_icon(10,offset,global.camera_width/4,menu_item[selected_item][? "wep_icon"])
		}
		draw_text(offset,offset,menu_item[selected_item][? "wep_name"])

		
	}
	
	offset += global.camera_width/4 + 25;
	var bar_offset_x = 180;
	var bar_offset_y = 20;
	var damage = obj_player_weapon.calibers[menu_item[selected_item][? "caliber"]][? "damage"];
	if (obj_player_weapon.calibers[menu_item[selected_item][? "caliber"]][? "number_of_shot"] > 1){
		damage *= obj_player_weapon.calibers[menu_item[selected_item][? "caliber"]][? "number_of_shot"]/2 
	}
	
	var penetration = obj_player_weapon.calibers[menu_item[selected_item][? "caliber"]][? "penetration"];
	
	var text_height = string_height("test");
	
	draw_text(10, offset, "Damage: ");
	draw_healthbar(bar_offset_x,offset + bar_offset_y,bar_offset_x + 120,offset+text_height-bar_offset_y, (damage/30)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height, "Penetration: ");
	draw_healthbar(bar_offset_x,offset+text_height+bar_offset_y,bar_offset_x + 120,offset+text_height*2-bar_offset_y, (penetration/4)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height*2, "Fire Rate: ");
	draw_healthbar(bar_offset_x,offset+text_height*2+bar_offset_y,bar_offset_x + 120,offset+text_height*3-bar_offset_y, (1/menu_item[selected_item][? "fire_delay"]/15)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height*3, "Accuracy: "  );
	draw_healthbar(bar_offset_x,offset+text_height*3+bar_offset_y,bar_offset_x + 120,offset + text_height*4-bar_offset_y, (1/menu_item[selected_item][? "spread"]/3.5)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height*4, "Reload Time: ");
	draw_healthbar(bar_offset_x,offset+text_height*4+bar_offset_y,bar_offset_x + 120,offset + text_height*5-bar_offset_y, (1/menu_item[selected_item][? "reload_time"]/1.5)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height*5, "Magazine Size: ");
	draw_healthbar(bar_offset_x,offset+text_height*5+bar_offset_y,bar_offset_x + 120,offset + text_height*6-bar_offset_y, (menu_item[selected_item][? "mag_capacity"]/50)*100,c_black,c_red,c_lime,0,true,true );
	
	draw_text(10, offset + text_height*6, "Maneuverability: ");
	draw_healthbar(bar_offset_x,offset+text_height*6+bar_offset_y,bar_offset_x + 120,offset + text_height*7-bar_offset_y, ((menu_item[selected_item][? "wep_weight"] - .25)/1.00)*100,c_black,c_red,c_lime,0,true,true );
	
	// Draw the weapon statistics and the buy button

	if (selected_item != noone){
		if (!scr_player_has_weapon(menu_item[selected_item][? "wep_id"])){ // If the player already has the weapon, sell ammo instead
			
			
			draw_text_transformed(global.camera_width/3,offset, "Cost: " + scr_money_format(menu_item[selected_item][? "wep_cost"]) , 1.5,1.5,0)

			draw_set_color(c_white)
			
			scr_draw_clickable_button(global.camera_width*(2/5),global.camera_height*(3/5),"BUY", fnt_menu, 32, 16, function(){
				scr_buy_weapon(menu_item[selected_item], menu_item[selected_item][? "wep_cost"])})
				
		} else{
			var mag_size = menu_item[selected_item][? "mag_capacity"]
			var mag_cost = obj_player_weapon.calibers[menu_item[selected_item][? "caliber"]][? "cost_per_shot"] * mag_size
			
			draw_text_transformed(global.camera_width/3,offset, "Cost for 1 magazine: " + scr_money_format(mag_cost) , 1.5,1.5,0)
			
			scr_draw_clickable_button(global.camera_width*(2/5),global.camera_height*(3/5),"BUY AMMO", fnt_menu, 32, 16, function(){
				
				
				var mag_size = menu_item[selected_item][? "mag_capacity"]
				var mag_cost = obj_player_weapon.calibers[menu_item[selected_item][? "caliber"]][? "cost_per_shot"] * mag_size
				if (mag_cost <= global.playerMoney){
					scr_drain_money(mag_cost)
					obj_player_weapon.ammunition[menu_item[selected_item]][1] += mag_size
				}
			})
		}
	}
}
else{ 
	window_set_cursor(cr_none)	
	hovering = -1
	selected_item = weapon.DEAGLE
}

