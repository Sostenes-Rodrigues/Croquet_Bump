// Passando o tempo do delay
timer_delay_start = clamp(timer_delay_start - 1, 0, 2 * FPS_GAME)

/// Se posso comecar, posso atirar a bola
if (timer_delay_start <= 0) and can_shoot{
    // Se precionei o botao esquerdo do mouse
    if mouse_check_button_pressed(COMMAND_INTERACT){
        // Mudo para minha animacao de atirar
        sprite_index = array_sprites_shoot[array_sprites_shoot_ind]
        
        // Aciono a funcao de rodar o angulo (no draw)
        draw_sight = true
    }
    
    // Se soltei o botao do mouse
    if mouse_check_button_released(COMMAND_INTERACT){
        // Inpedindo que isso ocorra antes do teste de prescionar
        if draw_sight{
            // Inpedindo de atirar mais uma vez
            can_shoot = false
            // Paro a funcao de rodar o angulo (no draw)
            draw_sight = false
            
            // Comeco a animacao de atirar (ao acabar a bola e jogada)
            alarm[0] = 0.1 * FPS_GAME
        }
    }
}


/// Me destruindo quando eu sai da visao da camera
// Se sai pela parte esquerda da camera
if ((x + sprite_width) < camera_get_view_x(view_camera[0])){
    // Me destruo
    instance_destroy(id)
}