/// Passando pela animacao
array_sprites_shoot_ind ++

// Ainda tem frames da animacao
if (array_sprites_shoot_ind < array_length(array_sprites_shoot)){
    alarm[0] = 0.1 * FPS_GAME
    
    sprite_index = array_sprites_shoot[array_sprites_shoot_ind]
}
// Chegou no ultimo frame
else {
	/// Aplico forca na bola
    with (global.selected_entity) {
        // Passo o angulo definido
        image_angle = other.ang_to_shoot
        
        // Deixo ela no estado de arremesso
        state = state_thrown
    }
    
    // Dou um screenshake
    screenshake(global.screenshake_shoot)
}