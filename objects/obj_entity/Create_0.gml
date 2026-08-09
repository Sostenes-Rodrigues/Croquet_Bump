#region Variables
// Variavel de controle para saber se o poder estar habilitado nessa instancia
shoot_enable = false

// If I can use the power to throw myself
shoot_can = false

// Se eu ja atirei o poder
shoot_power = false

// Carregamento para usar o poder (o valor vai ser acrescentado ate um valor fixo no estado "thrown")
shoot_charge = 0

// Angulo atual da mira da entidade para o poder
ang_to_shoot = 0

//
percent_force = 1

//
coli = false


/// Rastro
timer_create_rastro_restart = 0.15 * FPS_GAME
timer_create_rastro = 0

///
timer_not_coli_restart = 1 * FPS_GAME
timer_not_coli = 0

//
percent_overload_power = 0


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
    /// Aplicando diferencas na forca de arremesso dependendo do tipo de inimigo
    if (image_index == IMAGE_INDEX_ENEMIES.FAIRY){
        percent_force *= 1.4
    }
    else if (image_index == IMAGE_INDEX_ENEMIES.SLIME){
        percent_force *= 0.6
    }
    
    /// Velocidade dado pela tacada
    hspeed = lengthdir_x(percent_force * global.force_shoot, image_angle) // Pego o hspeed e vspeed inicial, faco a porcentagem do atual e multiplico pela forca total
    vspeed = lengthdir_y(percent_force * global.force_shoot, image_angle)
    
    /// Motion distortion
    tween(id, "image_xscale", 1.7, my_tween_animation, 0)
    tween(id, "image_yscale", 0.5, my_tween_animation, 0)
    
    
    // Som da batida
    audio_play_sound(snd_sfx_hit, 5, false)
}

criando_rastro = function(){
    timer_create_rastro --
    
    if (timer_create_rastro <= 0){
        var _inst_rastro = instance_create_depth(x, y, depth + 1, obj_rastro)
        _inst_rastro.sprite_index = sprite_index
        _inst_rastro.image_index = image_index
    }
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
        
        //
        percent_force = 1
    }
    
    
    /// Carregando o poder
    if shoot_enable and (global.selected_entity == id){
        shoot_charge = clamp(shoot_charge + 1, 0, global.time_charge_power)
    }
    
    /// Colidindo com outras entidades
    if !coli and hspeed > 0{
        var _inst_coli_entity = instance_place(x, y, obj_entity)
        if _inst_coli_entity{
            // Se a instancia selecionada e diferente da instancia colidida
            if (global.selected_entity != _inst_coli_entity and (xstart != _inst_coli_entity.xstart or sprite_index != _inst_coli_entity.sprite_index)){
                // Agora a colidida e a instancia selecionada
                global.selected_entity = _inst_coli_entity
                
                // Para eu so poder colidir uma vez
                coli = true
                
                
                // Me destruindo
                instance_destroy(id)
                
                ///
                if (global.selected_entity.sprite_index == spr_boss_attack) and (global.selected_entity.image_index == 0){
                    instance_destroy(global.selected_entity)
                    cria_transicao_inicia(rm_menu)
                    exit
                }
                
                /// Aplico forca na nova instancia
                with (global.selected_entity) {
                    // Ela pode carregar o poder
                    shoot_enable = true
                    
                    // Parsando a porcentagem da minha forca restante
                    percent_force = other.percent_force
                    
                    // Passo o angulo entre as colisoes
                    image_angle = point_direction(other.x, other.y, x, y)
                    /// Se sou o inimigo de escudo, vario um pouco o angulo
                    if (image_index == IMAGE_INDEX_ENEMIES.SHIELD){
                        image_angle += choose(-25, -15, 15, 25)
                    }
                    
                    // Deixo ela no estado de arremesso
                    state = state_thrown
                    
                    
                    /// Destruindo as outras instancias da fileira
                    with (obj_enemy_father) {
                        // Se o x e igual ao meu
                        if (x == global.selected_entity.x){
                            // Se nao sou a que estar sendo arremecada
                            if (state != state_thrown){
                                instance_destroy(id)
                            }
                        }
                    }
                }
                            
                
                // Screenshake da batida no outro
                screenshake(global.screenshake_hit)
            }
        }
    }
    
    /// Desacelerando
    hspeed *= global.force_friction
    vspeed *= global.force_friction
    // Diminuindo a porcentagem da forca junto com as velocidades
    percent_force *= global.force_friction
    // Se basicamente parei
    if (abs(hspeed) < 0.08 and abs(vspeed) < 0.08){
        // Voltando ao estado parado
        state = state_idle
        
        /// Avisando que o jogador perdeu
        cria_transicao_inicia(rm_menu)
    }
    
    /// Motion distortion
    image_xscale = lerp(image_xscale, 1, 1 - global.force_friction)
    image_yscale = lerp(image_yscale, 1, 1 - global.force_friction)
    
    /// Impedindo que saia pela vertical
    if (y < 0){
        y = 0
        
        vspeed *= -1
        
        // Som da batida
        audio_play_sound(snd_sfx_hit, 5, false)
    }
    if (y > room_height){
        y = room_height
        
        vspeed *= -1
        
        // Som da batida
        audio_play_sound(snd_sfx_hit, 5, false)
    }
    
    
    // Efeito de rastro
    criando_rastro()
}


state = state_idle
state_txt_struct_strings = {
    idle: "idle",
    thrown: "thrown"
}
state_txt = ""
#endregion