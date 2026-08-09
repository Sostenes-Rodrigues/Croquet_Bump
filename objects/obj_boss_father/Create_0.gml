timer_invi_restart = 2 * FPS_GAME
timer_invi = 0


// Metodo para quando uma parte explodir
explodir_parte = function(_obj){
    with (global.selected_entity) {
    	x = _obj.x
        y = _obj.y
        
        sprite_index = _obj.sprite_index
        image_index = 0
        
        /// Jogando para longe a entidade selecionada
        var _dir = point_direction(x, y, x - 1000, room_height / 2)
        hspeed = lengthdir_x(75, _dir)
        vspeed = lengthdir_y(75, _dir)
        
        
        /// Motion distortion
        tween(id, "image_xscale", 1.7, my_tween_animation, 0)
        tween(id, "image_yscale", 0.5, my_tween_animation, 0)
        
        
        // Som da batida
        audio_play_sound(snd_sfx_hit, 5, false)
        
        /// Salvando a escala da batida
        xscale_destiny_save = image_xscale
        yscale_destiny_save = image_yscale
        
        
        // Se eu ja atirei o poder
        shoot_power = false
        
        // Carregamento para usar o poder (o valor vai ser acrescentado ate um valor fixo no estado "thrown")
        shoot_charge = 0
    }
    
    
    /// Criando dois rounds
    // Criando a primeira fileira de inimigos
    obj_control.create_round(x - 500, obj_control.creation_fist_pos_y, "walk", true)
    // Criando a segunda fileira de inimigos
    obj_control.create_round(x - 1550, obj_control.creation_fist_pos_y, "walk", true)
    
    
    // Destruindo essa parte
    instance_destroy(_obj)
}

// Metodo para quando o boss for derrotado
defeated_boss = function(){
    show_message("Ganhou")
}