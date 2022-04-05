/// @description Destroy particle systems to avoid memory leaks

part_system_destroy(global.particle_system)
part_system_destroy(global.explosion_system)
part_system_destroy(global.blood_particle)
part_system_destroy(global.smear_particle)

part_type_destroy(global.explosion_center_part)
part_type_destroy(global.explosion_particle_part)
part_type_destroy(global.smoke_particle_part)
