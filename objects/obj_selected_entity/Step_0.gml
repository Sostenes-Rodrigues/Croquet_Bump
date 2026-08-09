// Inside selected entity
with (global.selected_entity) {
    /// Estando no mesmo local da instancia selecionada
    other.x = x
    other.y = y
    
    
    /// Feedback que carregou o poder
    if (shoot_charge == global.time_charge_power - 2){
        var _inst_effect = instance_create_depth(x, y, depth - 1, obj_effect_destroy_self)
        _inst_effect.sprite_index = spr_charge_power
        _inst_effect.image_alpha = 0.9
        _inst_effect.image_xscale = 2
        _inst_effect.image_yscale = 2
        _inst_effect.father = global.selected_entity
    }
    
	/// Se o poder estar carregado
    if (shoot_charge >= global.time_charge_power and !shoot_power){
        /// Ativando o poder pelo click direito do mouse
        if mouse_check_button_pressed(COMMAND_INTERACT){
            // Aciono a funcao de rodar o angulo (no draw)
            draw_sight = true
            
            /// Me paro
            state = state_idle
            
            /// Motion distortion
            tween(id, "image_xscale", 1, my_tween_animation, 20)
            tween(id, "image_yscale", 1, my_tween_animation, 20)
        }
        
        // Se soltei o botao do mouse
        if mouse_check_button_released(COMMAND_INTERACT){
            // Inpedindo que isso ocorra antes do teste de prescionar
            if draw_sight{
                // Paro a funcao de rodar o angulo (no draw)
                draw_sight = false
                
                //
                shoot_power = true
                
                // Passo o angulo definido
                image_angle = ang_to_shoot
                
                //
                percent_force = 1
                
                // Deixo ela no estado de arremesso
                state = state_thrown
                
                
                /// Feedback que soltou o poder
                audio_play_sound(snd_sfx_power, 10, false)
            }
        }
    }
}