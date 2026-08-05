// Inside selected entity
with (global.selected_entity) {
    /// Estando no mesmo local da instancia selecionada
    other.x = x
    other.y = y
    
	/// Se o poder estar carregado
    if (shoot_charge >= global.time_charge_power){
        // Feedback que carregou o poder
        
        
        /// Ativando o poder pelo click direito do mouse
        if mouse_check_button_pressed(COMMAND_POWER){
            // Aciono a funcao de rodar o angulo (no draw)
            draw_sight = true
            
            /// Me paro
            hspeed = 0
            vspeed = 0
            
            /// Motion distortion
            tween(id, "image_xscale", 1, my_tween_animation, 1)
            tween(id, "image_yscale", 1, my_tween_animation, 1)
        }
        
        // Se soltei o botao do mouse
        if mouse_check_button_released(COMMAND_POWER){
            // Inpedindo que isso ocorra antes do teste de prescionar
            if draw_sight{
                // Paro a funcao de rodar o angulo (no draw)
                draw_sight = false
                
                // Aplicando os codigos do impacto
                apply_hit()
                
                // Feedback que soltou o poder
                
            }
        }
    }
}