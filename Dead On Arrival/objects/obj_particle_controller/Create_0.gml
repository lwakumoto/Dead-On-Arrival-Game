/// @description Initialize the different particles we will be using
global.particle_system = part_system_create_layer("Floor",true);
global.explosion_system = part_system_create_layer("Instances",true);




global.blood_particle = scr_create_blood_system(spr_blood_puddle)
global.smear_particle = scr_create_blood_system(spr_smear)

// create 3 particles
global.explosion_center_part = scr_create_part_type(spr_explosion_center, true, 30, 30, .6, 1, -0.001);
global.explosion_particle_part = scr_create_part_type(spr_explosion_particle, true, 15, 20, .5, 1, -.01);
global.smoke_particle_part = scr_create_part_type(spr_smoke_particle, true, 15, 15, .5, 1, -.01)
