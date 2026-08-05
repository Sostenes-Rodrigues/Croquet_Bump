#region Variables
// Variavel de controle para saber se o poder estar habilitado nessa instancia
shoot_enable = false

// If I can use the power to throw myself
shoot_can = false

// Carregamento para usar o poder (o valor vai ser acrescentado ate um valor fixo no estado "thrown")
shoot_charge = 0


// Variavel de controle para rodar a funcao de carga da mira
draw_sight = false
#endregion

#region Effect Stretch and Squash
scale_distortion_max = 1.15
scale_distortion_min = 0.85

xscale_destiny = scale_distortion_max
yscale_destiny = scale_distortion_min

my_tween_animation = tween_animation.back

time_effect_stretch_squash = 0.6 * FPS_GAME

xscale_destiny_save = 0
yscale_destiny_save = 0

effect_stretch_squash = function(){
    if (xscale_destiny > 1){
        xscale_destiny = scale_distortion_min
        yscale_destiny = scale_distortion_max
    }
    else {
    	xscale_destiny = scale_distortion_max
        yscale_destiny = scale_distortion_min
    }
}
#endregion

#region Other functions
apply_hit = function(){
    /// Velocidade dado pela tacada
    hspeed = lengthdir_x(global.force_shoot, image_angle)
    vspeed = lengthdir_y(global.force_shoot, image_angle)
    
    /// Motion distortion
    tween(id, "image_xscale", 1.7, my_tween_animation, 0)
    tween(id, "image_yscale", 0.5, my_tween_animation, 0)
}
#endregion


#region States
state_idle= function(){
    // If is the fist time in this state
    if (state_txt != state_txt_struct_strings.idle){
        state_txt = state_txt_struct_strings.idle
        
        /// Stop
        hspeed = 0
        vspeed = 0
        
        /// Motion distortion
        tween(id, "image_xscale", 1, my_tween_animation, 1)
        tween(id, "image_yscale", 1, my_tween_animation, 1)
    }
}


state_thrown = function(){
    // If is the fist time in this state
    if (state_txt != state_txt_struct_strings.thrown){
        state_txt = state_txt_struct_strings.thrown
        
        // Aplicando os codigos do impacto
        apply_hit()
        
        /// Salvando a escala da batida
        xscale_destiny_save = image_xscale
        yscale_destiny_save = image_yscale
    }
    
    
    /// Carregando o poder
    if shoot_enable and (global.selected_entity == id){
        shoot_charge = clamp(shoot_charge + 1, 0, global.time_charge_power)
    }
    
    /// Colidindo com outras entidades
    var _inst_coli_entity = instance_place(x, y, obj_entity)
    if _inst_coli_entity{
        if (global.selected_entity != _inst_coli_entity){
            global.selected_entity = _inst_coli_entity
            
            // Screenshake da batida no outro
            screenshake(global.screenshake_hit)
        }
    }
    
    /// Desacelerando
    hspeed *= global.force_friction
    vspeed *= global.force_friction
    if (hspeed < 0.08 and vspeed < 0.08){
        // Voltando ao estado parado
        state = state_idle
        
        // Avisando que o jogador perdeu
        image_blend = c_red
    }
    
    /// Motion distortion
    image_xscale = lerp(image_xscale, 1, 1 - global.force_friction)
    image_yscale = lerp(image_yscale, 1, 1 - global.force_friction)
    
    
    // Efeito de rastro
    
}


state = state_idle
state_txt_struct_strings = {
    idle: "idle",
    thrown: "thrown"
}
state_txt = ""
#endregion