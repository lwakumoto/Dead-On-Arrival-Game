/// @description IRemove all dyanmic structures to avoid memory leaks

for (var i = 0; i < array_length(casings_particles); i ++){
	part_type_destroy(casings_particles[i])
}