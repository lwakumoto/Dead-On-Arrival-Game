/// @description Create the explosion particles
// create the particles
part_particles_create(global.explosion_system,
	x + random_range(-8,8), y + random_range(-8,8), global.explosion_particle_part,1)
	
part_particles_create(global.explosion_system,
	x + random_range(-8,8), y + random_range(-8,8), global.smoke_particle_part,1)
	
// destroy the piece
if (speed == 0){
	instance_destroy()	
}
